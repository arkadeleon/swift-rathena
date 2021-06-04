// Copyright (c) rAthena Dev Teams - Licensed under GNU GPL
// For more information, see LICENCE in the main folder

#include "sql.hpp"

#ifdef WIN32
#include "winapi.hpp"
#endif

#include <sqlite3.h>
#include <stdlib.h>// strtoul

#include <CommonCrypto/CommonDigest.h>
#include <CoreFoundation/CoreFoundation.h>

#include "cbasetypes.hpp"
#include "malloc.hpp"
#include "showmsg.hpp"
#include "strlib.hpp"
#include "timer.hpp"

#define SQL_CONF_NAME "conf/inter_athena.conf"

void ra_mysql_error_handler(unsigned int ecode);

int mysql_reconnect_type;
unsigned int mysql_reconnect_count;

/// Sql row
struct SqlRow
{
	sqlite3_value** values;
	SqlRow* next;
};



/// Sql result
struct SqlResult
{
	int row_count;
	int column_count;
	SqlRow* rows;
	SqlRow* current_row;
	bool eof;
};


/// Sql bind
struct SqlBind
{
	SqlDataType buffer_type;
	void* buffer;
	size_t buffer_length;
	uint32* length;
	int8* is_null;
};



/// Sql handle
struct Sql
{
	StringBuf buf;
	sqlite3* db;
	SqlResult* result;
	int keepalive;
};



/// Sql statement
struct SqlStmt
{
	StringBuf buf;
	sqlite3* db;
	sqlite3_stmt* stmt;
	SqlResult* result;
	SqlBind *params;
	SqlBind *columns;
	size_t max_params;
	size_t max_columns;
	bool bind_params;
	bool bind_columns;
};



///////////////////////////////////////////////////////////////////////////////
// Sql Function
///////////////////////////////////////////////////////////////////////////////



void sqlite_md5(sqlite3_context *context, int argc, sqlite3_value **argv)
{
	const char *data = (const char *)sqlite3_value_text(argv[0]);
	unsigned char md[CC_MD5_DIGEST_LENGTH];
	CC_MD5(data, (uint32_t)strlen(data), md);

	char result[CC_MD5_DIGEST_LENGTH * 2 + 1];
	sprintf(result, "%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", md[0], md[1], md[2], md[3], md[4], md[5], md[6], md[7], md[8], md[9], md[10], md[11], md[12], md[13], md[14], md[15]);
	sqlite3_result_text(context, result, -1, SQLITE_TRANSIENT);
}



void sqlite_rand(sqlite3_context *context, int argc, sqlite3_value **argv)
{
	double rand = (((double)(arc4random() % ((unsigned)RAND_MAX + 1)) / RAND_MAX));
	sqlite3_result_double(context, rand);
}



void sqlite_sha256(sqlite3_context *context, int argc, sqlite3_value **argv)
{
	const char *data = (const char *)sqlite3_value_text(argv[0]);
	unsigned char md[CC_SHA256_DIGEST_LENGTH];
	CC_SHA256(data, (uint32_t)strlen(data), md);

	char result[CC_SHA256_DIGEST_LENGTH * 2 + 1];
	sprintf(result, "%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", md[0], md[1], md[2], md[3], md[4], md[5], md[6], md[7], md[8], md[9], md[10], md[11], md[12], md[13], md[14], md[15], md[16], md[17], md[18], md[19], md[20], md[21], md[22], md[23], md[24], md[25], md[26], md[27], md[28], md[29], md[30], md[31]);
	sqlite3_result_text(context, result, -1, SQLITE_TRANSIENT);
}



void sqlite_uuid(sqlite3_context *context, int argc, sqlite3_value **argv)
{
	CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
	CFStringRef string = CFUUIDCreateString(kCFAllocatorDefault, uuid);
	const char *cString = CFStringGetCStringPtr(string, kCFStringEncodingASCII);
	sqlite3_result_text(context, cString, -1, SQLITE_TRANSIENT);
	CFRelease(string);
	CFRelease(uuid);
}



///////////////////////////////////////////////////////////////////////////////
// Sql Handle
///////////////////////////////////////////////////////////////////////////////



