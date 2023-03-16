//
//  RARaceGroup.m
//  rAthena
//
//  Created by Leon Li on 2023/3/16.
//

#import "RARaceGroup.h"
#include "map/map.hpp"

@implementation RARaceGroup

+ (RARaceGroup *)goblin {
    static RARaceGroup *goblin = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        goblin = [[RARaceGroup alloc] init];
        goblin.value = RC2_GOBLIN;
        goblin.name = @"Goblin";
        goblin.englishName = @"Goblin";
    });
    return goblin;
}

+ (RARaceGroup *)kobold {
    static RARaceGroup *kobold = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        kobold = [[RARaceGroup alloc] init];
        kobold.value = RC2_KOBOLD;
        kobold.name = @"Kobold";
        kobold.englishName = @"Kobold";
    });
    return kobold;
}

+ (RARaceGroup *)orc {
    static RARaceGroup *orc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        orc = [[RARaceGroup alloc] init];
        orc.value = RC2_ORC;
        orc.name = @"Orc";
        orc.englishName = @"Orc";
    });
    return orc;
}

+ (RARaceGroup *)golem {
    static RARaceGroup *golem = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        golem = [[RARaceGroup alloc] init];
        golem.value = RC2_GOLEM;
        golem.name = @"Golem";
        golem.englishName = @"Golem";
    });
    return golem;
}

+ (RARaceGroup *)guardian {
    static RARaceGroup *guardian = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        guardian = [[RARaceGroup alloc] init];
        guardian.value = RC2_GUARDIAN;
        guardian.name = @"Guardian";
        guardian.englishName = @"Guardian";
    });
    return guardian;
}

+ (RARaceGroup *)ninja {
    static RARaceGroup *ninja = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ninja = [[RARaceGroup alloc] init];
        ninja.value = RC2_NINJA;
        ninja.name = @"Ninja";
        ninja.englishName = @"Ninja";
    });
    return ninja;
}

+ (RARaceGroup *)gvg {
    static RARaceGroup *gvg = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        gvg = [[RARaceGroup alloc] init];
        gvg.value = RC2_GVG;
        gvg.name = @"Gvg";
        gvg.englishName = @"Gvg";
    });
    return gvg;
}

+ (RARaceGroup *)battlefield {
    static RARaceGroup *battlefield = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        battlefield = [[RARaceGroup alloc] init];
        battlefield.value = RC2_BATTLEFIELD;
        battlefield.name = @"Battlefield";
        battlefield.englishName = @"Battlefield";
    });
    return battlefield;
}

+ (RARaceGroup *)treasure {
    static RARaceGroup *treasure = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        treasure = [[RARaceGroup alloc] init];
        treasure.value = RC2_TREASURE;
        treasure.name = @"Treasure";
        treasure.englishName = @"Treasure";
    });
    return treasure;
}

+ (RARaceGroup *)biolab {
    static RARaceGroup *biolab = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        biolab = [[RARaceGroup alloc] init];
        biolab.value = RC2_BIOLAB;
        biolab.name = @"Biolab";
        biolab.englishName = @"Biolab";
    });
    return biolab;
}

+ (RARaceGroup *)manuk {
    static RARaceGroup *manuk = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manuk = [[RARaceGroup alloc] init];
        manuk.value = RC2_MANUK;
        manuk.name = @"Manuk";
        manuk.englishName = @"Manuk";
    });
    return manuk;
}

+ (RARaceGroup *)splendide {
    static RARaceGroup *splendide = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        splendide = [[RARaceGroup alloc] init];
        splendide.value = RC2_SPLENDIDE;
        splendide.name = @"Splendide";
        splendide.englishName = @"Splendide";
    });
    return splendide;
}

+ (RARaceGroup *)scaraba {
    static RARaceGroup *scaraba = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        scaraba = [[RARaceGroup alloc] init];
        scaraba.value = RC2_SCARABA;
        scaraba.name = @"Scaraba";
        scaraba.englishName = @"Scaraba";
    });
    return scaraba;
}

+ (RARaceGroup *)oghAtkDef {
    static RARaceGroup *oghAtkDef = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        oghAtkDef = [[RARaceGroup alloc] init];
        oghAtkDef.value = RC2_OGH_ATK_DEF;
        oghAtkDef.name = @"Ogh_Atk_Def";
        oghAtkDef.englishName = @"Ogh Atk Def";
    });
    return oghAtkDef;
}

+ (RARaceGroup *)oghHidden {
    static RARaceGroup *oghHidden = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        oghHidden = [[RARaceGroup alloc] init];
        oghHidden.value = RC2_OGH_HIDDEN;
        oghHidden.name = @"Ogh_Hidden";
        oghHidden.englishName = @"Ogh Hidden";
    });
    return oghHidden;
}

+ (RARaceGroup *)bio5SwordmanThief {
    static RARaceGroup *bio5SwordmanThief = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bio5SwordmanThief = [[RARaceGroup alloc] init];
        bio5SwordmanThief.value = RC2_BIO5_SWORDMAN_THIEF;
        bio5SwordmanThief.name = @"Bio5_Swordman_Thief";
        bio5SwordmanThief.englishName = @"Bio5 Swordman Thief";
    });
    return bio5SwordmanThief;
}

