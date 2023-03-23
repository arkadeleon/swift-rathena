//
//  RASkillFlag.m
//  rAthena
//
//  Created by Leon Li on 2023/3/22.
//

#import "RASkillFlag.h"
#include "map/skill.hpp"

@implementation RASkillFlag

+ (RASkillFlag *)isQuest {
    static RASkillFlag *isQuest = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isQuest = [[RASkillFlag alloc] init];
        isQuest.value = INF2_ISQUEST;
        isQuest.name = @"IsQuest";
        isQuest.englishName = @"IsQuest";
    });
    return isQuest;
}

+ (RASkillFlag *)isNpc {
    static RASkillFlag *isNpc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isNpc = [[RASkillFlag alloc] init];
        isNpc.value = INF2_ISNPC;
        isNpc.name = @"IsNpc";
        isNpc.englishName = @"IsNpc";
    });
    return isNpc;
}

+ (RASkillFlag *)isWedding {
    static RASkillFlag *isWedding = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isWedding = [[RASkillFlag alloc] init];
        isWedding.value = INF2_ISWEDDING;
        isWedding.name = @"IsWedding";
        isWedding.englishName = @"IsWedding";
    });
    return isWedding;
}

+ (RASkillFlag *)isSpirit {
    static RASkillFlag *isSpirit = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isSpirit = [[RASkillFlag alloc] init];
        isSpirit.value = INF2_ISSPIRIT;
        isSpirit.name = @"IsSpirit";
        isSpirit.englishName = @"IsSpirit";
    });
    return isSpirit;
}

+ (RASkillFlag *)isGuild {
    static RASkillFlag *isGuild = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isGuild = [[RASkillFlag alloc] init];
        isGuild.value = INF2_ISGUILD;
        isGuild.name = @"IsGuild";
        isGuild.englishName = @"IsGuild";
    });
    return isGuild;
}

+ (RASkillFlag *)isSong {
    static RASkillFlag *isSong = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isSong = [[RASkillFlag alloc] init];
        isSong.value = INF2_ISSONG;
        isSong.name = @"IsSong";
        isSong.englishName = @"IsSong";
    });
    return isSong;
}

+ (RASkillFlag *)isEnsemble {
    static RASkillFlag *isEnsemble = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isEnsemble = [[RASkillFlag alloc] init];
        isEnsemble.value = INF2_ISENSEMBLE;
        isEnsemble.name = @"IsEnsemble";
        isEnsemble.englishName = @"IsEnsemble";
    });
    return isEnsemble;
}

+ (RASkillFlag *)isTrap {
    static RASkillFlag *isTrap = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isTrap = [[RASkillFlag alloc] init];
        isTrap.value = INF2_ISTRAP;
        isTrap.name = @"IsTrap";
        isTrap.englishName = @"IsTrap";
    });
    return isTrap;
}

+ (RASkillFlag *)targetSelf {
    static RASkillFlag *targetSelf = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        targetSelf = [[RASkillFlag alloc] init];
        targetSelf.value = INF2_TARGETSELF;
        targetSelf.name = @"TargetSelf";
        targetSelf.englishName = @"TargetSelf";
    });
    return targetSelf;
}

+ (RASkillFlag *)noTargetSelf {
    static RASkillFlag *noTargetSelf = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        noTargetSelf = [[RASkillFlag alloc] init];
        noTargetSelf.value = INF2_NOTARGETSELF;
        noTargetSelf.name = @"NoTargetSelf";
        noTargetSelf.englishName = @"NoTargetSelf";
    });
    return noTargetSelf;
}

+ (RASkillFlag *)partyOnly {
    static RASkillFlag *partyOnly = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        partyOnly = [[RASkillFlag alloc] init];
        partyOnly.value = INF2_PARTYONLY;
        partyOnly.name = @"PartyOnly";
        partyOnly.englishName = @"PartyOnly";
    });
    return partyOnly;
}

+ (RASkillFlag *)guildOnly {
    static RASkillFlag *guildOnly = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        guildOnly = [[RASkillFlag alloc] init];
        guildOnly.value = INF2_GUILDONLY;
        guildOnly.name = @"GuildOnly";
        guildOnly.englishName = @"GuildOnly";
    });
    return guildOnly;
}

+ (RASkillFlag *)noTargetEnemy {
    static RASkillFlag *noTargetEnemy = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        noTargetEnemy = [[RASkillFlag alloc] init];
        noTargetEnemy.value = INF2_NOTARGETENEMY;
        noTargetEnemy.name = @"NoTargetEnemy";
        noTargetEnemy.englishName = @"NoTargetEnemy";
    });
    return noTargetEnemy;
}