static void Sql_P_StmtExecute(sqlite3_stmt* stmt, SqlResult** result)
{
	int row_count = 0;
	int column_count = sqlite3_column_count(stmt);
	SqlRow* first_row = NULL;
	SqlRow* last_row = NULL;

	while( sqlite3_step(stmt) == SQLITE_ROW )
	{
		sqlite3_value** values;
		CREATE(values, sqlite3_value*, column_count);

		for( int column = 0; column < column_count; column++ )
		{
			sqlite3_value* value = sqlite3_column_value(stmt, column);
			values[column] = sqlite3_value_dup(value);
		}

		SqlRow* row;
		CREATE(row, SqlRow, 1);
		row->values = values;
		row->next = NULL;

		if (last_row != NULL) {
			last_row->next = row;
		}

		if (first_row == NULL) {
			first_row = row;
		}

		last_row = row;

		row_count++;
	}

	CREATE(*result, SqlResult, 1);
	(*result)->row_count = row_count;
	(*result)->column_count = column_count;
	(*result)->rows = first_row;
	(*result)->current_row = NULL;
	(*result)->eof = false;
}



static void Sql_P_FreeResult(SqlResult* result)
{
	if( result == NULL )
		return;

	SqlRow* row = result->rows;
	while( row )
	{
		SqlRow* next = row->next;

		for( int column = 0; column < result->column_count; column++ )
		{
			sqlite3_value* value = row->values[column];
			sqlite3_value_free(value);
		}
		aFree(row->values);
		aFree(row);

		row = next;
	}

	aFree(result);
}



static void Sql_P_FetchRow(SqlResult* result)
{
	if( result->current_row == NULL )
	{
		if( result->eof == false )
		{
			result->current_row = result->rows;
			if( result->current_row == NULL )
				result->eof = true;
		}
	}
	else
	{
		result->current_row = result->current_row->next;
		if( result->current_row == NULL )
			result->eof = true;
		else
			result->eof = false;
	}
}



/// Allocates and initializes a new Sql handle.
Sql* Sql_Malloc(void)
{
	Sql* self;

	CREATE(self, Sql, 1);
	StringBuf_Init(&self->buf);
	self->db = NULL;
	self->result = NULL;
	self->keepalive = INVALID_TIMER;
	return self;
}


/**
 * Retrieves the last error number.
 * @param self : sql handle
 * @return last error number
 */
unsigned int Sql_GetError( Sql* self ){
	return sqlite3_errcode( self->db );
}

static int Sql_P_Keepalive(Sql* self);

/**
 * Establishes a connection to schema
 * @param self : sql handle
 * @param user : username to access
 * @param passwd : password
 * @param host : hostname
 * @param port : port
 * @param db : schema name
 * @return 
 */
int Sql_Connect(Sql* self, const char* user, const char* passwd, const char* host, uint16 port, const char* db)
{
	if( self == NULL )
		return SQL_ERROR;

	StringBuf_Clear(&self->buf);
	char filename[80];
	strcpy(filename, db);
	strcat(filename, ".sqlite3");
	if( sqlite3_open(filename, &self->db) != SQLITE_OK )
	{
		ShowSQL("%s\n", sqlite3_errmsg(self->db));
		return SQL_ERROR;
	}

	sqlite3_create_function(self->db, "md5", 1, SQLITE_UTF8, NULL, sqlite_md5, NULL, NULL);
	sqlite3_create_function(self->db, "rand", 0, SQLITE_UTF8, NULL, sqlite_rand, NULL, NULL);
	sqlite3_create_function(self->db, "sha256", 1, SQLITE_UTF8, NULL, sqlite_sha256, NULL, NULL);
	sqlite3_create_function(self->db, "uuid", 0, SQLITE_UTF8, NULL, sqlite_uuid, NULL, NULL);

	self->keepalive = Sql_P_Keepalive(self);
	if( self->keepalive == INVALID_TIMER )
	{
		ShowSQL("Failed to establish keepalive for DB connection!\n");
		return SQL_ERROR;
	}

	return SQL_SUCCESS;
}



/// Retrieves the timeout of the connection.
int Sql_GetTimeout(Sql* self, uint32* out_timeout)
{
	if( self && out_timeout )
	{
		*out_timeout = 28800;
		return SQL_SUCCESS;
	}
	return SQL_ERROR;
}



