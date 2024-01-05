//
//  RADatabase.m
//  rAthena
//
//  Created by Leon Li on 2023/6/28.
//

#import "RADatabase.h"

@interface RADatabase ()

@property (nonatomic, copy) NSMutableDictionary<NSNumber *, id> *cache;

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

- (void)recoverCache:(NSMutableDictionary<NSNumber *, id> *)cache {
    NSCAssert(NO, @"This method must be overridden by subclasses");
}

- (void)recoverCacheIfNeeded {
    if (self.cache.count == 0) {
        [self recoverCache:self.cache];
    }
}

- (NSArray *)allRecords {
    [self recoverCacheIfNeeded];

    NSArray<NSNumber *> *sortedKeys = [self.cache.allKeys sortedArrayUsingSelector:@selector(compare:)];
    NSMutableArray *sortedValues = [NSMutableArray arrayWithCapacity:self.cache.count];
    for (NSNumber *key in sortedKeys) {
        [sortedValues addObject:self.cache[key]];
    }
    return [sortedValues copy];
}

- (id)recordWithID:(NSInteger)recordID {
    [self recoverCacheIfNeeded];

    return self.cache[@(recordID)];
}

@end
