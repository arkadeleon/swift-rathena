//
//  RASkillHitType.m
//  rAthena
//
//  Created by Leon Li on 2023/3/23.
//

#import "RASkillHitType.h"
#include "map/clif.hpp"

@implementation RASkillHitType

+ (RASkillHitType *)normal {
    static RASkillHitType *normal = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        normal = [[RASkillHitType alloc] init];
        normal.value = DMG_NORMAL;
        normal.name = @"";
        normal.englishName = @"Normal";
    });
    return normal;
}

+ (RASkillHitType *)single {
    static RASkillHitType *single = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        single = [[RASkillHitType alloc] init];
        single.value = DMG_SINGLE;
        single.name = @"Single";
        single.englishName = @"Single Hit";
    });
    return single;
}

+ (RASkillHitType *)multiple {
    static RASkillHitType *multiple = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        multiple = [[RASkillHitType alloc] init];
        multiple.value = DMG_MULTI_HIT;
        multiple.name = @"Multi_Hit";
        multiple.englishName = @"Multiple Hit";
    });
    return multiple;
}

+ (NSArray<RASkillHitType *> *)allCases {
    static NSArray<RASkillHitType *> *allCases = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allCases = @[
            RASkillHitType.normal,
            RASkillHitType.single,
            RASkillHitType.multiple,
        ];
    });
    return allCases;
}

@end
