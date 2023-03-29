//
//  RAEquipmentLocation.m
//  rAthena
//
//  Created by Leon Li on 2023/3/17.
//

#import "RAEquipmentLocation.h"
#include "common/mmo.hpp"

@implementation RAEquipmentLocation

+ (RAEquipmentLocation *)headTop {
    static RAEquipmentLocation *headTop = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        headTop = [[RAEquipmentLocation alloc] init];
        headTop.value = EQP_HEAD_TOP;
        headTop.name = @"Head_Top";
        headTop.englishName = @"Head Top";
    });
    return headTop;
}

+ (RAEquipmentLocation *)headMid {
    static RAEquipmentLocation *headMid = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        headMid = [[RAEquipmentLocation alloc] init];
        headMid.value = EQP_HEAD_MID;
        headMid.name = @"Head_Mid";
        headMid.englishName = @"Head Middle";
    });
    return headMid;
}

+ (RAEquipmentLocation *)headLow {
    static RAEquipmentLocation *headLow = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        headLow = [[RAEquipmentLocation alloc] init];
        headLow.value = EQP_HEAD_LOW;
        headLow.name = @"Head_Low";
        headLow.englishName = @"Head Low";
    });
    return headLow;
}

+ (RAEquipmentLocation *)armor {
    static RAEquipmentLocation *armor = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        armor = [[RAEquipmentLocation alloc] init];
        armor.value = EQP_ARMOR;
        armor.name = @"Armor";
        armor.englishName = @"Armor";
    });
    return armor;
}

+ (RAEquipmentLocation *)rightHand {
    static RAEquipmentLocation *rightHand = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        rightHand = [[RAEquipmentLocation alloc] init];
        rightHand.value = EQP_HAND_R;
        rightHand.name = @"Right_Hand";
        rightHand.englishName = @"Right Hand";
    });
    return rightHand;
}

+ (RAEquipmentLocation *)leftHand {
    static RAEquipmentLocation *leftHand = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        leftHand = [[RAEquipmentLocation alloc] init];
        leftHand.value = EQP_HAND_L;
        leftHand.name = @"Left_Hand";
        leftHand.englishName = @"Left Hand";
    });
    return leftHand;
}

+ (RAEquipmentLocation *)garment {
    static RAEquipmentLocation *garment = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        garment = [[RAEquipmentLocation alloc] init];
        garment.value = EQP_GARMENT;
        garment.name = @"Garment";
        garment.englishName = @"Garment";
    });
    return garment;
}

+ (RAEquipmentLocation *)shoes {
    static RAEquipmentLocation *shoes = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shoes = [[RAEquipmentLocation alloc] init];
        shoes.value = EQP_SHOES;
        shoes.name = @"Shoes";
        shoes.englishName = @"Shoes";
    });
    return shoes;
}

+ (RAEquipmentLocation *)rightAccessory {
    static RAEquipmentLocation *rightAccessory = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        rightAccessory = [[RAEquipmentLocation alloc] init];
        rightAccessory.value = EQP_ACC_R;
        rightAccessory.name = @"Right_Accessory";
        rightAccessory.englishName = @"Right Accessory";
    });
    return rightAccessory;
}

+ (RAEquipmentLocation *)leftAccessory {
    static RAEquipmentLocation *leftAccessory = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        leftAccessory = [[RAEquipmentLocation alloc] init];
        leftAccessory.value = EQP_ACC_L;
        leftAccessory.name = @"Left_Accessory";
        leftAccessory.englishName = @"Left Accessory";
    });
    return leftAccessory;
}

+ (RAEquipmentLocation *)costumeHeadTop {
    static RAEquipmentLocation *costumeHeadTop = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        costumeHeadTop = [[RAEquipmentLocation alloc] init];
        costumeHeadTop.value = EQP_COSTUME_HEAD_TOP;
        costumeHeadTop.name = @"Costume_Head_Top";
        costumeHeadTop.englishName = @"Costume Head Top";
    });
    return costumeHeadTop;
}

+ (RAEquipmentLocation *)costumeHeadMid {
    static RAEquipmentLocation *costumeHeadMid = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        costumeHeadMid = [[RAEquipmentLocation alloc] init];
        costumeHeadMid.value = EQP_COSTUME_HEAD_MID;
        costumeHeadMid.name = @"Costume_Head_Mid";
        costumeHeadMid.englishName = @"Costume Head Middle";
    });
    return costumeHeadMid;
}

+ (RAEquipmentLocation *)costumeHeadLow {
    static RAEquipmentLocation *costumeHeadLow = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        costumeHeadLow = [[RAEquipmentLocation alloc] init];
        costumeHeadLow.value = EQP_COSTUME_HEAD_LOW;
        costumeHeadLow.name = @"Costume_Head_Low";
        costumeHeadLow.englishName = @"Costume Head Low";
    });
    return costumeHeadLow;
}

+ (RAEquipmentLocation *)costumeGarment {
    static RAEquipmentLocation *costumeGarment = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        costumeGarment = [[RAEquipmentLocation alloc] init];
        costumeGarment.value = EQP_COSTUME_GARMENT;
        costumeGarment.name = @"Costume_Garment";
        costumeGarment.englishName = @"Costume Garment";
    });
    return costumeGarment;
}