+ (RASkillFlag *)isAutoShadowSpell {
    static RASkillFlag *isAutoShadowSpell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isAutoShadowSpell = [[RASkillFlag alloc] init];
        isAutoShadowSpell.value = INF2_ISAUTOSHADOWSPELL;
        isAutoShadowSpell.name = @"IsAutoShadowSpell";
        isAutoShadowSpell.englishName = @"IsAutoShadowSpell";
    });
    return isAutoShadowSpell;
}

+ (RASkillFlag *)isChorus {
    static RASkillFlag *isChorus = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isChorus = [[RASkillFlag alloc] init];
        isChorus.value = INF2_ISCHORUS;
        isChorus.name = @"IsChorus";
        isChorus.englishName = @"IsChorus";
    });
    return isChorus;
}

+ (RASkillFlag *)ignoreBgReduction {
    static RASkillFlag *ignoreBgReduction = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ignoreBgReduction = [[RASkillFlag alloc] init];
        ignoreBgReduction.value = INF2_IGNOREBGREDUCTION;
        ignoreBgReduction.name = @"IgnoreBgReduction";
        ignoreBgReduction.englishName = @"IgnoreBgReduction";
    });
    return ignoreBgReduction;
}

+ (RASkillFlag *)ignoreGvgReduction {
    static RASkillFlag *ignoreGvgReduction = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ignoreGvgReduction = [[RASkillFlag alloc] init];
        ignoreGvgReduction.value = INF2_IGNOREGVGREDUCTION;
        ignoreGvgReduction.name = @"IgnoreGvgReduction";
        ignoreGvgReduction.englishName = @"IgnoreGvgReduction";
    });
    return ignoreGvgReduction;
}

+ (RASkillFlag *)disableNearNpc {
    static RASkillFlag *disableNearNpc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        disableNearNpc = [[RASkillFlag alloc] init];
        disableNearNpc.value = INF2_DISABLENEARNPC;
        disableNearNpc.name = @"DisableNearNpc";
        disableNearNpc.englishName = @"DisableNearNpc";
    });
    return disableNearNpc;
}

+ (RASkillFlag *)targetTrap {
    static RASkillFlag *targetTrap = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        targetTrap = [[RASkillFlag alloc] init];
        targetTrap.value = INF2_TARGETTRAP;
        targetTrap.name = @"TargetTrap";
        targetTrap.englishName = @"TargetTrap";
    });
    return targetTrap;
}

+ (RASkillFlag *)ignoreLandProtector {
    static RASkillFlag *ignoreLandProtector = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ignoreLandProtector = [[RASkillFlag alloc] init];
        ignoreLandProtector.value = INF2_IGNORELANDPROTECTOR;
        ignoreLandProtector.name = @"IgnoreLandProtector";
        ignoreLandProtector.englishName = @"IgnoreLandProtector";
    });
    return ignoreLandProtector;
}

+ (RASkillFlag *)allowWhenHidden {
    static RASkillFlag *allowWhenHidden = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allowWhenHidden = [[RASkillFlag alloc] init];
        allowWhenHidden.value = INF2_ALLOWWHENHIDDEN;
        allowWhenHidden.name = @"AllowWhenHidden";
        allowWhenHidden.englishName = @"AllowWhenHidden";
    });
    return allowWhenHidden;
}

+ (RASkillFlag *)allowWhenPerforming {
    static RASkillFlag *allowWhenPerforming = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allowWhenPerforming = [[RASkillFlag alloc] init];
        allowWhenPerforming.value = INF2_ALLOWWHENPERFORMING;
        allowWhenPerforming.name = @"AllowWhenPerforming";
        allowWhenPerforming.englishName = @"AllowWhenPerforming";
    });
    return allowWhenPerforming;
}

+ (RASkillFlag *)targetEmperium {
    static RASkillFlag *targetEmperium = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        targetEmperium = [[RASkillFlag alloc] init];
        targetEmperium.value = INF2_TARGETEMPERIUM;
        targetEmperium.name = @"TargetEmperium";
        targetEmperium.englishName = @"TargetEmperium";
    });
    return targetEmperium;
}

+ (RASkillFlag *)ignoreKagehumi {
    static RASkillFlag *ignoreKagehumi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ignoreKagehumi = [[RASkillFlag alloc] init];
        ignoreKagehumi.value = INF2_IGNOREKAGEHUMI;
        ignoreKagehumi.name = @"IgnoreKagehumi";
        ignoreKagehumi.englishName = @"IgnoreKagehumi";
    });
    return ignoreKagehumi;
}