/// Retrieves the name of the columns of a table into out_buf, with the separator after each name.
int Sql_GetColumnNames(Sql* self, const char* table, char* out_buf, size_t buf_len, char sep)
{
	char* data;
	size_t len;
	size_t off = 0;

	if( self == NULL || SQL_ERROR == Sql_Query(self, "EXPLAIN `%s`", table) )
		return SQL_ERROR;

	out_buf[off] = '\0';
	while( SQL_SUCCESS == Sql_NextRow(self) && SQL_SUCCESS == Sql_GetData(self, 0, &data, &len) )
	{
		len = strnlen(data, len);
		if( off + len + 2 > buf_len )
		{
			ShowDebug("Sql_GetColumns: output buffer is too small\n");
			*out_buf = '\0';
			return SQL_ERROR;
		}
		memcpy(out_buf+off, data, len);
		off += len;
		out_buf[off++] = sep;
	}
	out_buf[off] = '\0';
	Sql_FreeResult(self);
	return SQL_SUCCESS;
}



/// Changes the encoding of the connection.
int Sql_SetEncoding(Sql* self, const char* encoding)
{
	if( self && Sql_Query(self, "SET NAMES %s", encoding) == 0 )
		return SQL_SUCCESS;
	return SQL_ERROR;
}



/// Pings the connection.
int Sql_Ping(Sql* self)
{
	return SQL_SUCCESS;
}



/// Wrapper function for Sql_Ping.
///
/// @private
static TIMER_FUNC(Sql_P_KeepaliveTimer){
	Sql* self = (Sql*)data;
	ShowInfo("Pinging SQL server to keep connection alive...\n");
	Sql_Ping(self);
	return 0;
}



/// Establishes keepalive (periodic ping) on the connection.
///
/// @return the keepalive timer id, or INVALID_TIMER
/// @private
static int Sql_P_Keepalive(Sql* self)
{
	uint32 timeout, ping_interval;

	// set a default value first
	timeout = 28800; // 8 hours

	// request the timeout value from the mysql server
	Sql_GetTimeout(self, &timeout);

	if( timeout < 60 )
		timeout = 60;

	// establish keepalive
	ping_interval = timeout - 30; // 30-second reserve
	//add_timer_func_list(Sql_P_KeepaliveTimer, "Sql_P_KeepaliveTimer");
	return add_timer_interval(gettick() + ping_interval*1000, Sql_P_KeepaliveTimer, 0, (intptr_t)self, ping_interval*1000);
}



/// Escapes a string.
size_t Sql_EscapeString(Sql* self, char *out_to, const char *from)
{
	return Sql_EscapeStringLen(self, out_to, from, strlen(from));
}



/// Escapes a string.
size_t Sql_EscapeStringLen(Sql* self, char *out_to, const char *from, size_t from_len)
{
	strcpy(out_to, from);
	return strlen(out_to);
}



/// Executes a query.
int Sql_Query(Sql* self, const char* query, ...)
{
	int res;
	va_list args;

	va_start(args, query);
	res = Sql_QueryV(self, query, args);
	va_end(args);

	return res;
}



/// Executes a query.
int Sql_QueryV(Sql* self, const char* query, va_list args)
{
	if( self == NULL )
		return SQL_ERROR;

	Sql_FreeResult(self);
	StringBuf_Clear(&self->buf);
	StringBuf_Vprintf(&self->buf, query, args);
	sqlite3_stmt* stmt = NULL;
	if( sqlite3_prepare_v2(self->db, StringBuf_Value(&self->buf), StringBuf_Length(&self->buf), &stmt, NULL) != SQLITE_OK )
	{
		ShowSQL("DB error - %s\n", sqlite3_errmsg(self->db));
		ra_mysql_error_handler(sqlite3_errcode(self->db));
		return SQL_ERROR;
	}
	Sql_P_StmtExecute(stmt, &self->result);
	sqlite3_finalize(stmt);
	return SQL_SUCCESS;
}



