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
        fist.value = W_FIST;
        fist.name = @"Fist";
        fist.englishName = @"Fist";
    });
    return fist;
}

+ (RAWeaponType *)dagger {
    static RAWeaponType *dagger = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dagger = [[RAWeaponType alloc] init];
        dagger.value = W_DAGGER;
        dagger.name = @"Dagger";
        dagger.englishName = @"Dagger";
    });
    return dagger;
}

+ (RAWeaponType *)oneHandedSword {
    static RAWeaponType *oneHandedSword = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        oneHandedSword = [[RAWeaponType alloc] init];
        oneHandedSword.value = W_1HSWORD;
        oneHandedSword.name = @"1hSword";
        oneHandedSword.englishName = @"One-Handed Sword";
    });
    return oneHandedSword;
}

+ (RAWeaponType *)twoHandedSword {
    static RAWeaponType *twoHandedSword = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        twoHandedSword = [[RAWeaponType alloc] init];
        twoHandedSword.value = W_2HSWORD;
        twoHandedSword.name = @"2hSword";
        twoHandedSword.englishName = @"Two-Handed Sword";
    });
    return twoHandedSword;
}

+ (RAWeaponType *)oneHandedSpear {
    static RAWeaponType *oneHandedSpear = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        oneHandedSpear = [[RAWeaponType alloc] init];
        oneHandedSpear.value = W_1HSPEAR;
        oneHandedSpear.name = @"1hSpear";
        oneHandedSpear.englishName = @"One-Handed Spear";
    });
    return oneHandedSpear;
}

+ (RAWeaponType *)twoHandedSpear {
    static RAWeaponType *twoHandedSpear = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        twoHandedSpear = [[RAWeaponType alloc] init];
        twoHandedSpear.value = W_2HSPEAR;
        twoHandedSpear.name = @"2hSpear";
        twoHandedSpear.englishName = @"Two-Handed Spear";
    });
    return twoHandedSpear;
}

+ (RAWeaponType *)oneHandedAxe {
    static RAWeaponType *oneHandedAxe = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        oneHandedAxe = [[RAWeaponType alloc] init];
        oneHandedAxe.value = W_1HAXE;
        oneHandedAxe.name = @"1hAxe";
        oneHandedAxe.englishName = @"One-Handed Axe";
    });
    return oneHandedAxe;
}

+ (RAWeaponType *)twoHandedAxe {
    static RAWeaponType *twoHandedAxe = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        twoHandedAxe = [[RAWeaponType alloc] init];
        twoHandedAxe.value = W_2HAXE;
        twoHandedAxe.name = @"2hAxe";
        twoHandedAxe.englishName = @"Two-Handed Axe";
    });
    return twoHandedAxe;
}

+ (RAWeaponType *)mace {
    static RAWeaponType *mace = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mace = [[RAWeaponType alloc] init];
        mace.value = W_MACE;
        mace.name = @"Mace";
        mace.englishName = @"Mace";
    });
    return mace;
}

+ (RAWeaponType *)twoHandedMace {
    static RAWeaponType *twoHandedMace = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        twoHandedMace = [[RAWeaponType alloc] init];
        twoHandedMace.value = W_2HMACE;
        twoHandedMace.name = @"2hMace";
        twoHandedMace.englishName = @"Two-Handed Mace";
    });
    return twoHandedMace;
}

+ (RAWeaponType *)staff {
    static RAWeaponType *staff = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        staff = [[RAWeaponType alloc] init];
        staff.value = W_STAFF;
        staff.name = @"Staff";
        staff.englishName = @"Staff";
    });
    return staff;
}

+ (RAWeaponType *)bow {
    static RAWeaponType *bow = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bow = [[RAWeaponType alloc] init];
        bow.value = W_BOW;
        bow.name = @"Bow";
        bow.englishName = @"Bow";
    });
    return bow;
}

+ (RAWeaponType *)knuckle {
    static RAWeaponType *knuckle = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        knuckle = [[RAWeaponType alloc] init];
        knuckle.value = W_KNUCKLE;
        knuckle.name = @"Knuckle";
        knuckle.englishName = @"Knuckle";
    });
    return knuckle;
}

+ (RAWeaponType *)musical {
    static RAWeaponType *musical = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        musical = [[RAWeaponType alloc] init];
        musical.value = W_MUSICAL;
        musical.name = @"Musical";
        musical.englishName = @"Musical";
    });
    return musical;
}

+ (RAWeaponType *)whip {
    static RAWeaponType *whip = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        whip = [[RAWeaponType alloc] init];
        whip.value = W_WHIP;
        whip.name = @"Whip";
        whip.englishName = @"Whip";
    });
    return whip;
}

+ (RAWeaponType *)book {
    static RAWeaponType *book = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        book = [[RAWeaponType alloc] init];
        book.value = W_BOOK;
        book.name = @"Book";
        book.englishName = @"Book";
    });
    return book;
}

+ (RAWeaponType *)katar {
    static RAWeaponType *katar = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        katar = [[RAWeaponType alloc] init];
        katar.value = W_KATAR;
        katar.name = @"Katar";
        katar.englishName = @"Katar";
    });
    return katar;
}

+ (RAWeaponType *)revolver {
    static RAWeaponType *revolver = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        revolver = [[RAWeaponType alloc] init];
        revolver.value = W_REVOLVER;
        revolver.name = @"Revolver";
        revolver.englishName = @"Revolver";
    });
    return revolver;
}

+ (RAWeaponType *)rifle {
    static RAWeaponType *rifle = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        rifle = [[RAWeaponType alloc] init];
        rifle.value = W_RIFLE;
        rifle.name = @"Rifle";
        rifle.englishName = @"Rifle";
    });
    return rifle;
}

+ (RAWeaponType *)gatling {
    static RAWeaponType *gatling = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        gatling = [[RAWeaponType alloc] init];
        gatling.value = W_GATLING;
        gatling.name = @"Gatling";
        gatling.englishName = @"Gatling";
    });
    return gatling;
}

+ (RAWeaponType *)shotgun {
    static RAWeaponType *shotgun = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shotgun = [[RAWeaponType alloc] init];
        shotgun.value = W_SHOTGUN;
        shotgun.name = @"Shotgun";
        shotgun.englishName = @"Shotgun";
    });
    return shotgun;
}

+ (RAWeaponType *)grenade {
    static RAWeaponType *grenade = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        grenade = [[RAWeaponType alloc] init];
        grenade.value = W_GRENADE;
        grenade.name = @"Grenade";
        grenade.englishName = @"Grenade";
    });
    return grenade;
}

+ (RAWeaponType *)huuma {
    static RAWeaponType *huuma = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        huuma = [[RAWeaponType alloc] init];
        huuma.value = W_HUUMA;
        huuma.name = @"Huuma";
        huuma.englishName = @"Huuma";
    });
    return huuma;
}

+ (RAWeaponType *)twoHandedStaff {
    static RAWeaponType *twoHandedStaff = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        twoHandedStaff = [[RAWeaponType alloc] init];
        twoHandedStaff.value = W_2HSTAFF;
        twoHandedStaff.name = @"2hStaff";
        twoHandedStaff.englishName = @"Two-Handed Staff";
    });
    return twoHandedStaff;
}

+ (instancetype)caseOfName:(NSString *)name {
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
        if ([weaponType.name caseInsensitiveCompare:name] == NSOrderedSame) {
            return weaponType;
        }
    }
    return nil;
}

@end
