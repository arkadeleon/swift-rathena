//
//  RADatabase.h
//  rAthena
//
//  Created by Leon Li on 2023/6/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class RADatabaseRecord;
@class RADatabaseRecordField;
@class RADatabaseRecordFieldValue;

@interface RADatabase : NSObject

@property (nonatomic, readonly, copy) NSString *name;

- (void)recoverCache:(NSMutableDictionary<NSNumber *, RADatabaseRecord *> *)cache;

- (NSArray<__kindof RADatabaseRecord *> *)allRecords;
- (__kindof RADatabaseRecord * _Nullable)recordWithID:(NSInteger)recordID;

@end

@interface RADatabaseRecord : NSObject

@property (nonatomic, readonly) NSInteger recordID;
@property (nonatomic, readonly, copy) NSString *recordTitle;
@property (nonatomic, readonly, copy) NSArray<RADatabaseRecordField *> *recordFields;

@end

@interface RADatabaseRecordField : NSObject

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly) RADatabaseRecordFieldValue *value;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithName:(NSString *)name value:(RADatabaseRecordFieldValue *)value NS_DESIGNATED_INITIALIZER;

@end

typedef NS_ENUM(NSInteger, RADatabaseRecordFieldValueType) {
    RADatabaseRecordFieldValueTypeString,
    RADatabaseRecordFieldValueTypeNumber,
    RADatabaseRecordFieldValueTypeReference,
    RADatabaseRecordFieldValueTypeArray,
};

@interface RADatabaseRecordFieldValue : NSObject

@property (nonatomic, readonly) RADatabaseRecordFieldValueType type;
@property (nonatomic, readonly, copy, nullable) NSString *string;
@property (nonatomic, readonly, nullable) NSNumber *number;
@property (nonatomic, readonly, nullable) RADatabaseRecord *reference;
@property (nonatomic, readonly, copy, nullable) NSArray<RADatabaseRecordField *> *array;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithString:(NSString *)string NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithNumber:(NSNumber *)number NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithReference:(RADatabaseRecord *)reference NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithArray:(NSArray<RADatabaseRecordField *> *)array NS_DESIGNATED_INITIALIZER;

@end

@interface NSMutableArray (RADatabaseRecordField)

- (void)ra_addFieldWithName:(NSString *)name stringValue:(NSString *)stringValue;
- (void)ra_addFieldWithName:(NSString *)name numberValue:(NSNumber *)numberValue;
- (void)ra_addFieldWithName:(NSString *)name referenceValue:(RADatabaseRecord *)referenceValue;
- (void)ra_addFieldWithName:(NSString *)name arrayValue:(NSArray<RADatabaseRecordField *> *)arrayValue;

@end

NS_ASSUME_NONNULL_END