/// Executes a query.
int Sql_QueryStr(Sql* self, const char* query)
{
	if( self == NULL )
		return SQL_ERROR;

	Sql_FreeResult(self);
	StringBuf_Clear(&self->buf);
	StringBuf_AppendStr(&self->buf, query);
	sqlite3_stmt* stmt = NULL;
	if( sqlite3_prepare_v2(self->db, StringBuf_Value(&self->buf), StringBuf_Length(&self->buf), &stmt, NULL) != SQLITE_OK )
	{
		ShowSQL("DB error - %s\n", sqlite3_errmsg(self->db));
		ra_mysql_error_handler(sqlite3_errcode(self->db));
		return SQL_ERROR;
	}
	Sql_P_StmtExecute(stmt, &self->result);
	sqlite3_finalize(stmt);
	return SQL_SUCCESS;
}



/// Returns the number of the AUTO_INCREMENT column of the last INSERT/UPDATE query.
uint64 Sql_LastInsertId(Sql* self)
{
	if( self )
		return (uint64)sqlite3_last_insert_rowid(self->db);
	else
		return 0;
}



/// Returns the number of columns in each row of the result.
uint32 Sql_NumColumns(Sql* self)
{
	if( self && self->result )
		return (uint32)self->result->column_count;
	return 0;
}



/// Returns the number of rows in the result.
uint64 Sql_NumRows(Sql* self)
{
	if( self && self->result )
		return (uint64)self->result->row_count;
	return 0;
}



/// Returns the number of rows affected by the last query
uint64 Sql_NumRowsAffected(Sql* self)
{
	if( self )
		return (uint64)sqlite3_changes(self->db);
	return 0;
}



/// Fetches the next row.
int Sql_NextRow(Sql* self)
{
	if( self && self->result )
	{
		Sql_P_FetchRow(self->result);
		if( self->result->current_row )
			return SQL_SUCCESS;
		if( self->result->eof )
			return SQL_NO_DATA;
	}
	return SQL_ERROR;
}



/// Gets the data of a column.
int Sql_GetData(Sql* self, size_t col, char** out_buf, size_t* out_len)
{
	if( self && self->result->current_row )
	{
		if( col < Sql_NumColumns(self) )
		{
			sqlite3_value* value = self->result->current_row->values[col];
			if( out_buf ) *out_buf = (char*)sqlite3_value_text(value);
			if( out_len ) *out_len = (size_t)sqlite3_value_bytes(value);
		}
		else
		{// out of range - ignore
			if( out_buf ) *out_buf = NULL;
			if( out_len ) *out_len = 0;
		}
		return SQL_SUCCESS;
	}
	return SQL_ERROR;
}



/// Frees the result of the query.
void Sql_FreeResult(Sql* self)
{
	if( self && self->result )
	{
		Sql_P_FreeResult(self->result);
		self->result = NULL;
	}
}



/// Shows debug information (last query).
void Sql_ShowDebug_(Sql* self, const char* debug_file, const unsigned long debug_line)
{
	if( self == NULL )
		ShowDebug("at %s:%lu - self is NULL\n", debug_file, debug_line);
	else if( StringBuf_Length(&self->buf) > 0 )
		ShowDebug("at %s:%lu - %s\n", debug_file, debug_line, StringBuf_Value(&self->buf));
	else
		ShowDebug("at %s:%lu\n", debug_file, debug_line);
}



/// Frees a Sql handle returned by Sql_Malloc.
void Sql_Free(Sql* self)
{
	if( self )
	{
		Sql_FreeResult(self);
		StringBuf_Destroy(&self->buf);
		if( self->keepalive != INVALID_TIMER ) delete_timer(self->keepalive, Sql_P_KeepaliveTimer);
		aFree(self);
	}
}



///////////////////////////////////////////////////////////////////////////////
// Prepared Statements
///////////////////////////////////////////////////////////////////////////////



