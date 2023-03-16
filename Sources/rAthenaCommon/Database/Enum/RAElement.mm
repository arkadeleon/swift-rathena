//
//  RAElement.m
//  rAthena
//
//  Created by Leon Li on 2023/3/16.
//

#import "RAElement.h"
#include "map/map.hpp"

@implementation RAElement

+ (RAElement *)neutral {
    static RAElement *neutral = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        neutral = [[RAElement alloc] init];
        neutral.value = ELE_NEUTRAL;
        neutral.name = @"Neutral";
        neutral.englishName = @"Neutral";
    });
    return neutral;
}

+ (RAElement *)water {
    static RAElement *water = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        water = [[RAElement alloc] init];
        water.value = ELE_WATER;
        water.name = @"Water";
        water.englishName = @"Water";
    });
    return water;
}

+ (RAElement *)earth {
    static RAElement *earth = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        earth = [[RAElement alloc] init];
        earth.value = ELE_EARTH;
        earth.name = @"Earth";
        earth.englishName = @"Earth";
    });
    return earth;
}

+ (RAElement *)fire {
    static RAElement *fire = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        fire = [[RAElement alloc] init];
        fire.value = ELE_FIRE;
        fire.name = @"Fire";
        fire.englishName = @"Fire";
    });
    return fire;
}

+ (RAElement *)wind {
    static RAElement *wind = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        wind = [[RAElement alloc] init];
        wind.value = ELE_WIND;
        wind.name = @"Wind";
        wind.englishName = @"Wind";
    });
    return wind;
}

+ (RAElement *)poison {
    static RAElement *poison = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        poison = [[RAElement alloc] init];
        poison.value = ELE_POISON;
        poison.name = @"Poison";
        poison.englishName = @"Poison";
    });
    return poison;
}

+ (RAElement *)holy {
    static RAElement *holy = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        holy = [[RAElement alloc] init];
        holy.value = ELE_HOLY;
        holy.name = @"Holy";
        holy.englishName = @"Holy";
    });
    return holy;
}

+ (RAElement *)dark {
    static RAElement *dark = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dark = [[RAElement alloc] init];
        dark.value = ELE_DARK;
        dark.name = @"Dark";
        dark.englishName = @"Dark";
    });
    return dark;
}

+ (RAElement *)ghost {
    static RAElement *ghost = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ghost = [[RAElement alloc] init];
        ghost.value = ELE_GHOST;
        ghost.name = @"Ghost";
        ghost.englishName = @"Ghost";
    });
    return ghost;
}

+ (RAElement *)undead {
    static RAElement *undead = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        undead = [[RAElement alloc] init];
        undead.value = ELE_UNDEAD;
        undead.name = @"Undead";
        undead.englishName = @"Undead";
    });
    return undead;
}

+ (RAElement *)weapon {
    static RAElement *weapon = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        weapon = [[RAElement alloc] init];
        weapon.value = ELE_WEAPON;
        weapon.name = @"Weapon";
        weapon.englishName = @"Weapon";
    });
    return weapon;
}

+ (RAElement *)endowed {
    static RAElement *endowed = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        endowed = [[RAElement alloc] init];
        endowed.value = ELE_ENDOWED;
        endowed.name = @"Endowed";
        endowed.englishName = @"Endowed";
    });
    return endowed;
}

+ (RAElement *)random {
    static RAElement *random = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        random = [[RAElement alloc] init];
        random.value = ELE_RANDOM;
        random.name = @"Random";
        random.englishName = @"Random";
    });
    return random;
}

+ (NSArray<RAElement *> *)allCases {
    static NSArray<RAElement *> *allCases = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allCases = @[
            RAElement.neutral,
            RAElement.water,
            RAElement.earth,
            RAElement.fire,
            RAElement.wind,
            RAElement.poison,
            RAElement.holy,
            RAElement.dark,
            RAElement.ghost,
            RAElement.undead,
            RAElement.weapon,
            RAElement.endowed,
            RAElement.random,
        ];
    });
    return allCases;
}

@end
