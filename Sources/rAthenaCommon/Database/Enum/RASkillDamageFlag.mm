//
//  RASkillDamageFlag.m
//  rAthena
//
//  Created by Leon Li on 2023/3/22.
//

#import "RASkillDamageFlag.h"
#include "map/skill.hpp"

@implementation RASkillDamageFlag

+ (RASkillDamageFlag *)noDamage {
    static RASkillDamageFlag *noDamage = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        noDamage = [[RASkillDamageFlag alloc] init];
        noDamage.value = NK_NODAMAGE;
        noDamage.name = @"NoDamage";
        noDamage.englishName = @"NoDamage";
    });
    return noDamage;
}

+ (RASkillDamageFlag *)splash {
    static RASkillDamageFlag *splash = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        splash = [[RASkillDamageFlag alloc] init];
        splash.value = NK_SPLASH;
        splash.name = @"Splash";
        splash.englishName = @"Splash";
    });
    return splash;
}

+ (RASkillDamageFlag *)splashSplit {
    static RASkillDamageFlag *splashSplit = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        splashSplit = [[RASkillDamageFlag alloc] init];
        splashSplit.value = NK_SPLASHSPLIT;
        splashSplit.name = @"SplashSplit";
        splashSplit.englishName = @"SplashSplit";
    });
    return splashSplit;
}

+ (RASkillDamageFlag *)ignoreAtkCard {
    static RASkillDamageFlag *ignoreAtkCard = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ignoreAtkCard = [[RASkillDamageFlag alloc] init];
        ignoreAtkCard.value = NK_IGNOREATKCARD;
        ignoreAtkCard.name = @"IgnoreAtkCard";
        ignoreAtkCard.englishName = @"IgnoreAtkCard";
    });
    return ignoreAtkCard;
}

+ (RASkillDamageFlag *)ignoreElement {
    static RASkillDamageFlag *ignoreElement = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ignoreElement = [[RASkillDamageFlag alloc] init];
        ignoreElement.value = NK_IGNOREELEMENT;
        ignoreElement.name = @"IgnoreElement";
        ignoreElement.englishName = @"IgnoreElement";
    });
    return ignoreElement;
}

+ (RASkillDamageFlag *)ignoreDefense {
    static RASkillDamageFlag *ignoreDefense = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ignoreDefense = [[RASkillDamageFlag alloc] init];
        ignoreDefense.value = NK_IGNOREDEFENSE;
        ignoreDefense.name = @"IgnoreDefense";
        ignoreDefense.englishName = @"IgnoreDefense";
    });
    return ignoreDefense;
}

+ (RASkillDamageFlag *)ignoreFlee {
    static RASkillDamageFlag *ignoreFlee = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ignoreFlee = [[RASkillDamageFlag alloc] init];
        ignoreFlee.value = NK_IGNOREFLEE;
        ignoreFlee.name = @"IgnoreFlee";
        ignoreFlee.englishName = @"IgnoreFlee";
    });
    return ignoreFlee;
}

+ (RASkillDamageFlag *)ignoreDefCard {
    static RASkillDamageFlag *ignoreDefCard = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ignoreDefCard = [[RASkillDamageFlag alloc] init];
        ignoreDefCard.value = NK_IGNOREDEFCARD;
        ignoreDefCard.name = @"IgnoreDefCard";
        ignoreDefCard.englishName = @"IgnoreDefCard";
    });
    return ignoreDefCard;
}

+ (RASkillDamageFlag *)ignoreLongCard {
    static RASkillDamageFlag *ignoreLongCard = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ignoreLongCard = [[RASkillDamageFlag alloc] init];
        ignoreLongCard.value = NK_IGNORELONGCARD;
        ignoreLongCard.name = @"IgnoreLongCard";
        ignoreLongCard.englishName = @"IgnoreLongCard";
    });
    return ignoreLongCard;
}

+ (RASkillDamageFlag *)critical {
    static RASkillDamageFlag *critical = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        critical = [[RASkillDamageFlag alloc] init];
        critical.value = NK_CRITICAL;
        critical.name = @"Critical";
        critical.englishName = @"Critical";
    });
    return critical;
}

+ (NSArray<RASkillDamageFlag *> *)allCases {
    static NSArray<RASkillDamageFlag *> *allCases = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allCases = @[
            RASkillDamageFlag.noDamage,
            RASkillDamageFlag.splash,
            RASkillDamageFlag.splashSplit,
            RASkillDamageFlag.ignoreAtkCard,
            RASkillDamageFlag.ignoreElement,
            RASkillDamageFlag.ignoreDefense,
            RASkillDamageFlag.ignoreFlee,
            RASkillDamageFlag.ignoreDefCard,
            RASkillDamageFlag.ignoreLongCard,
            RASkillDamageFlag.critical,
        ];
    });
    return allCases;
}

@end