+ (RARaceGroup *)bio5AcolyteMerchant {
    static RARaceGroup *bio5AcolyteMerchant = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bio5AcolyteMerchant = [[RARaceGroup alloc] init];
        bio5AcolyteMerchant.value = RC2_BIO5_ACOLYTE_MERCHANT;
        bio5AcolyteMerchant.name = @"Bio5_Acolyte_Merchant";
        bio5AcolyteMerchant.englishName = @"Bio5 Acolyte Merchant";
    });
    return bio5AcolyteMerchant;
}

+ (RARaceGroup *)bio5MageArcher {
    static RARaceGroup *bio5MageArcher = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bio5MageArcher = [[RARaceGroup alloc] init];
        bio5MageArcher.value = RC2_BIO5_MAGE_ARCHER;
        bio5MageArcher.name = @"Bio5_Mage_Archer";
        bio5MageArcher.englishName = @"Bio5 Mage Archer";
    });
    return bio5MageArcher;
}

+ (RARaceGroup *)bio5Mvp {
    static RARaceGroup *bio5Mvp = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bio5Mvp = [[RARaceGroup alloc] init];
        bio5Mvp.value = RC2_BIO5_MVP;
        bio5Mvp.name = @"Bio5_Mvp";
        bio5Mvp.englishName = @"Bio5 Mvp";
    });
    return bio5Mvp;
}

+ (RARaceGroup *)clocktower {
    static RARaceGroup *clocktower = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        clocktower = [[RARaceGroup alloc] init];
        clocktower.value = RC2_CLOCKTOWER;
        clocktower.name = @"Clocktower";
        clocktower.englishName = @"Clocktower";
    });
    return clocktower;
}

+ (RARaceGroup *)thanatos {
    static RARaceGroup *thanatos = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        thanatos = [[RARaceGroup alloc] init];
        thanatos.value = RC2_THANATOS;
        thanatos.name = @"Thanatos";
        thanatos.englishName = @"Thanatos";
    });
    return thanatos;
}

+ (RARaceGroup *)faceworm {
    static RARaceGroup *faceworm = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        faceworm = [[RARaceGroup alloc] init];
        faceworm.value = RC2_FACEWORM;
        faceworm.name = @"Faceworm";
        faceworm.englishName = @"Faceworm";
    });
    return faceworm;
}

+ (RARaceGroup *)hearthunter {
    static RARaceGroup *hearthunter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        hearthunter = [[RARaceGroup alloc] init];
        hearthunter.value = RC2_HEARTHUNTER;
        hearthunter.name = @"Hearthunter";
        hearthunter.englishName = @"Hearthunter";
    });
    return hearthunter;
}

+ (RARaceGroup *)rockridge {
    static RARaceGroup *rockridge = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        rockridge = [[RARaceGroup alloc] init];
        rockridge.value = RC2_ROCKRIDGE;
        rockridge.name = @"Rockridge";
        rockridge.englishName = @"Rockridge";
    });
    return rockridge;
}

+ (RARaceGroup *)wernerLab {
    static RARaceGroup *wernerLab = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        wernerLab = [[RARaceGroup alloc] init];
        wernerLab.value = RC2_WERNER_LAB;
        wernerLab.name = @"Werner_Lab";
        wernerLab.englishName = @"Werner Lab";
    });
    return wernerLab;
}

+ (RARaceGroup *)templeDemon {
    static RARaceGroup *templeDemon = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        templeDemon = [[RARaceGroup alloc] init];
        templeDemon.value = RC2_TEMPLE_DEMON;
        templeDemon.name = @"Temple_Demon";
        templeDemon.englishName = @"Temple Demon";
    });
    return templeDemon;
}

+ (RARaceGroup *)illusionVampire {
    static RARaceGroup *illusionVampire = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        illusionVampire = [[RARaceGroup alloc] init];
        illusionVampire.value = RC2_ILLUSION_VAMPIRE;
        illusionVampire.name = @"Illusion_Vampire";
        illusionVampire.englishName = @"Illusion Vampire";
    });
    return illusionVampire;
}

+ (RARaceGroup *)malangdo {
    static RARaceGroup *malangdo = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        malangdo = [[RARaceGroup alloc] init];
        malangdo.value = RC2_MALANGDO;
        malangdo.name = @"Malangdo";
        malangdo.englishName = @"Malangdo";
    });
    return malangdo;
}

+ (NSArray<RARaceGroup *> *)allCases {
    static NSArray<RARaceGroup *> *allCases = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allCases = @[
            RARaceGroup.goblin,
            RARaceGroup.kobold,
            RARaceGroup.orc,
            RARaceGroup.golem,
            RARaceGroup.guardian,
            RARaceGroup.ninja,
            RARaceGroup.gvg,
            RARaceGroup.battlefield,
            RARaceGroup.treasure,
            RARaceGroup.biolab,
            RARaceGroup.manuk,
            RARaceGroup.splendide,
            RARaceGroup.scaraba,
            RARaceGroup.oghAtkDef,
            RARaceGroup.oghHidden,
            RARaceGroup.bio5SwordmanThief,
            RARaceGroup.bio5AcolyteMerchant,
            RARaceGroup.bio5MageArcher,
            RARaceGroup.bio5Mvp,
            RARaceGroup.clocktower,
            RARaceGroup.thanatos,
            RARaceGroup.faceworm,
            RARaceGroup.hearthunter,
            RARaceGroup.rockridge,
            RARaceGroup.wernerLab,
            RARaceGroup.templeDemon,
            RARaceGroup.illusionVampire,
            RARaceGroup.malangdo,
        ];
    });
    return allCases;
}

@end