+ (RASkillFlag *)alterRangeVulture {
    static RASkillFlag *alterRangeVulture = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        alterRangeVulture = [[RASkillFlag alloc] init];
        alterRangeVulture.value = INF2_ALTERRANGEVULTURE;
        alterRangeVulture.name = @"AlterRangeVulture";
        alterRangeVulture.englishName = @"AlterRangeVulture";
    });
    return alterRangeVulture;
}

+ (RASkillFlag *)alterRangeSnakeEye {
    static RASkillFlag *alterRangeSnakeEye = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        alterRangeSnakeEye = [[RASkillFlag alloc] init];
        alterRangeSnakeEye.value = INF2_ALTERRANGESNAKEEYE;
        alterRangeSnakeEye.name = @"AlterRangeSnakeEye";
        alterRangeSnakeEye.englishName = @"AlterRangeSnakeEye";
    });
    return alterRangeSnakeEye;
}

+ (RASkillFlag *)alterRangeShadowJump {
    static RASkillFlag *alterRangeShadowJump = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        alterRangeShadowJump = [[RASkillFlag alloc] init];
        alterRangeShadowJump.value = INF2_ALTERRANGESHADOWJUMP;
        alterRangeShadowJump.name = @"AlterRangeShadowJump";
        alterRangeShadowJump.englishName = @"AlterRangeShadowJump";
    });
    return alterRangeShadowJump;
}

+ (RASkillFlag *)alterRangeRadius {
    static RASkillFlag *alterRangeRadius = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        alterRangeRadius = [[RASkillFlag alloc] init];
        alterRangeRadius.value = INF2_ALTERRANGERADIUS;
        alterRangeRadius.name = @"AlterRangeRadius";
        alterRangeRadius.englishName = @"AlterRangeRadius";
    });
    return alterRangeRadius;
}

+ (RASkillFlag *)alterRangeResearchTrap {
    static RASkillFlag *alterRangeResearchTrap = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        alterRangeResearchTrap = [[RASkillFlag alloc] init];
        alterRangeResearchTrap.value = INF2_ALTERRANGERESEARCHTRAP;
        alterRangeResearchTrap.name = @"AlterRangeResearchTrap";
        alterRangeResearchTrap.englishName = @"AlterRangeResearchTrap";
    });
    return alterRangeResearchTrap;
}

+ (RASkillFlag *)ignoreHovering {
    static RASkillFlag *ignoreHovering = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ignoreHovering = [[RASkillFlag alloc] init];
        ignoreHovering.value = INF2_IGNOREHOVERING;
        ignoreHovering.name = @"IgnoreHovering";
        ignoreHovering.englishName = @"IgnoreHovering";
    });
    return ignoreHovering;
}

+ (RASkillFlag *)allowOnWarg {
    static RASkillFlag *allowOnWarg = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allowOnWarg = [[RASkillFlag alloc] init];
        allowOnWarg.value = INF2_ALLOWONWARG;
        allowOnWarg.name = @"AllowOnWarg";
        allowOnWarg.englishName = @"AllowOnWarg";
    });
    return allowOnWarg;
}

+ (RASkillFlag *)allowOnMado {
    static RASkillFlag *allowOnMado = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allowOnMado = [[RASkillFlag alloc] init];
        allowOnMado.value = INF2_ALLOWONMADO;
        allowOnMado.name = @"AllowOnMado";
        allowOnMado.englishName = @"AllowOnMado";
    });
    return allowOnMado;
}

+ (RASkillFlag *)targetManHole {
    static RASkillFlag *targetManHole = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        targetManHole = [[RASkillFlag alloc] init];
        targetManHole.value = INF2_TARGETMANHOLE;
        targetManHole.name = @"TargetManHole";
        targetManHole.englishName = @"TargetManHole";
    });
    return targetManHole;
}

+ (RASkillFlag *)targetHidden {
    static RASkillFlag *targetHidden = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        targetHidden = [[RASkillFlag alloc] init];
        targetHidden.value = INF2_TARGETHIDDEN;
        targetHidden.name = @"TargetHidden";
        targetHidden.englishName = @"TargetHidden";
    });
    return targetHidden;
}

+ (RASkillFlag *)increaseDanceWithWugDamage {
    static RASkillFlag *increaseDanceWithWugDamage = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        increaseDanceWithWugDamage = [[RASkillFlag alloc] init];
        increaseDanceWithWugDamage.value = INF2_INCREASEDANCEWITHWUGDAMAGE;
        increaseDanceWithWugDamage.name = @"IncreaseDanceWithWugDamage";
        increaseDanceWithWugDamage.englishName = @"IncreaseDanceWithWugDamage";
    });
    return increaseDanceWithWugDamage;
}

