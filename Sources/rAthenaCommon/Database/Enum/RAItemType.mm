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
        healing.value = IT_HEALING;
        healing.name = @"Healing";
        healing.englishName = @"Healing";
    });
    return healing;
}

+ (RAItemType *)usable {
    static RAItemType *usable = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        usable = [[RAItemType alloc] init];
        usable.value = IT_USABLE;
        usable.name = @"Usable";
        usable.englishName = @"Usable";
    });
    return usable;
}

+ (RAItemType *)etc {
    static RAItemType *etc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        etc = [[RAItemType alloc] init];
        etc.value = IT_ETC;
        etc.name = @"Etc";
        etc.englishName = @"Etc";
    });
    return etc;
}

+ (RAItemType *)armor {
    static RAItemType *armor = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        armor = [[RAItemType alloc] init];
        armor.value = IT_ARMOR;
        armor.name = @"Armor";
        armor.englishName = @"Armor";
    });
    return armor;
}

+ (RAItemType *)weapon {
    static RAItemType *weapon = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        weapon = [[RAItemType alloc] init];
        weapon.value = IT_WEAPON;
        weapon.name = @"Weapon";
        weapon.englishName = @"Weapon";
    });
    return weapon;
}

+ (RAItemType *)card {
    static RAItemType *card = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        card = [[RAItemType alloc] init];
        card.value = IT_CARD;
        card.name = @"Card";
        card.englishName = @"Card";
    });
    return card;
}

+ (RAItemType *)petEgg {
    static RAItemType *petEgg = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        petEgg = [[RAItemType alloc] init];
        petEgg.value = IT_PETEGG;
        petEgg.name = @"PetEgg";
        petEgg.englishName = @"Pet Egg";
    });
    return petEgg;
}

+ (RAItemType *)petArmor {
    static RAItemType *petArmor = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        petArmor = [[RAItemType alloc] init];
        petArmor.value = IT_PETARMOR;
        petArmor.name = @"PetArmor";
        petArmor.englishName = @"Pet Armor";
    });
    return petArmor;
}

+ (RAItemType *)ammo {
    static RAItemType *ammo = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ammo = [[RAItemType alloc] init];
        ammo.value = IT_AMMO;
        ammo.name = @"Ammo";
        ammo.englishName = @"Ammo";
    });
    return ammo;
}

+ (RAItemType *)delayConsume {
    static RAItemType *delayConsume = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        delayConsume = [[RAItemType alloc] init];
        delayConsume.value = IT_DELAYCONSUME;
        delayConsume.name = @"DelayConsume";
        delayConsume.englishName = @"Delay Consume";
    });
    return delayConsume;
}

+ (RAItemType *)shadowGear {
    static RAItemType *shadowGear = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shadowGear = [[RAItemType alloc] init];
        shadowGear.value = IT_SHADOWGEAR;
        shadowGear.name = @"ShadowGear";
        shadowGear.englishName = @"Shadow Gear";
    });
    return shadowGear;
}

+ (RAItemType *)cash {
    static RAItemType *cash = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cash = [[RAItemType alloc] init];
        cash.value = IT_CASH;
        cash.name = @"Cash";
        cash.englishName = @"Cash";
    });
    return cash;
}

+ (NSArray<RAItemType *> *)allCases {
    static NSArray<RAItemType *> *allCases = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allCases = @[
            RAItemType.healing,
            RAItemType.usable,
            RAItemType.etc,
            RAItemType.armor,
            RAItemType.weapon,
            RAItemType.card,
            RAItemType.petEgg,
            RAItemType.petArmor,
            RAItemType.ammo,
            RAItemType.delayConsume,
            RAItemType.shadowGear,
            RAItemType.cash,
        ];
    });
    return allCases;
}

@end
