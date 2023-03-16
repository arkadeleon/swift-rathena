//
//  RAMonsterMode.m
//  rAthena
//
//  Created by Leon Li on 2023/3/16.
//

#import "RAMonsterMode.h"
#include "common/mmo.hpp"

@implementation RAMonsterMode

+ (RAMonsterMode *)canMove {
    static RAMonsterMode *canMove = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        canMove = [[RAMonsterMode alloc] init];
        canMove.value = MD_CANMOVE;
        canMove.name = @"CanMove";
        canMove.englishName = @"Can Move";
    });
    return canMove;
}

+ (RAMonsterMode *)looter {
    static RAMonsterMode *looter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        looter = [[RAMonsterMode alloc] init];
        looter.value = MD_LOOTER;
        looter.name = @"Looter";
        looter.englishName = @"Looter";
    });
    return looter;
}

+ (RAMonsterMode *)aggressive {
    static RAMonsterMode *aggressive = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        aggressive = [[RAMonsterMode alloc] init];
        aggressive.value = MD_AGGRESSIVE;
        aggressive.name = @"Aggressive";
        aggressive.englishName = @"Aggressive";
    });
    return aggressive;
}

+ (RAMonsterMode *)assist {
    static RAMonsterMode *assist = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        assist = [[RAMonsterMode alloc] init];
        assist.value = MD_ASSIST;
        assist.name = @"Assist";
        assist.englishName = @"Assist";
    });
    return assist;
}

+ (RAMonsterMode *)castSensorIdle {
    static RAMonsterMode *castSensorIdle = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        castSensorIdle = [[RAMonsterMode alloc] init];
        castSensorIdle.value = MD_CASTSENSORIDLE;
        castSensorIdle.name = @"CastSensorIdle";
        castSensorIdle.englishName = @"Cast Sensor Idle";
    });
    return castSensorIdle;
}

+ (RAMonsterMode *)noRandomWalk {
    static RAMonsterMode *noRandomWalk = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        noRandomWalk = [[RAMonsterMode alloc] init];
        noRandomWalk.value = MD_NORANDOMWALK;
        noRandomWalk.name = @"NoRandomWalk";
        noRandomWalk.englishName = @"No Random Walk";
    });
    return noRandomWalk;
}

+ (RAMonsterMode *)noCast {
    static RAMonsterMode *noCast = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        noCast = [[RAMonsterMode alloc] init];
        noCast.value = MD_NOCAST;
        noCast.name = @"NoCast";
        noCast.englishName = @"No Cast";
    });
    return noCast;
}

+ (RAMonsterMode *)canAttack {
    static RAMonsterMode *canAttack = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        canAttack = [[RAMonsterMode alloc] init];
        canAttack.value = MD_CANATTACK;
        canAttack.name = @"CanAttack";
        canAttack.englishName = @"Can Attack";
    });
    return canAttack;
}

+ (RAMonsterMode *)castSensorChase {
    static RAMonsterMode *castSensorChase = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        castSensorChase = [[RAMonsterMode alloc] init];
        castSensorChase.value = MD_CASTSENSORCHASE;
        castSensorChase.name = @"CastSensorChase";
        castSensorChase.englishName = @"Cast Sensor Chase";
    });
    return castSensorChase;
}

+ (RAMonsterMode *)changeChase {
    static RAMonsterMode *changeChase = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        changeChase = [[RAMonsterMode alloc] init];
        changeChase.value = MD_CHANGECHASE;
        changeChase.name = @"ChangeChase";
        changeChase.englishName = @"Change Chase";
    });
    return changeChase;
}

+ (RAMonsterMode *)angry {
    static RAMonsterMode *angry = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        angry = [[RAMonsterMode alloc] init];
        angry.value = MD_ANGRY;
        angry.name = @"Angry";
        angry.englishName = @"Angry";
    });
    return angry;
}

+ (RAMonsterMode *)changeTargetMelee {
    static RAMonsterMode *changeTargetMelee = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        changeTargetMelee = [[RAMonsterMode alloc] init];
        changeTargetMelee.value = MD_CHANGETARGETMELEE;
        changeTargetMelee.name = @"ChangeTargetMelee";
        changeTargetMelee.englishName = @"Change Target Melee";
    });
    return changeTargetMelee;
}

+ (RAMonsterMode *)changeTargetChase {
    static RAMonsterMode *changeTargetChase = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        changeTargetChase = [[RAMonsterMode alloc] init];
        changeTargetChase.value = MD_CHANGETARGETCHASE;
        changeTargetChase.name = @"ChangeTargetChase";
        changeTargetChase.englishName = @"Change Target Chase";
    });
    return changeTargetChase;
}

+ (RAMonsterMode *)targetWeak {
    static RAMonsterMode *targetWeak = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        targetWeak = [[RAMonsterMode alloc] init];
        targetWeak.value = MD_TARGETWEAK;
        targetWeak.name = @"TargetWeak";
        targetWeak.englishName = @"Target Weak";
    });
    return targetWeak;
}

+ (RAMonsterMode *)randomTarget {
    static RAMonsterMode *randomTarget = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        randomTarget = [[RAMonsterMode alloc] init];
        randomTarget.value = MD_RANDOMTARGET;
        randomTarget.name = @"RandomTarget";
        randomTarget.englishName = @"Random Target";
    });
    return randomTarget;
}

