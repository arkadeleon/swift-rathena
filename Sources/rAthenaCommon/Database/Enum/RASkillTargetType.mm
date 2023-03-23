//
//  RASkillTargetType.m
//  rAthena
//
//  Created by Leon Li on 2023/3/21.
//

#import "RASkillTargetType.h"
#include "map/skill.hpp"

@implementation RASkillTargetType

+ (RASkillTargetType *)passive {
    static RASkillTargetType *passive = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        passive = [[RASkillTargetType alloc] init];
        passive.value = INF_PASSIVE_SKILL;
        passive.name = @"Passive";
        passive.englishName = @"Passive";
    });
    return passive;
}

+ (RASkillTargetType *)attack {
    static RASkillTargetType *attack = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        attack = [[RASkillTargetType alloc] init];
        attack.value = INF_ATTACK_SKILL;
        attack.name = @"Attack";
        attack.englishName = @"Attack";
    });
    return attack;
}

+ (RASkillTargetType *)ground {
    static RASkillTargetType *ground = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ground = [[RASkillTargetType alloc] init];
        ground.value = INF_GROUND_SKILL;
        ground.name = @"Ground";
        ground.englishName = @"Ground";
    });
    return ground;
}

+ (RASkillTargetType *)zelf {
    static RASkillTargetType *zelf = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        zelf = [[RASkillTargetType alloc] init];
        zelf.value = INF_SELF_SKILL;
        zelf.name = @"Self";
        zelf.englishName = @"Self";
    });
    return zelf;
}

+ (RASkillTargetType *)support {
    static RASkillTargetType *support = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        support = [[RASkillTargetType alloc] init];
        support.value = INF_SUPPORT_SKILL;
        support.name = @"Support";
        support.englishName = @"Support";
    });
    return support;
}

+ (RASkillTargetType *)trap {
    static RASkillTargetType *trap = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        trap = [[RASkillTargetType alloc] init];
        trap.value = INF_TRAP_SKILL;
        trap.name = @"Trap";
        trap.englishName = @"Trap";
    });
    return trap;
}

+ (NSArray<RASkillTargetType *> *)allCases {
    static NSArray<RASkillTargetType *> *allCases = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allCases = @[
            RASkillTargetType.passive,
            RASkillTargetType.attack,
            RASkillTargetType.ground,
            RASkillTargetType.zelf,
            RASkillTargetType.support,
            RASkillTargetType.trap,
        ];
    });
    return allCases;
}

@end
