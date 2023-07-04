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

- (void)loadWithCompletionHandler:(void (^)(NSArray<RADatabaseRecord *> *records))completionHandler NS_SWIFT_ASYNC(1);

@end

@interface RADatabaseRecord : NSObject

@property (nonatomic, readonly) NSInteger recordID;
@property (nonatomic, readonly, copy) NSString *recordTitle;

- (void)buildRecordFieldsWithBuilder:(RADatabaseRecordFieldsBuilder *)builder;

@end

@interface RADatabaseRecordFieldsBuilder : NSObject

- (void)addRecordFieldWithName:(NSString *)name stringValue:(NSString *)stringValue;
- (void)addRecordFieldWithName:(NSString *)name stringArrayValue:(NSArray<NSString *> *)stringArrayValue;

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
    RADatabaseRecordFieldValueTypeStringArray,
//    RADatabaseRecordFieldValueTypeReferenceArray,
};

@interface RADatabaseRecordFieldValue : NSObject

@property (nonatomic, readonly) RADatabaseRecordFieldValueType type;
@property (nonatomic, readonly, copy, nullable) NSString *string;
@property (nonatomic, readonly, copy, nullable) NSArray<NSString *> *stringArray;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithString:(NSString *)string NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithStringArray:(NSArray<NSString *> *)stringArray NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
