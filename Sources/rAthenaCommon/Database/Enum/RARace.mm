//
//  RARace.m
//  rAthena
//
//  Created by Leon Li on 2023/3/15.
//

#import "RARace.h"
#include "map/map.hpp"

@implementation RARace

+ (RARace *)none {
    static RARace *none = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        none = [[RARace alloc] init];
        none.value = RC_NONE_;
        none.name = @"";
        none.englishName = @"";
    });
    return none;
}

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

+ (RARace *)playerHuman {
    static RARace *playerHuman = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        playerHuman = [[RARace alloc] init];
        playerHuman.value = RC_PLAYER_HUMAN;
        playerHuman.name = @"";
        playerHuman.englishName = @"";
    });
    return playerHuman;
}

+ (RARace *)playerDoram {
    static RARace *playerDoram = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        playerDoram = [[RARace alloc] init];
        playerDoram.value = RC_PLAYER_DORAM;
        playerDoram.name = @"";
        playerDoram.englishName = @"";
    });
    return playerDoram;
}

+ (instancetype)caseOfName:(NSString *)name {
    static NSDictionary<NSString *, RARace *> *raceMap = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        raceMap = @{
            RARace.formless.name.lowercaseString    : RARace.formless,
            RARace.undead.name.lowercaseString      : RARace.undead,
            RARace.brute.name.lowercaseString       : RARace.brute,
            RARace.plant.name.lowercaseString       : RARace.plant,
            RARace.insect.name.lowercaseString      : RARace.insect,
            RARace.fish.name.lowercaseString        : RARace.fish,
            RARace.demon.name.lowercaseString       : RARace.demon,
            RARace.demiHuman.name.lowercaseString   : RARace.demiHuman,
            RARace.angel.name.lowercaseString       : RARace.angel,
            RARace.dragon.name.lowercaseString      : RARace.dragon,
        };
    });

    RARace *race = raceMap[name.lowercaseString];
    return race;
}

@end