+ (RAMonsterMode *)ignoreMelee {
    static RAMonsterMode *ignoreMelee = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ignoreMelee = [[RAMonsterMode alloc] init];
        ignoreMelee.value = MD_IGNOREMELEE;
        ignoreMelee.name = @"IgnoreMelee";
        ignoreMelee.englishName = @"Ignore Melee";
    });
    return ignoreMelee;
}

+ (RAMonsterMode *)ignoreMagic {
    static RAMonsterMode *ignoreMagic = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ignoreMagic = [[RAMonsterMode alloc] init];
        ignoreMagic.value = MD_IGNOREMAGIC;
        ignoreMagic.name = @"IgnoreMagic";
        ignoreMagic.englishName = @"Ignore Magic";
    });
    return ignoreMagic;
}

+ (RAMonsterMode *)ignoreRanged {
    static RAMonsterMode *ignoreRanged = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ignoreRanged = [[RAMonsterMode alloc] init];
        ignoreRanged.value = MD_IGNORERANGED;
        ignoreRanged.name = @"IgnoreRanged";
        ignoreRanged.englishName = @"Ignore Ranged";
    });
    return ignoreRanged;
}

+ (RAMonsterMode *)mvp {
    static RAMonsterMode *mvp = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mvp = [[RAMonsterMode alloc] init];
        mvp.value = MD_MVP;
        mvp.name = @"Mvp";
        mvp.englishName = @"Mvp";
    });
    return mvp;
}

+ (RAMonsterMode *)ignoreMisc {
    static RAMonsterMode *ignoreMisc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ignoreMisc = [[RAMonsterMode alloc] init];
        ignoreMisc.value = MD_IGNOREMISC;
        ignoreMisc.name = @"IgnoreMisc";
        ignoreMisc.englishName = @"Ignore Misc";
    });
    return ignoreMisc;
}

+ (RAMonsterMode *)knockBackImmune {
    static RAMonsterMode *knockBackImmune = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        knockBackImmune = [[RAMonsterMode alloc] init];
        knockBackImmune.value = MD_KNOCKBACKIMMUNE;
        knockBackImmune.name = @"KnockBackImmune";
        knockBackImmune.englishName = @"Knock Back Immune";
    });
    return knockBackImmune;
}

+ (RAMonsterMode *)teleportBlock {
    static RAMonsterMode *teleportBlock = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        teleportBlock = [[RAMonsterMode alloc] init];
        teleportBlock.value = MD_TELEPORTBLOCK;
        teleportBlock.name = @"TeleportBlock";
        teleportBlock.englishName = @"Teleport Block";
    });
    return teleportBlock;
}

+ (RAMonsterMode *)fixedItemDrop {
    static RAMonsterMode *fixedItemDrop = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        fixedItemDrop = [[RAMonsterMode alloc] init];
        fixedItemDrop.value = MD_FIXEDITEMDROP;
        fixedItemDrop.name = @"FixedItemDrop";
        fixedItemDrop.englishName = @"Fixed Item Drop";
    });
    return fixedItemDrop;
}

+ (RAMonsterMode *)detector {
    static RAMonsterMode *detector = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        detector = [[RAMonsterMode alloc] init];
        detector.value = MD_DETECTOR;
        detector.name = @"Detector";
        detector.englishName = @"Detector";
    });
    return detector;
}

+ (RAMonsterMode *)statusImmune {
    static RAMonsterMode *statusImmune = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        statusImmune = [[RAMonsterMode alloc] init];
        statusImmune.value = MD_STATUSIMMUNE;
        statusImmune.name = @"StatusImmune";
        statusImmune.englishName = @"Status Immune";
    });
    return statusImmune;
}

+ (RAMonsterMode *)skillImmune {
    static RAMonsterMode *skillImmune = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        skillImmune = [[RAMonsterMode alloc] init];
        skillImmune.value = MD_SKILLIMMUNE;
        skillImmune.name = @"SkillImmune";
        skillImmune.englishName = @"Skill Immune";
    });
    return skillImmune;
}

+ (NSArray<RAMonsterMode *> *)allCases {
    static NSArray<RAMonsterMode *> *allCases = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allCases = @[
            RAMonsterMode.canMove,
            RAMonsterMode.looter,
            RAMonsterMode.aggressive,
            RAMonsterMode.assist,
            RAMonsterMode.castSensorIdle,
            RAMonsterMode.noRandomWalk,
            RAMonsterMode.noCast,
            RAMonsterMode.canAttack,
            RAMonsterMode.castSensorChase,
            RAMonsterMode.changeChase,
            RAMonsterMode.angry,
            RAMonsterMode.changeTargetMelee,
            RAMonsterMode.changeTargetChase,
            RAMonsterMode.targetWeak,
            RAMonsterMode.randomTarget,
            RAMonsterMode.ignoreMelee,
            RAMonsterMode.ignoreMagic,
            RAMonsterMode.ignoreRanged,
            RAMonsterMode.mvp,
            RAMonsterMode.ignoreMisc,
            RAMonsterMode.knockBackImmune,
            RAMonsterMode.teleportBlock,
            RAMonsterMode.fixedItemDrop,
            RAMonsterMode.detector,
            RAMonsterMode.statusImmune,
            RAMonsterMode.skillImmune,
        ];
    });
    return allCases;
}

@end
