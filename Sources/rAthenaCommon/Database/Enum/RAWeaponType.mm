//
//  RAWeaponType.m
//  rAthena
//
//  Created by Leon Li on 2023/3/13.
//

#import "RAWeaponType.h"

#include "map/pc.hpp"

@implementation RAWeaponType

+ (RAWeaponType *)fist {
    static RAWeaponType *fist = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        fist = [[RAWeaponType alloc] init];
        fist.typeID = W_FIST;
        fist.aegisName = @"Fist";
        fist.name = @"Fist";
    });
    return fist;
}

+ (RAWeaponType *)dagger {
    static RAWeaponType *dagger = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dagger = [[RAWeaponType alloc] init];
        dagger.typeID = W_DAGGER;
        dagger.aegisName = @"Dagger";
        dagger.name = @"Dagger";
    });
    return dagger;
}

+ (RAWeaponType *)oneHandedSword {
    static RAWeaponType *oneHandedSword = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        oneHandedSword = [[RAWeaponType alloc] init];
        oneHandedSword.typeID = W_1HSWORD;
        oneHandedSword.aegisName = @"1hSword";
        oneHandedSword.name = @"One-Handed Sword";
    });
    return oneHandedSword;
}

+ (RAWeaponType *)twoHandedSword {
    static RAWeaponType *twoHandedSword = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        twoHandedSword = [[RAWeaponType alloc] init];
        twoHandedSword.typeID = W_2HSWORD;
        twoHandedSword.aegisName = @"2hSword";
        twoHandedSword.name = @"Two-Handed Sword";
    });
    return twoHandedSword;
}

+ (RAWeaponType *)oneHandedSpear {
    static RAWeaponType *oneHandedSpear = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        oneHandedSpear = [[RAWeaponType alloc] init];
        oneHandedSpear.typeID = W_1HSPEAR;
        oneHandedSpear.aegisName = @"1hSpear";
        oneHandedSpear.name = @"One-Handed Spear";
    });
    return oneHandedSpear;
}

+ (RAWeaponType *)twoHandedSpear {
    static RAWeaponType *twoHandedSpear = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        twoHandedSpear = [[RAWeaponType alloc] init];
        twoHandedSpear.typeID = W_2HSPEAR;
        twoHandedSpear.aegisName = @"2hSpear";
        twoHandedSpear.name = @"Two-Handed Spear";
    });
    return twoHandedSpear;
}

+ (RAWeaponType *)oneHandedAxe {
    static RAWeaponType *oneHandedAxe = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        oneHandedAxe = [[RAWeaponType alloc] init];
        oneHandedAxe.typeID = W_1HAXE;
        oneHandedAxe.aegisName = @"1hAxe";
        oneHandedAxe.name = @"One-Handed Axe";
    });
    return oneHandedAxe;
}

+ (RAWeaponType *)twoHandedAxe {
    static RAWeaponType *twoHandedAxe = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        twoHandedAxe = [[RAWeaponType alloc] init];
        twoHandedAxe.typeID = W_2HAXE;
        twoHandedAxe.aegisName = @"2hAxe";
        twoHandedAxe.name = @"Two-Handed Axe";
    });
    return twoHandedAxe;
}

+ (RAWeaponType *)mace {
    static RAWeaponType *mace = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mace = [[RAWeaponType alloc] init];
        mace.typeID = W_MACE;
        mace.aegisName = @"Mace";
        mace.name = @"Mace";
    });
    return mace;
}

+ (RAWeaponType *)twoHandedMace {
    static RAWeaponType *twoHandedMace = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        twoHandedMace = [[RAWeaponType alloc] init];
        twoHandedMace.typeID = W_2HMACE;
        twoHandedMace.aegisName = @"2hMace";
        twoHandedMace.name = @"Two-Handed Mace";
    });
    return twoHandedMace;
}

+ (RAWeaponType *)staff {
    static RAWeaponType *staff = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        staff = [[RAWeaponType alloc] init];
        staff.typeID = W_STAFF;
        staff.aegisName = @"Staff";
        staff.name = @"Staff";
    });
    return staff;
}

+ (RAWeaponType *)bow {
    static RAWeaponType *bow = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bow = [[RAWeaponType alloc] init];
        bow.typeID = W_BOW;
        bow.aegisName = @"Bow";
        bow.name = @"Bow";
    });
    return bow;
}

+ (RAWeaponType *)knuckle {
    static RAWeaponType *knuckle = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        knuckle = [[RAWeaponType alloc] init];
        knuckle.typeID = W_KNUCKLE;
        knuckle.aegisName = @"Knuckle";
        knuckle.name = @"Knuckle";
    });
    return knuckle;
}

