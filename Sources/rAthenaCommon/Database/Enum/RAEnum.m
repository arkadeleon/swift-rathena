//
//  RAEnum.m
//  rAthena
//
//  Created by Leon Li on 2023/3/15.
//

#import "RAEnum.h"

@implementation RAEnum

+ (NSArray<RAEnum *> *)allCases {
    return @[];
}

+ (instancetype)valueOfName:(NSString *)name {
    for (RAEnum *value in self.allCases) {
        if ([value.name caseInsensitiveCompare:name] == NSOrderedSame) {
            return value;
        }
    }
    return nil;
}

+ (NSSet *)valuesOfNames:(NSDictionary<NSString *, NSNumber *> *)names {
    NSMutableSet *values = [[NSMutableSet alloc] init];

    NSNumber *all = names[@"All"];
    if (all && all.boolValue) {
        [values addObjectsFromArray:[self allCases]];
    }

    [names enumerateKeysAndObjectsUsingBlock:^(NSString *name, NSNumber *included, BOOL *stop) {
        RAEnum *value = [self valueOfName:name];
        if (value && included.boolValue) {
            [values addObject:value];
        }
    }];

    return [values copy];
}

- (NSString *)description {
    return self.name;
}

@end