/// Bind param.
///
/// @private
static int Sql_P_BindParam(sqlite3_stmt* stmt, SqlBind* bind)
{
	int count = sqlite3_bind_parameter_count(stmt);
	for( int idx = 0; idx < count; idx++ )
	{
		SqlDataType buffer_type = bind[idx].buffer_type;
		void *buffer = bind[idx].buffer;
		size_t buffer_len = bind[idx].buffer_length;
		switch( buffer_type )
		{
		case SQLDT_NULL:
			sqlite3_bind_null(stmt, (int)(idx + 1));
			break;
		// fixed size
		case SQLDT_UINT8:
			sqlite3_bind_int(stmt, (int)(idx + 1), *((uint8_t *)buffer));
			break;
		case SQLDT_INT8:
			sqlite3_bind_int(stmt, (int)(idx + 1), *((int8_t *)buffer));
			break;
		case SQLDT_UINT16:
			sqlite3_bind_int(stmt, (int)(idx + 1), *((uint16_t *)buffer));
			break;
		case SQLDT_INT16:
			sqlite3_bind_int(stmt, (int)(idx + 1), *((int16_t *)buffer));
			break;
		case SQLDT_UINT32:
			sqlite3_bind_int(stmt, (int)(idx + 1), *((uint32_t *)buffer));
			break;
		case SQLDT_INT32:
			sqlite3_bind_int(stmt, (int)(idx + 1), *((int32_t *)buffer));
			break;
		case SQLDT_UINT64:
			sqlite3_bind_int64(stmt, (int)(idx + 1), *((uint64_t *)buffer));
			break;
		case SQLDT_INT64:
			sqlite3_bind_int64(stmt, (int)(idx + 1), *((int64_t *)buffer));
			break;
		// platform dependent size
		case SQLDT_UCHAR:
			sqlite3_bind_int(stmt, (int)(idx + 1), *((unsigned char *)buffer));
			break;
		case SQLDT_CHAR:
			sqlite3_bind_int(stmt, (int)(idx + 1), *((char *)buffer));
			break;
		case SQLDT_USHORT:
			sqlite3_bind_int(stmt, (int)(idx + 1), *((unsigned short *)buffer));
			break;
		case SQLDT_SHORT:
			sqlite3_bind_int(stmt, (int)(idx + 1), *((short *)buffer));
			break;
		case SQLDT_UINT:
			sqlite3_bind_int(stmt, (int)(idx + 1), *((unsigned int *)buffer));
			break;
		case SQLDT_INT:
			sqlite3_bind_int(stmt, (int)(idx + 1), *((int *)buffer));
			break;
		case SQLDT_ULONG:
			sqlite3_bind_int64(stmt, (int)(idx + 1), *((unsigned long *)buffer));
			break;
		case SQLDT_LONG:
			sqlite3_bind_int64(stmt, (int)(idx + 1), *((long *)buffer));
			break;
		case SQLDT_ULONGLONG:
			sqlite3_bind_int64(stmt, (int)(idx + 1), *((unsigned long long *)buffer));
			break;
		case SQLDT_LONGLONG:
			sqlite3_bind_int64(stmt, (int)(idx + 1), *((long long *)buffer));
			break;
		// floating point
		case SQLDT_FLOAT:
			sqlite3_bind_double(stmt, (int)(idx + 1), *((float *)buffer));
			break;
		case SQLDT_DOUBLE:
			sqlite3_bind_double(stmt, (int)(idx + 1), *((double *)buffer));
			break;
		// other
		case SQLDT_STRING:
		case SQLDT_ENUM:
			sqlite3_bind_text(stmt, (int)(idx + 1), (char *)buffer, (int)buffer_len, NULL);
			break;
		case SQLDT_BLOB:
			sqlite3_bind_blob(stmt, (int)(idx + 1), buffer, (int)buffer_len, NULL);
			break;
		default:
			ShowDebug("Sql_P_BindParam: unsupported buffer type (%d)\n", buffer_type);
			return SQL_ERROR;
		}
	}
	return SQL_SUCCESS;
}