+ (RAWeaponType *)musical {
    static RAWeaponType *musical = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        musical = [[RAWeaponType alloc] init];
        musical.typeID = W_MUSICAL;
        musical.aegisName = @"Musical";
        musical.name = @"Musical";
    });
    return musical;
}

+ (RAWeaponType *)whip {
    static RAWeaponType *whip = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        whip = [[RAWeaponType alloc] init];
        whip.typeID = W_WHIP;
        whip.aegisName = @"Whip";
        whip.name = @"Whip";
    });
    return whip;
}

+ (RAWeaponType *)book {
    static RAWeaponType *book = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        book = [[RAWeaponType alloc] init];
        book.typeID = W_BOOK;
        book.aegisName = @"Book";
        book.name = @"Book";
    });
    return book;
}

+ (RAWeaponType *)katar {
    static RAWeaponType *katar = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        katar = [[RAWeaponType alloc] init];
        katar.typeID = W_KATAR;
        katar.aegisName = @"Katar";
        katar.name = @"Katar";
    });
    return katar;
}

+ (RAWeaponType *)revolver {
    static RAWeaponType *revolver = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        revolver = [[RAWeaponType alloc] init];
        revolver.typeID = W_REVOLVER;
        revolver.aegisName = @"Revolver";
        revolver.name = @"Revolver";
    });
    return revolver;
}

+ (RAWeaponType *)rifle {
    static RAWeaponType *rifle = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        rifle = [[RAWeaponType alloc] init];
        rifle.typeID = W_RIFLE;
        rifle.aegisName = @"Rifle";
        rifle.name = @"Rifle";
    });
    return rifle;
}

+ (RAWeaponType *)gatling {
    static RAWeaponType *gatling = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        gatling = [[RAWeaponType alloc] init];
        gatling.typeID = W_GATLING;
        gatling.aegisName = @"Gatling";
        gatling.name = @"Gatling";
    });
    return gatling;
}

+ (RAWeaponType *)shotgun {
    static RAWeaponType *shotgun = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shotgun = [[RAWeaponType alloc] init];
        shotgun.typeID = W_SHOTGUN;
        shotgun.aegisName = @"Shotgun";
        shotgun.name = @"Shotgun";
    });
    return shotgun;
}

+ (RAWeaponType *)grenade {
    static RAWeaponType *grenade = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        grenade = [[RAWeaponType alloc] init];
        grenade.typeID = W_GRENADE;
        grenade.aegisName = @"Grenade";
        grenade.name = @"Grenade";
    });
    return grenade;
}

+ (RAWeaponType *)huuma {
    static RAWeaponType *huuma = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        huuma = [[RAWeaponType alloc] init];
        huuma.typeID = W_HUUMA;
        huuma.aegisName = @"Huuma";
        huuma.name = @"Huuma";
    });
    return huuma;
}

+ (RAWeaponType *)twoHandedStaff {
    static RAWeaponType *twoHandedStaff = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        twoHandedStaff = [[RAWeaponType alloc] init];
        twoHandedStaff.typeID = W_2HSTAFF;
        twoHandedStaff.aegisName = @"2hStaff";
        twoHandedStaff.name = @"Two-Handed Staff";
    });
    return twoHandedStaff;
}

+ (instancetype)weaponTypeWithAegisName:(NSString *)aegisName {
    static NSArray<RAWeaponType *> *allWeaponTypes = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allWeaponTypes = @[
            RAWeaponType.fist,
            RAWeaponType.dagger,
            RAWeaponType.oneHandedSword,
            RAWeaponType.twoHandedSword,
            RAWeaponType.oneHandedSpear,
            RAWeaponType.twoHandedSpear,
            RAWeaponType.oneHandedAxe,
            RAWeaponType.twoHandedAxe,
            RAWeaponType.mace,
            RAWeaponType.twoHandedMace,
            RAWeaponType.staff,
            RAWeaponType.bow,
            RAWeaponType.knuckle,
            RAWeaponType.musical,
            RAWeaponType.whip,
            RAWeaponType.book,
            RAWeaponType.katar,
            RAWeaponType.revolver,
            RAWeaponType.rifle,
            RAWeaponType.gatling,
            RAWeaponType.shotgun,
            RAWeaponType.grenade,
            RAWeaponType.huuma,
            RAWeaponType.twoHandedStaff,
        ];
    });

    for (RAWeaponType *weaponType in allWeaponTypes) {
        if ([weaponType.aegisName caseInsensitiveCompare:aegisName] == NSOrderedSame) {
            return weaponType;
        }
    }
    return nil;
}

@end
