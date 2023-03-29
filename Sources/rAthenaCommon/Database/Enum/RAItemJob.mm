//
//  RAItemJob.m
//  rAthena
//
//  Created by Leon Li on 2023/3/17.
//

#import "RAItemJob.h"
#include "map/map.hpp"

@implementation RAItemJob

+ (RAItemJob *)acolyte {
    static RAItemJob *acolyte = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        acolyte = [[RAItemJob alloc] init];
        acolyte.value = MAPID_ACOLYTE;
        acolyte.name = @"Acolyte";
        acolyte.englishName = @"Acolyte";
    });
    return acolyte;
}

+ (RAItemJob *)alchemist {
    static RAItemJob *alchemist = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        alchemist = [[RAItemJob alloc] init];
        alchemist.value = MAPID_ALCHEMIST;
        alchemist.name = @"Alchemist";
        alchemist.englishName = @"Alchemist";
    });
    return alchemist;
}

+ (RAItemJob *)archer {
    static RAItemJob *archer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        archer = [[RAItemJob alloc] init];
        archer.value = MAPID_ARCHER;
        archer.name = @"Archer";
        archer.englishName = @"Archer";
    });
    return archer;
}

+ (RAItemJob *)assassin {
    static RAItemJob *assassin = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        assassin = [[RAItemJob alloc] init];
        assassin.value = MAPID_ASSASSIN;
        assassin.name = @"Assassin";
        assassin.englishName = @"Assassin";
    });
    return assassin;
}

+ (RAItemJob *)bardDancer {
    static RAItemJob *bardDancer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bardDancer = [[RAItemJob alloc] init];
        bardDancer.value = MAPID_BARDDANCER;
        bardDancer.name = @"BardDancer";
        bardDancer.englishName = @"Bard / Dancer";
    });
    return bardDancer;
}

+ (RAItemJob *)blacksmith {
    static RAItemJob *blacksmith = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        blacksmith = [[RAItemJob alloc] init];
        blacksmith.value = MAPID_BLACKSMITH;
        blacksmith.name = @"Blacksmith";
        blacksmith.englishName = @"Blacksmith";
    });
    return blacksmith;
}

+ (RAItemJob *)crusader {
    static RAItemJob *crusader = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        crusader = [[RAItemJob alloc] init];
        crusader.value = MAPID_CRUSADER;
        crusader.name = @"Crusader";
        crusader.englishName = @"Crusader";
    });
    return crusader;
}

+ (RAItemJob *)gunslinger {
    static RAItemJob *gunslinger = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        gunslinger = [[RAItemJob alloc] init];
        gunslinger.value = MAPID_GUNSLINGER;
        gunslinger.name = @"Gunslinger";
        gunslinger.englishName = @"Gunslinger";
    });
    return gunslinger;
}

+ (RAItemJob *)hunter {
    static RAItemJob *hunter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        hunter = [[RAItemJob alloc] init];
        hunter.value = MAPID_HUNTER;
        hunter.name = @"Hunter";
        hunter.englishName = @"Hunter";
    });
    return hunter;
}

+ (RAItemJob *)kagerouOboro {
    static RAItemJob *kagerouOboro = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        kagerouOboro = [[RAItemJob alloc] init];
        kagerouOboro.value = MAPID_KAGEROUOBORO;
        kagerouOboro.name = @"KagerouOboro";
        kagerouOboro.englishName = @"Kagerou / Oboro";
    });
    return kagerouOboro;
}

+ (RAItemJob *)knight {
    static RAItemJob *knight = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        knight = [[RAItemJob alloc] init];
        knight.value = MAPID_KNIGHT;
        knight.name = @"Knight";
        knight.englishName = @"Knight";
    });
    return knight;
}

+ (RAItemJob *)magician {
    static RAItemJob *magician = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        magician = [[RAItemJob alloc] init];
        magician.value = MAPID_MAGE;
        magician.name = @"Mage";
        magician.englishName = @"Mage";
    });
    return magician;
}

+ (RAItemJob *)merchant {
    static RAItemJob *merchant = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        merchant = [[RAItemJob alloc] init];
        merchant.value = MAPID_MERCHANT;
        merchant.name = @"Merchant";
        merchant.englishName = @"Merchant";
    });
    return merchant;
}

+ (RAItemJob *)monk {
    static RAItemJob *monk = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        monk = [[RAItemJob alloc] init];
        monk.value = MAPID_MONK;
        monk.name = @"Monk";
        monk.englishName = @"Monk";
    });
    return monk;
}

+ (RAItemJob *)ninja {
    static RAItemJob *ninja = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ninja = [[RAItemJob alloc] init];
        ninja.value = MAPID_NINJA;
        ninja.name = @"Ninja";
        ninja.englishName = @"Ninja";
    });
    return ninja;
}

+ (RAItemJob *)novice {
    static RAItemJob *novice = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        novice = [[RAItemJob alloc] init];
        novice.value = MAPID_NOVICE;
        novice.name = @"Novice";
        novice.englishName = @"Novice";
    });
    return novice;
}

+ (RAItemJob *)priest {
    static RAItemJob *priest = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        priest = [[RAItemJob alloc] init];
        priest.value = MAPID_PRIEST;
        priest.name = @"Priest";
        priest.englishName = @"Priest";
    });
    return priest;
}

