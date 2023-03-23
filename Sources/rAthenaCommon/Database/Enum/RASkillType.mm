//
//  RASkillType.m
//  rAthena
//
//  Created by Leon Li on 2023/3/21.
//

#import "RASkillType.h"
#include "map/battle.hpp"

@implementation RASkillType

+ (RASkillType *)none {
    static RASkillType *none = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        none = [[RASkillType alloc] init];
        none.value = BF_NONE;
        none.name = @"None";
        none.englishName = @"None";
    });
    return none;
}

+ (RASkillType *)weapon {
    static RASkillType *weapon = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        weapon = [[RASkillType alloc] init];
        weapon.value = BF_WEAPON;
        weapon.name = @"Weapon";
        weapon.englishName = @"Weapon";
    });
    return weapon;
}

+ (RASkillType *)magic {
    static RASkillType *magic = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        magic = [[RASkillType alloc] init];
        magic.value = BF_MAGIC;
        magic.name = @"Magic";
        magic.englishName = @"Magic";
    });
    return magic;
}

+ (RASkillType *)misc {
    static RASkillType *misc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        misc = [[RASkillType alloc] init];
        misc.value = BF_MISC;
        misc.name = @"Misc";
        misc.englishName = @"Misc";
    });
    return misc;
}

+ (NSArray<RASkillType *> *)allCases {
    static NSArray<RASkillType *> *allCases = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allCases = @[
            RASkillType.none,
            RASkillType.weapon,
            RASkillType.magic,
            RASkillType.misc,
        ];
    });
    return allCases;
}

@end
