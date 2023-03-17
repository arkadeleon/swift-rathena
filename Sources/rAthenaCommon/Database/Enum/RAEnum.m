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

- (NSString *)description {
    return self.name;
}

@end