+ (RASkillFlag *)ignoreWugBite {
    static RASkillFlag *ignoreWugBite = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ignoreWugBite = [[RASkillFlag alloc] init];
        ignoreWugBite.value = INF2_IGNOREWUGBITE;
        ignoreWugBite.name = @"IgnoreWugBite";
        ignoreWugBite.englishName = @"IgnoreWugBite";
    });
    return ignoreWugBite;
}

+ (RASkillFlag *)ignoreAutoGuard {
    static RASkillFlag *ignoreAutoGuard = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ignoreAutoGuard = [[RASkillFlag alloc] init];
        ignoreAutoGuard.value = INF2_IGNOREAUTOGUARD;
        ignoreAutoGuard.name = @"IgnoreAutoGuard";
        ignoreAutoGuard.englishName = @"IgnoreAutoGuard";
    });
    return ignoreAutoGuard;
}

+ (RASkillFlag *)ignoreCicada {
    static RASkillFlag *ignoreCicada = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ignoreCicada = [[RASkillFlag alloc] init];
        ignoreCicada.value = INF2_IGNORECICADA;
        ignoreCicada.name = @"IgnoreCicada";
        ignoreCicada.englishName = @"IgnoreCicada";
    });
    return ignoreCicada;
}

+ (RASkillFlag *)showScale {
    static RASkillFlag *showScale = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        showScale = [[RASkillFlag alloc] init];
        showScale.value = INF2_SHOWSCALE;
        showScale.name = @"ShowScale";
        showScale.englishName = @"ShowScale";
    });
    return showScale;
}

+ (RASkillFlag *)ignoreGtb {
    static RASkillFlag *ignoreGtb = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ignoreGtb = [[RASkillFlag alloc] init];
        ignoreGtb.value = INF2_IGNOREGTB;
        ignoreGtb.name = @"IgnoreGtb";
        ignoreGtb.englishName = @"IgnoreGtb";
    });
    return ignoreGtb;
}

+ (RASkillFlag *)toggleable {
    static RASkillFlag *toggleable = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        toggleable = [[RASkillFlag alloc] init];
        toggleable.value = INF2_TOGGLEABLE;
        toggleable.name = @"Toggleable";
        toggleable.englishName = @"Toggleable";
    });
    return toggleable;
}

+ (NSArray<RAEnum *> *)allCases {
    static NSArray<RASkillFlag *> *allCases = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allCases = @[
            RASkillFlag.isQuest,
            RASkillFlag.isNpc,
            RASkillFlag.isWedding,
            RASkillFlag.isSpirit,
            RASkillFlag.isGuild,
            RASkillFlag.isSong,
            RASkillFlag.isEnsemble,
            RASkillFlag.isTrap,
            RASkillFlag.targetSelf,
            RASkillFlag.noTargetSelf,
            RASkillFlag.partyOnly,
            RASkillFlag.guildOnly,
            RASkillFlag.noTargetEnemy,
            RASkillFlag.isAutoShadowSpell,
            RASkillFlag.isChorus,
            RASkillFlag.ignoreBgReduction,
            RASkillFlag.ignoreGvgReduction,
            RASkillFlag.disableNearNpc,
            RASkillFlag.targetTrap,
            RASkillFlag.ignoreLandProtector,
            RASkillFlag.allowWhenHidden,
            RASkillFlag.allowWhenPerforming,
            RASkillFlag.targetEmperium,
            RASkillFlag.ignoreKagehumi,
            RASkillFlag.alterRangeVulture,
            RASkillFlag.alterRangeSnakeEye,
            RASkillFlag.alterRangeShadowJump,
            RASkillFlag.alterRangeRadius,
            RASkillFlag.alterRangeResearchTrap,
            RASkillFlag.ignoreHovering,
            RASkillFlag.allowOnWarg,
            RASkillFlag.allowOnMado,
            RASkillFlag.targetManHole,
            RASkillFlag.targetHidden,
            RASkillFlag.increaseDanceWithWugDamage,
            RASkillFlag.ignoreWugBite,
            RASkillFlag.ignoreAutoGuard,
            RASkillFlag.ignoreCicada,
            RASkillFlag.showScale,
            RASkillFlag.ignoreGtb,
            RASkillFlag.toggleable,
        ];
    });
    return allCases;
}

@end