+ (RAItemJob *)rebellion {
    static RAItemJob *rebellion = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        rebellion = [[RAItemJob alloc] init];
        rebellion.value = MAPID_REBELLION;
        rebellion.name = @"Rebellion";
        rebellion.englishName = @"Rebellion";
    });
    return rebellion;
}

+ (RAItemJob *)rogue {
    static RAItemJob *rogue = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        rogue = [[RAItemJob alloc] init];
        rogue.value = MAPID_ROGUE;
        rogue.name = @"Rogue";
        rogue.englishName = @"Rogue";
    });
    return rogue;
}

+ (RAItemJob *)sage {
    static RAItemJob *sage = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sage = [[RAItemJob alloc] init];
        sage.value = MAPID_SAGE;
        sage.name = @"Sage";
        sage.englishName = @"Sage";
    });
    return sage;
}

+ (RAItemJob *)soulLinker {
    static RAItemJob *soulLinker = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        soulLinker = [[RAItemJob alloc] init];
        soulLinker.value = MAPID_SOUL_LINKER;
        soulLinker.name = @"SoulLinker";
        soulLinker.englishName = @"Soul Linker";
    });
    return soulLinker;
}

+ (RAItemJob *)starGladiator {
    static RAItemJob *starGladiator = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        starGladiator = [[RAItemJob alloc] init];
        starGladiator.value = MAPID_STAR_GLADIATOR;
        starGladiator.name = @"StarGladiator";
        starGladiator.englishName = @"Star Gladiator";
    });
    return starGladiator;
}

+ (RAItemJob *)summoner {
    static RAItemJob *summoner = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        summoner = [[RAItemJob alloc] init];
        summoner.value = MAPID_SUMMONER;
        summoner.name = @"Summoner";
        summoner.englishName = @"Summoner";
    });
    return summoner;
}

+ (RAItemJob *)superNovice {
    static RAItemJob *superNovice = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        superNovice = [[RAItemJob alloc] init];
        superNovice.value = MAPID_SUPER_NOVICE;
        superNovice.name = @"SuperNovice";
        superNovice.englishName = @"Super Novice";
    });
    return superNovice;
}

+ (RAItemJob *)swordman {
    static RAItemJob *swordman = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        swordman = [[RAItemJob alloc] init];
        swordman.value = MAPID_SWORDMAN;
        swordman.name = @"Swordman";
        swordman.englishName = @"Swordman";
    });
    return swordman;
}

+ (RAItemJob *)taekwon {
    static RAItemJob *taekwon = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        taekwon = [[RAItemJob alloc] init];
        taekwon.value = MAPID_TAEKWON;
        taekwon.name = @"Taekwon";
        taekwon.englishName = @"Taekwon";
    });
    return taekwon;
}

+ (RAItemJob *)thief {
    static RAItemJob *thief = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        thief = [[RAItemJob alloc] init];
        thief.value = MAPID_THIEF;
        thief.name = @"Thief";
        thief.englishName = @"Thief";
    });
    return thief;
}

+ (RAItemJob *)wizard {
    static RAItemJob *wizard = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        wizard = [[RAItemJob alloc] init];
        wizard.value = MAPID_WIZARD;
        wizard.name = @"Wizard";
        wizard.englishName = @"Wizard";
    });
    return wizard;
}

+ (NSArray<RAItemJob *> *)allCases {
    static NSArray<RAItemJob *> *allCases = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allCases = @[
            RAItemJob.acolyte,
            RAItemJob.alchemist,
            RAItemJob.archer,
            RAItemJob.assassin,
            RAItemJob.bardDancer,
            RAItemJob.blacksmith,
            RAItemJob.crusader,
            RAItemJob.gunslinger,
            RAItemJob.hunter,
            RAItemJob.kagerouOboro,
            RAItemJob.knight,
            RAItemJob.magician,
            RAItemJob.merchant,
            RAItemJob.monk,
            RAItemJob.ninja,
            RAItemJob.novice,
            RAItemJob.priest,
            RAItemJob.rebellion,
            RAItemJob.rogue,
            RAItemJob.sage,
            RAItemJob.soulLinker,
            RAItemJob.starGladiator,
            RAItemJob.summoner,
            RAItemJob.superNovice,
            RAItemJob.swordman,
            RAItemJob.taekwon,
            RAItemJob.thief,
            RAItemJob.wizard,
        ];
    });
    return allCases;
}

+ (NSSet *)valuesOfNames:(NSDictionary<NSString *, NSNumber *> *)names {
    NSMutableSet<RAItemJob *> *values = [[NSMutableSet alloc] init];

    NSNumber *all = names[@"All"];
    if (all && all.boolValue) {
        [values addObjectsFromArray:RAItemJob.allCases];
    }

    [names enumerateKeysAndObjectsUsingBlock:^(NSString *name, NSNumber *included, BOOL *stop) {
        RAItemJob *value = [RAItemJob valueOfName:name];
        if (value) {
            if (included.boolValue) {
                [values addObject:value];
            } else {
                [values removeObject:value];
            }
        }
    }];

    return [values copy];
}

@end
