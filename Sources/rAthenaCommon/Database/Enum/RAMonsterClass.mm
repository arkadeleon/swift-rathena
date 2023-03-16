//
//  RAMonsterClass.m
//  rAthena
//
//  Created by Leon Li on 2023/3/16.
//

#import "RAMonsterClass.h"
#include "map/mob.hpp"

@implementation RAMonsterClass

+ (RAMonsterClass *)normal {
    static RAMonsterClass *normal = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        normal = [[RAMonsterClass alloc] init];
        normal.value = CLASS_NORMAL;
        normal.name = @"";
        normal.englishName = @"Normal";
    });
    return normal;
}

+ (RAMonsterClass *)boss {
    static RAMonsterClass *boss = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        boss = [[RAMonsterClass alloc] init];
        boss.value = CLASS_BOSS;
        boss.name = @"Boss";
        boss.englishName = @"Boss";
    });
    return boss;
}

+ (RAMonsterClass *)guardian {
    static RAMonsterClass *guardian = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        guardian = [[RAMonsterClass alloc] init];
        guardian.value = CLASS_GUARDIAN;
        guardian.name = @"Guardian";
        guardian.englishName = @"Guardian";
    });
    return guardian;
}

+ (RAMonsterClass *)battlefield {
    static RAMonsterClass *battlefield = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        battlefield = [[RAMonsterClass alloc] init];
        battlefield.value = CLASS_BATTLEFIELD;
        battlefield.name = @"Battlefield";
        battlefield.englishName = @"Battlefield";
    });
    return battlefield;
}

+ (RAMonsterClass *)event {
    static RAMonsterClass *event = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        event = [[RAMonsterClass alloc] init];
        event.value = CLASS_EVENT;
        event.name = @"Event";
        event.englishName = @"Event";
    });
    return event;
}

+ (NSArray<RAMonsterClass *> *)allCases {
    static NSArray<RAMonsterClass *> *allCases = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allCases = @[
            RAMonsterClass.normal,
            RAMonsterClass.boss,
            RAMonsterClass.guardian,
            RAMonsterClass.battlefield,
            RAMonsterClass.event,
        ];
    });
    return allCases;
}

@end