/// Bind result.
///
/// @private
static int Sql_P_BindResult(SqlResult* result, SqlBind* bind)
{
	int count = result->column_count;
	for( int idx = 0; idx < count; idx++ )
	{
		sqlite3_value* value = result->current_row->values[idx];
		SqlDataType buffer_type = bind[idx].buffer_type;
		void *buffer = bind[idx].buffer;
		size_t buffer_len = bind[idx].buffer_length;
		switch( buffer_type )
		{
		case SQLDT_NULL:
			break;
		// fixed size
		case SQLDT_UINT8:
			*((uint8_t *)buffer) = (uint8_t)sqlite3_value_int(value);
			break;
		case SQLDT_INT8:
			*((int8_t *)buffer) = (int8_t)sqlite3_value_int(value);
			break;
		case SQLDT_UINT16:
			*((uint16_t *)buffer) = (uint16_t)sqlite3_value_int(value);
			break;
		case SQLDT_INT16:
			*((int16_t *)buffer) = (int16_t)sqlite3_value_int(value);
			break;
		case SQLDT_UINT32:
			*((uint32_t *)buffer) = (uint32_t)sqlite3_value_int(value);
			break;
		case SQLDT_INT32:
			*((int32_t *)buffer) = (int32_t)sqlite3_value_int(value);
			break;
		case SQLDT_UINT64:
			*((uint64_t *)buffer) = (uint64_t)sqlite3_value_int64(value);
			break;
		case SQLDT_INT64:
			*((int64_t *)buffer) = (int64_t)sqlite3_value_int64(value);
			break;
		// platform dependent size
		case SQLDT_UCHAR:
			*((unsigned char *)buffer) = (unsigned char)sqlite3_value_int(value);
			break;
		case SQLDT_CHAR:
			*((char *)buffer) = (char)sqlite3_value_int(value);
			break;
		case SQLDT_USHORT:
			*((unsigned short *)buffer) = (unsigned short)sqlite3_value_int(value);
			break;
		case SQLDT_SHORT:
			*((short *)buffer) = (short)sqlite3_value_int(value);
			break;
		case SQLDT_UINT:
			*((unsigned int *)buffer) = (unsigned int)sqlite3_value_int(value);
			break;
		case SQLDT_INT:
			*((int *)buffer) = (int)sqlite3_value_int(value);
			break;
		case SQLDT_ULONG:
			*((unsigned long *)buffer) = (unsigned long)sqlite3_value_int64(value);
			break;
		case SQLDT_LONG:
			*((long *)buffer) = (long)sqlite3_value_int64(value);
			break;
		case SQLDT_ULONGLONG:
			*((unsigned long long *)buffer) = (unsigned long long)sqlite3_value_int64(value);
			break;
		case SQLDT_LONGLONG:
			*((long long *)buffer) = (long long)sqlite3_value_int64(value);
			break;
		// floating point
		case SQLDT_FLOAT:
			*((float *)buffer) = (float)sqlite3_value_double(value);
			break;
		case SQLDT_DOUBLE:
			*((double *)buffer) = (double)sqlite3_value_double(value);
			break;
		// other
		case SQLDT_STRING:
		case SQLDT_ENUM: {
			const char *text = (const char *)sqlite3_value_text(value);
			strcpy((char *)buffer, text ?: "\0");
			break;
		}
		case SQLDT_BLOB: {
			const void *blob = sqlite3_value_blob(value);
			size_t len = zmin(buffer_len, sqlite3_value_bytes(value));
			memcpy(buffer, blob, len);
			break;
		}
		default:
			ShowDebug("Sql_P_BindResult: unsupported buffer type (%d)\n", buffer_type);
			return SQL_ERROR;
		}
	}
	return SQL_SUCCESS;
}



/// Allocates and initializes a new SqlStmt handle.
SqlStmt* SqlStmt_Malloc(Sql* sql)
{
	SqlStmt* self;

	if( sql == NULL )
		return NULL;

	CREATE(self, SqlStmt, 1);
	StringBuf_Init(&self->buf);
	self->db = sql->db;
	self->stmt = NULL;
	self->params = NULL;
	self->columns = NULL;
	self->max_params = 0;
	self->max_columns = 0;
	self->bind_params = false;
	self->bind_columns = false;

	return self;
}



/// Prepares the statement.
int SqlStmt_Prepare(SqlStmt* self, const char* query, ...)
{
	int res;
	va_list args;

	va_start(args, query);
	res = SqlStmt_PrepareV(self, query, args);
	va_end(args);

	return res;
}



/// Prepares the statement.
int SqlStmt_PrepareV(SqlStmt* self, const char* query, va_list args)
{
	if( self == NULL )
		return SQL_ERROR;

	SqlStmt_FreeResult(self);
	StringBuf_Clear(&self->buf);
	StringBuf_Vprintf(&self->buf, query, args);
	if( sqlite3_prepare_v2(self->db, StringBuf_Value(&self->buf), StringBuf_Length(&self->buf), &self->stmt, NULL) )
	{
		ShowSQL("DB error - %s\n", sqlite3_errmsg(self->db));
		ra_mysql_error_handler(sqlite3_errcode(self->db));
		return SQL_ERROR;
	}
	self->bind_params = false;
	return SQL_SUCCESS;
}



