//
//  RADatabase.h
//  rAthena
//
//  Created by Leon Li on 2023/6/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class RADatabaseRecord;
@class RADatabaseRecordFieldsBuilder;
@class RADatabaseRecordField;
@class RADatabaseRecordFieldValue;

@interface RADatabase : NSObject

@property (nonatomic, readonly, copy) NSString *name;

- (NSArray<RADatabaseRecord *> *)fetchAllRecords;
- (RADatabaseRecord * _Nullable)fetchRecordWithID:(NSInteger)recordID;

@end

@interface RADatabaseRecord : NSObject

@property (nonatomic, readonly) NSInteger recordID;
@property (nonatomic, readonly, copy) NSString *recordTitle;
@property (nonatomic, readonly, copy) NSString *recordSubtitle;

- (void)buildRecordFieldsWithBuilder:(RADatabaseRecordFieldsBuilder *)builder;

@end

@interface RADatabaseRecordFieldsBuilder : NSObject

- (void)addFieldWithName:(NSString *)name stringValue:(NSString *)stringValue;
- (void)addFieldWithName:(NSString *)name numberValue:(NSNumber *)numberValue;
- (void)addFieldWithName:(NSString *)name stringArrayValue:(NSArray<NSString *> *)stringArrayValue;
- (void)addFieldWithName:(NSString *)name referenceArrayValue:(NSArray<RADatabaseRecord *> *)referenceArrayValue;

- (NSArray<RADatabaseRecordField *> *)build;

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
    RADatabaseRecordFieldValueTypeStringArray,
    RADatabaseRecordFieldValueTypeReferenceArray,
};

@interface RADatabaseRecordFieldValue : NSObject

@property (nonatomic, readonly) RADatabaseRecordFieldValueType type;
@property (nonatomic, readonly, copy, nullable) NSString *string;
@property (nonatomic, readonly, nullable) NSNumber *number;
@property (nonatomic, readonly, copy, nullable) NSArray<NSString *> *stringArray;
@property (nonatomic, readonly, copy, nullable) NSArray<RADatabaseRecord *> *referenceArray;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithString:(NSString *)string NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithNumber:(NSNumber *)number NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithStringArray:(NSArray<NSString *> *)stringArray NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithReferenceArray:(NSArray<RADatabaseRecord *> *)referenceArray NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
