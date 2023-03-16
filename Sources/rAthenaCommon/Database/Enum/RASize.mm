//
//  RASize.m
//  rAthena
//
//  Created by Leon Li on 2023/3/15.
//

#import "RASize.h"
#include "map/mob.hpp"

@implementation RASize

+ (RASize *)small {
    static RASize *small = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        small = [[RASize alloc] init];
        small.value = SZ_SMALL;
        small.name = @"Small";
        small.englishName = @"Small";
    });
    return small;
}

+ (RASize *)medium {
    static RASize *medium = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        medium = [[RASize alloc] init];
        medium.value = SZ_MEDIUM;
        medium.name = @"Medium";
        medium.englishName = @"Medium";
    });
    return medium;
}

+ (RASize *)large {
    static RASize *large = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        large = [[RASize alloc] init];
        large.value = SZ_BIG;
        large.name = @"Large";
        large.englishName = @"Large";
    });
    return large;
}

+ (NSArray<RASize *> *)allCases {
    static NSArray<RASize *> *allCases = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allCases = @[
            RASize.small,
            RASize.medium,
            RASize.large,
        ];
    });
    return allCases;
}

@end