/// Prepares the statement.
int SqlStmt_PrepareStr(SqlStmt* self, const char* query)
{
	if( self == NULL )
		return SQL_ERROR;

	SqlStmt_FreeResult(self);
	StringBuf_Clear(&self->buf);
	StringBuf_AppendStr(&self->buf, query);
	if( sqlite3_prepare_v2(self->db, StringBuf_Value(&self->buf), StringBuf_Length(&self->buf), &self->stmt, NULL) )
	{
		ShowSQL("DB error - %s\n", sqlite3_errmsg(self->db));
		ra_mysql_error_handler(sqlite3_errcode(self->db));
		return SQL_ERROR;
	}
	self->bind_params = false;
	return SQL_SUCCESS;
}



/// Returns the number of parameters in the prepared statement.
size_t SqlStmt_NumParams(SqlStmt* self)
{
	if( self )
		return (size_t)sqlite3_bind_parameter_count(self->stmt);
	else
		return 0;
}



/// Binds a parameter to a buffer.
int SqlStmt_BindParam(SqlStmt* self, size_t idx, enum SqlDataType buffer_type, void* buffer, size_t buffer_len)
{
	if( self == NULL )
		return SQL_ERROR;

	if( !self->bind_params )
	{// initialize the bindings
		size_t i;
		size_t count;

		count = SqlStmt_NumParams(self);
		if( self->max_params < count )
		{
			self->max_params = count;
			RECREATE(self->params, SqlBind, count);
		}
		memset(self->params, 0, count*sizeof(SqlBind));
		for( i = 0; i < count; ++i )
			self->params[i].buffer_type = SQLDT_NULL;
		self->bind_params = true;
	}
	if( idx < self->max_params )
	{
		self->params[idx].buffer_type = buffer_type;
		self->params[idx].buffer = buffer;
		self->params[idx].buffer_length = buffer_len;
		return SQL_SUCCESS;
	}
	else
	{
		return SQL_SUCCESS;// out of range - ignore
	}
}



/// Executes the prepared statement.
int SqlStmt_Execute(SqlStmt* self)
{
	if( self == NULL )
		return SQL_ERROR;

	SqlStmt_FreeResult(self);
	if( self->bind_params && Sql_P_BindParam(self->stmt, self->params) == SQL_SUCCESS )
		Sql_P_StmtExecute(self->stmt, &self->result);
	self->bind_columns = false;

	return SQL_SUCCESS;
}



/// Returns the number of the AUTO_INCREMENT column of the last INSERT/UPDATE statement.
uint64 SqlStmt_LastInsertId(SqlStmt* self)
{
	if( self )
		return (uint64)sqlite3_last_insert_rowid(self->db);
	else
		return 0;
}



/// Returns the number of columns in each row of the result.
size_t SqlStmt_NumColumns(SqlStmt* self)
{
	if( self )
		return (size_t)sqlite3_column_count(self->stmt);
	else
		return 0;
}



/// Binds the result of a column to a buffer.
int SqlStmt_BindColumn(SqlStmt* self, size_t idx, enum SqlDataType buffer_type, void* buffer, size_t buffer_len, uint32* out_length, int8* out_is_null)
{
	if( self == NULL )
		return SQL_ERROR;

	if( buffer_type == SQLDT_STRING || buffer_type == SQLDT_ENUM )
	{
		if( buffer_len < 1 )
		{
			ShowDebug("SqlStmt_BindColumn: buffer_len(%" PRIuPTR ") is too small, no room for the nul-terminator\n", buffer_len);
			return SQL_ERROR;
		}
		--buffer_len;// nul-terminator
	}
	if( !self->bind_columns )
	{// initialize the bindings
		size_t i;
		size_t cols;

		cols = SqlStmt_NumColumns(self);
		if( self->max_columns < cols )
		{
			self->max_columns = cols;
			RECREATE(self->columns, SqlBind, cols);
		}
		memset(self->columns, 0, cols*sizeof(SqlBind));
		for( i = 0; i < cols; ++i )
			self->columns[i].buffer_type = SQLDT_NULL;
		self->bind_columns = true;
	}
	if( idx < self->max_columns )
	{
		self->columns[idx].buffer_type = buffer_type;
		self->columns[idx].buffer = buffer;
		self->columns[idx].buffer_length = buffer_len;
		self->columns[idx].length = out_length;
		self->columns[idx].is_null = out_is_null;
		return SQL_SUCCESS;
	}
	else
	{
		return SQL_SUCCESS;// out of range - ignore
	}
}



