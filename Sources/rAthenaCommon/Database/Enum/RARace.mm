//
//  RARace.m
//  rAthena
//
//  Created by Leon Li on 2023/3/15.
//

#import "RARace.h"
#include "map/map.hpp"

@implementation RARace

+ (RARace *)formless {
    static RARace *formless = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formless = [[RARace alloc] init];
        formless.value = RC_FORMLESS;
        formless.name = @"Formless";
        formless.englishName = @"Formless";
    });
    return formless;
}

+ (RARace *)undead {
    static RARace *undead = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        undead = [[RARace alloc] init];
        undead.value = RC_UNDEAD;
        undead.name = @"Undead";
        undead.englishName = @"Undead";
    });
    return undead;
}

+ (RARace *)brute {
    static RARace *brute = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        brute = [[RARace alloc] init];
        brute.value = RC_BRUTE;
        brute.name = @"Brute";
        brute.englishName = @"Brute";
    });
    return brute;
}

+ (RARace *)plant {
    static RARace *plant = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        plant = [[RARace alloc] init];
        plant.value = RC_PLANT;
        plant.name = @"Plant";
        plant.englishName = @"Plant";
    });
    return plant;
}

+ (RARace *)insect {
    static RARace *insect = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        insect = [[RARace alloc] init];
        insect.value = RC_INSECT;
        insect.name = @"Insect";
        insect.englishName = @"Insect";
    });
    return insect;
}

+ (RARace *)fish {
    static RARace *fish = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        fish = [[RARace alloc] init];
        fish.value = RC_FISH;
        fish.name = @"Fish";
        fish.englishName = @"Fish";
    });
    return fish;
}

+ (RARace *)demon {
    static RARace *demon = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        demon = [[RARace alloc] init];
        demon.value = RC_DEMON;
        demon.name = @"Demon";
        demon.englishName = @"Demon";
    });
    return demon;
}

+ (RARace *)demiHuman {
    static RARace *demiHuman = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        demiHuman = [[RARace alloc] init];
        demiHuman.value = RC_DEMIHUMAN;
        demiHuman.name = @"Demihuman";
        demiHuman.englishName = @"Demi-Human";
    });
    return demiHuman;
}

+ (RARace *)angel {
    static RARace *angel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        angel = [[RARace alloc] init];
        angel.value = RC_ANGEL;
        angel.name = @"Angel";
        angel.englishName = @"Angel";
    });
    return angel;
}

+ (RARace *)dragon {
    static RARace *dragon = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dragon = [[RARace alloc] init];
        dragon.value = RC_DRAGON;
        dragon.name = @"Dragon";
        dragon.englishName = @"Dragon";
    });
    return dragon;
}

+ (NSArray<RARace *> *)allCases {
    static NSArray<RARace *> *allCases = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allCases = @[
            RARace.formless,
            RARace.undead,
            RARace.brute,
            RARace.plant,
            RARace.insect,
            RARace.fish,
            RARace.demon,
            RARace.demiHuman,
            RARace.angel,
            RARace.dragon,
        ];
    });
    return allCases;
}

@end