+ (RAEquipmentLocation *)ammo {
    static RAEquipmentLocation *ammo = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ammo = [[RAEquipmentLocation alloc] init];
        ammo.value = EQP_AMMO;
        ammo.name = @"Ammo";
        ammo.englishName = @"Ammo";
    });
    return ammo;
}

+ (RAEquipmentLocation *)shadowArmor {
    static RAEquipmentLocation *shadowArmor = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shadowArmor = [[RAEquipmentLocation alloc] init];
        shadowArmor.value = EQP_SHADOW_ARMOR;
        shadowArmor.name = @"Shadow_Armor";
        shadowArmor.englishName = @"Shadow Armor";
    });
    return shadowArmor;
}

+ (RAEquipmentLocation *)shadowWeapon {
    static RAEquipmentLocation *shadowWeapon = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shadowWeapon = [[RAEquipmentLocation alloc] init];
        shadowWeapon.value = EQP_SHADOW_WEAPON;
        shadowWeapon.name = @"Shadow_Weapon";
        shadowWeapon.englishName = @"Shadow Weapon";
    });
    return shadowWeapon;
}

+ (RAEquipmentLocation *)shadowShield {
    static RAEquipmentLocation *shadowShield = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shadowShield = [[RAEquipmentLocation alloc] init];
        shadowShield.value = EQP_SHADOW_SHIELD;
        shadowShield.name = @"Shadow_Shield";
        shadowShield.englishName = @"Shadow Shield";
    });
    return shadowShield;
}

+ (RAEquipmentLocation *)shadowShoes {
    static RAEquipmentLocation *shadowShoes = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shadowShoes = [[RAEquipmentLocation alloc] init];
        shadowShoes.value = EQP_SHADOW_SHOES;
        shadowShoes.name = @"Shadow_Shoes";
        shadowShoes.englishName = @"Shadow Shoes";
    });
    return shadowShoes;
}

+ (RAEquipmentLocation *)shadowRightAccessory {
    static RAEquipmentLocation *shadowRightAccessory = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shadowRightAccessory = [[RAEquipmentLocation alloc] init];
        shadowRightAccessory.value = EQP_SHADOW_ACC_R;
        shadowRightAccessory.name = @"Shadow_Right_Accessory";
        shadowRightAccessory.englishName = @"Shadow Right Accessory";
    });
    return shadowRightAccessory;
}

+ (RAEquipmentLocation *)shadowLeftAccessory {
    static RAEquipmentLocation *shadowLeftAccessory = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shadowLeftAccessory = [[RAEquipmentLocation alloc] init];
        shadowLeftAccessory.value = EQP_SHADOW_ACC_L;
        shadowLeftAccessory.name = @"Shadow_Left_Accessory";
        shadowLeftAccessory.englishName = @"Shadow Left Accessory";
    });
    return shadowLeftAccessory;
}

+ (NSArray<RAEquipmentLocation *> *)bothHand {
    static NSArray<RAEquipmentLocation *> *bothHand = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bothHand = @[
            RAEquipmentLocation.rightHand,
            RAEquipmentLocation.leftHand,
        ];
    });
    return bothHand;
}

+ (NSArray<RAEquipmentLocation *> *)bothAccessory {
    static NSArray<RAEquipmentLocation *> *bothAccessory = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bothAccessory = @[
            RAEquipmentLocation.rightAccessory,
            RAEquipmentLocation.leftAccessory,
        ];
    });
    return bothAccessory;
}

+ (NSArray<RAEquipmentLocation *> *)allCases {
    static NSArray<RAEquipmentLocation *> *allCases = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allCases = @[
            RAEquipmentLocation.headTop,
            RAEquipmentLocation.headMid,
            RAEquipmentLocation.headLow,
            RAEquipmentLocation.armor,
            RAEquipmentLocation.rightHand,
            RAEquipmentLocation.leftHand,
            RAEquipmentLocation.garment,
            RAEquipmentLocation.shoes,
            RAEquipmentLocation.rightAccessory,
            RAEquipmentLocation.leftAccessory,
            RAEquipmentLocation.costumeHeadTop,
            RAEquipmentLocation.costumeHeadMid,
            RAEquipmentLocation.costumeHeadLow,
            RAEquipmentLocation.costumeGarment,
            RAEquipmentLocation.ammo,
            RAEquipmentLocation.shadowArmor,
            RAEquipmentLocation.shadowWeapon,
            RAEquipmentLocation.shadowShield,
            RAEquipmentLocation.shadowShoes,
            RAEquipmentLocation.shadowRightAccessory,
            RAEquipmentLocation.shadowLeftAccessory,
        ];
    });
    return allCases;
}

+ (NSSet *)valuesOfNames:(NSDictionary<NSString *, NSNumber *> *)names {
    NSMutableSet<RAEquipmentLocation *> *values = [[NSMutableSet alloc] init];

    NSNumber *bothHand = names[@"Both_Hand"];
    if (bothHand && bothHand.boolValue) {
        [values addObjectsFromArray:RAEquipmentLocation.bothHand];
    }

    NSNumber *bothAccessory = names[@"Both_Accessory"];
    if (bothAccessory && bothAccessory.boolValue) {
        [values addObjectsFromArray:RAEquipmentLocation.bothAccessory];
    }

    [values unionSet:[super valuesOfNames:names]];

    return [values copy];
}

@end