/// Returns the number of rows in the result.
uint64 SqlStmt_NumRows(SqlStmt* self)
{
	if( self )
		return (uint64)self->result->row_count;
	return 0;
}



/// Fetches the next row.
int SqlStmt_NextRow(SqlStmt* self)
{
	if( self == NULL )
		return SQL_ERROR;

	if( self->bind_columns && self->result )
	{
		Sql_P_FetchRow(self->result);
		if( self->result->current_row )
		{
			Sql_P_BindResult(self->result, self->columns);
			return SQL_SUCCESS;
		}
		if( self->result->eof )
			return SQL_NO_DATA;
	}

	return SQLITE_ERROR;
}



/// Frees the result of the statement execution.
void SqlStmt_FreeResult(SqlStmt* self)
{
	if( self )
	{
		Sql_P_FreeResult(self->result);
		self->result = NULL;
	}
}



/// Shows debug information (with statement).
void SqlStmt_ShowDebug_(SqlStmt* self, const char* debug_file, const unsigned long debug_line)
{
	if( self == NULL )
		ShowDebug("at %s:%lu -  self is NULL\n", debug_file, debug_line);
	else if( StringBuf_Length(&self->buf) > 0 )
		ShowDebug("at %s:%lu - %s\n", debug_file, debug_line, StringBuf_Value(&self->buf));
	else
		ShowDebug("at %s:%lu\n", debug_file, debug_line);
}



/// Frees a SqlStmt returned by SqlStmt_Malloc.
void SqlStmt_Free(SqlStmt* self)
{
	if( self )
	{
		SqlStmt_FreeResult(self);
		StringBuf_Destroy(&self->buf);
		sqlite3_finalize(self->stmt);
		if( self->params )
			aFree(self->params);
		if( self->columns )
		{
			aFree(self->columns);
		}
		aFree(self);
	}
}



/// Receives MySQL error codes during runtime (not on first-time-connects).
void ra_mysql_error_handler(unsigned int ecode) {
	switch( ecode ) {
		case 2003:// Can't connect to MySQL (this error only happens here when failing to reconnect)
			if( mysql_reconnect_type == 1 ) {
				static unsigned int retry = 1;
				if( ++retry > mysql_reconnect_count ) {
					ShowFatalError("MySQL has been unreachable for too long, %d reconnects were attempted. Shutting Down\n", retry);
					exit(EXIT_FAILURE);
				}
			}
			break;
	}
}

void Sql_inter_server_read(const char* cfgName, bool first) {
	char line[1024], w1[1024], w2[1024];
	FILE* fp;

	fp = fopen(cfgName, "r");
	if(fp == NULL) {
		if( first ) {
			ShowFatalError("File not found: %s\n", cfgName);
			exit(EXIT_FAILURE);
		} else
			ShowError("File not found: %s\n", cfgName);
		return;
	}

	while(fgets(line, sizeof(line), fp)) {
		int i = sscanf(line, "%1023[^:]: %1023[^\r\n]", w1, w2);
		if(i != 2)
			continue;

		if(!strcmpi(w1,"mysql_reconnect_type")) {
			mysql_reconnect_type = atoi(w2);
			switch( mysql_reconnect_type ) {
				case 1:
				case 2:
					break;
				default:
					ShowError("%s::mysql_reconnect_type is set to %d which is not valid, defaulting to 1...\n", cfgName, mysql_reconnect_type);
					mysql_reconnect_type = 1;
					break;
			}
		} else if(!strcmpi(w1,"mysql_reconnect_count")) {
			mysql_reconnect_count = atoi(w2);
			if( mysql_reconnect_count < 1 )
				mysql_reconnect_count = 1;
		} else if(!strcmpi(w1,"import"))
			Sql_inter_server_read(w2,false);
	}
	fclose(fp);

	return;
}

void Sql_Init(void) {
	Sql_inter_server_read(SQL_CONF_NAME,true);
}
