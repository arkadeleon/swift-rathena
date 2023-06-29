//
//  RADatabase.m
//  rAthena
//
//  Created by Leon Li on 2023/6/28.
//

#import "RADatabase.h"

@implementation RADatabase

- (NSString *)name {
    return @"";
}

- (void)loadWithCompletionHandler:(void (^)(NSArray<RADatabaseRecord *> *))completionHandler {
    completionHandler(@[]);
}

@end

@implementation RADatabaseRecord

- (NSInteger)recordID {
    return 0;
}

- (NSString *)recordTitle {
    return @"";
}

- (NSArray<RADatabaseRecordField *> *)recordFields {
    return @[];
}

@end

@implementation RADatabaseRecordField

- (instancetype)initWithName:(NSString *)name stringValue:(NSString *)stringValue {
    self = [super init];
    if (self) {
        _name = [name copy];
        _value = [[RADatabaseRecordFieldValue alloc] initWithString:stringValue];
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name stringArrayValue:(NSArray<NSString *> *)stringArrayValue {
    self = [super init];
    if (self) {
        _name = [name copy];
        _value = [[RADatabaseRecordFieldValue alloc] initWithStringArray:stringArrayValue];
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

- (instancetype)initWithStringArray:(NSArray<NSString *> *)stringArray {
    self = [super init];
    if (self) {
        _type = RADatabaseRecordFieldValueTypeStringArray;
        _stringArray = [stringArray copy];
    }
    return self;
}

@end
