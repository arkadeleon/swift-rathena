//
//  RADatabase.m
//  rAthena
//
//  Created by Leon Li on 2023/6/28.
//

#import "RADatabase.h"

@interface RADatabase ()

@property (nonatomic, copy) NSMutableDictionary<NSNumber *, RADatabaseRecord *> *cache;

@end

@implementation RADatabase

- (instancetype)init {
    self = [super init];
    if (self) {
        _cache = [NSMutableDictionary dictionary];
    }
    return self;
}

- (NSString *)name {
    NSCAssert(NO, @"This method must be overridden by subclasses");
}

- (void)recoverCache:(NSMutableDictionary<NSNumber *, RADatabaseRecord *> *)cache {
    NSCAssert(NO, @"This method must be overridden by subclasses");
}

- (void)recoverCacheIfNeeded {
    if (self.cache.count == 0) {
        [self recoverCache:self.cache];
    }
}

- (NSArray<RADatabaseRecord *> *)allRecords {
    [self recoverCacheIfNeeded];

    return self.cache.allValues;
}

- (RADatabaseRecord *)recordWithID:(NSInteger)recordID {
    [self recoverCacheIfNeeded];

    return self.cache[@(recordID)];
}

@end

@implementation RADatabaseRecord

- (NSInteger)recordID {
    return 0;
}

- (NSString *)recordTitle {
    return @"";
}

- (NSString *)recordSubtitle {
    return @"";
}

- (NSArray<RADatabaseRecordField *> *)recordFields {
    return @[];
}

@end

@implementation RADatabaseRecordField

- (instancetype)initWithName:(NSString *)name value:(RADatabaseRecordFieldValue *)value {
    self = [super init];
    if (self) {
        _name = [name copy];
        _value = value;
    }
    return self;
}

@end

@implementation RADatabaseRecordFieldValue

- (instancetype)initWithString:(NSString *)string {
    self = [super init];
    if (self) {
        _type = RADatabaseRecordFieldValueTypeString;
        _string = [string copy];
    }
    return self;
}

- (instancetype)initWithNumber:(NSNumber *)number {
    self = [super init];
    if (self) {
        _type = RADatabaseRecordFieldValueTypeNumber;
        _number = number;
    }
    return self;
}

- (instancetype)initWithReference:(RADatabaseRecord *)reference {
    self = [super init];
    if (self) {
        _type = RADatabaseRecordFieldValueTypeReference;
        _reference = reference;
    }
    return self;
}

- (instancetype)initWithStringArray:(NSArray<NSString *> *)stringArray {
    self = [super init];
    if (self) {
        _type = RADatabaseRecordFieldValueTypeStringArray;
        _stringArray = [stringArray copy];
    }
    return self;
}

- (instancetype)initWithReferenceArray:(NSArray<RADatabaseRecord *> *)referenceArray {
    self = [super init];
    if (self) {
        _type = RADatabaseRecordFieldValueTypeReferenceArray;
        _referenceArray = [referenceArray copy];
    }
    return self;
}

- (instancetype)initWithFieldArray:(NSArray<RADatabaseRecordField *> *)fieldArray {
    self = [super init];
    if (self) {
        _type = RADatabaseRecordFieldValueTypeFieldArray;
        _fieldArray = [fieldArray copy];
    }
    return self;
}

@end

@implementation NSMutableArray (RADatabaseRecordField)

- (void)ra_addFieldWithName:(NSString *)name stringValue:(NSString *)stringValue {
    RADatabaseRecordFieldValue *value = [[RADatabaseRecordFieldValue alloc] initWithString:stringValue];
    RADatabaseRecordField *field = [[RADatabaseRecordField alloc] initWithName:name value:value];
    [self addObject:field];
}

- (void)ra_addFieldWithName:(NSString *)name numberValue:(NSNumber *)numberValue {
    RADatabaseRecordFieldValue *value = [[RADatabaseRecordFieldValue alloc] initWithNumber:numberValue];
    RADatabaseRecordField *field = [[RADatabaseRecordField alloc] initWithName:name value:value];
    [self addObject:field];
}

- (void)ra_addFieldWithName:(NSString *)name referenceValue:(RADatabaseRecord *)referenceValue {
    RADatabaseRecordFieldValue *value = [[RADatabaseRecordFieldValue alloc] initWithReference:referenceValue];
    RADatabaseRecordField *field = [[RADatabaseRecordField alloc] initWithName:name value:value];
    [self addObject:field];
}

- (void)ra_addFieldWithName:(NSString *)name stringArrayValue:(NSArray<NSString *> *)stringArrayValue {
    RADatabaseRecordFieldValue *value = [[RADatabaseRecordFieldValue alloc] initWithStringArray:stringArrayValue];
    RADatabaseRecordField *field = [[RADatabaseRecordField alloc] initWithName:name value:value];
    [self addObject:field];
}

- (void)ra_addFieldWithName:(NSString *)name referenceArrayValue:(NSArray<RADatabaseRecord *> *)referenceArrayValue {
    RADatabaseRecordFieldValue *value = [[RADatabaseRecordFieldValue alloc] initWithReferenceArray:referenceArrayValue];
    RADatabaseRecordField *field = [[RADatabaseRecordField alloc] initWithName:name value:value];
    [self addObject:field];
}

- (void)ra_addFieldWithName:(NSString *)name fieldArrayValue:(NSArray<RADatabaseRecordField *> *)fieldArrayValue {
    RADatabaseRecordFieldValue *value = [[RADatabaseRecordFieldValue alloc] initWithFieldArray:fieldArrayValue];
    RADatabaseRecordField *field = [[RADatabaseRecordField alloc] initWithName:name value:value];
    [self addObject:field];
}

@end
