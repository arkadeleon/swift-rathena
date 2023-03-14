//
//  RAItemType.m
//  rAthena
//
//  Created by Leon Li on 2023/3/13.
//

#import "RAItemType.h"

#include "common/mmo.hpp"

@implementation RAItemType

+ (RAItemType *)healing {
    static RAItemType *healing = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        healing = [[RAItemType alloc] init];
        healing.typeID = IT_HEALING;
        healing.aegisName = @"Healing";
        healing.name = @"Healing";
    });
    return healing;
}

+ (RAItemType *)unknown {
    static RAItemType *unknown = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        unknown = [[RAItemType alloc] init];
        unknown.typeID = IT_UNKNOWN;
        unknown.aegisName = @"Unknown";
        unknown.name = @"Unknown";
    });
    return unknown;
}

+ (RAItemType *)usable {
    static RAItemType *usable = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        usable = [[RAItemType alloc] init];
        usable.typeID = IT_USABLE;
        usable.aegisName = @"Usable";
        usable.name = @"Usable";
    });
    return usable;
}

+ (RAItemType *)etc {
    static RAItemType *etc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        etc = [[RAItemType alloc] init];
        etc.typeID = IT_ETC;
        etc.aegisName = @"Etc";
        etc.name = @"Etc";
    });
    return etc;
}

+ (RAItemType *)armor {
    static RAItemType *armor = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        armor = [[RAItemType alloc] init];
        armor.typeID = IT_ARMOR;
        armor.aegisName = @"Armor";
        armor.name = @"Armor";
    });
    return armor;
}

+ (RAItemType *)weapon {
    static RAItemType *weapon = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        weapon = [[RAItemType alloc] init];
        weapon.typeID = IT_WEAPON;
        weapon.aegisName = @"Weapon";
        weapon.name = @"Weapon";
    });
    return weapon;
}

+ (RAItemType *)card {
    static RAItemType *card = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        card = [[RAItemType alloc] init];
        card.typeID = IT_CARD;
        card.aegisName = @"Card";
        card.name = @"Card";
    });
    return card;
}

+ (RAItemType *)petEgg {
    static RAItemType *petEgg = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        petEgg = [[RAItemType alloc] init];
        petEgg.typeID = IT_PETEGG;
        petEgg.aegisName = @"PetEgg";
        petEgg.name = @"Pet Egg";
    });
    return petEgg;
}

+ (RAItemType *)petArmor {
    static RAItemType *petArmor = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        petArmor = [[RAItemType alloc] init];
        petArmor.typeID = IT_PETARMOR;
        petArmor.aegisName = @"PetArmor";
        petArmor.name = @"Pet Armor";
    });
    return petArmor;
}

+ (RAItemType *)unknown2 {
    static RAItemType *unknown2 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        unknown2 = [[RAItemType alloc] init];
        unknown2.typeID = IT_UNKNOWN2;
        unknown2.aegisName = @"Unknown2";
        unknown2.name = @"Unknown2";
    });
    return unknown2;
}

+ (RAItemType *)ammo {
    static RAItemType *ammo = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ammo = [[RAItemType alloc] init];
        ammo.typeID = IT_AMMO;
        ammo.aegisName = @"Ammo";
        ammo.name = @"Ammo";
    });
    return ammo;
}

+ (RAItemType *)delayConsume {
    static RAItemType *delayConsume = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        delayConsume = [[RAItemType alloc] init];
        delayConsume.typeID = IT_DELAYCONSUME;
        delayConsume.aegisName = @"DelayConsume";
        delayConsume.name = @"Delay Consume";
    });
    return delayConsume;
}

+ (RAItemType *)shadowGear {
    static RAItemType *shadowGear = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shadowGear = [[RAItemType alloc] init];
        shadowGear.typeID = IT_SHADOWGEAR;
        shadowGear.aegisName = @"ShadowGear";
        shadowGear.name = @"Shadow Gear";
    });
    return shadowGear;
}

+ (RAItemType *)cash {
    static RAItemType *cash = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cash = [[RAItemType alloc] init];
        cash.typeID = IT_CASH;
        cash.aegisName = @"Cash";
        cash.name = @"Cash";
    });
    return cash;
}

+ (instancetype)itemTypeWithAegisName:(NSString *)aegisName {
    static NSArray<RAItemType *> *allItemTypes = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allItemTypes = @[
            RAItemType.healing,
            RAItemType.unknown,
            RAItemType.usable,
            RAItemType.etc,
            RAItemType.armor,
            RAItemType.weapon,
            RAItemType.card,
            RAItemType.petEgg,
            RAItemType.petArmor,
            RAItemType.unknown2,
            RAItemType.ammo,
            RAItemType.delayConsume,
            RAItemType.shadowGear,
            RAItemType.cash,
        ];
    });

    for (RAItemType *itemType in allItemTypes) {
        if ([itemType.aegisName caseInsensitiveCompare:aegisName] == NSOrderedSame) {
            return itemType;
        }
    }
    return nil;
}

@end
