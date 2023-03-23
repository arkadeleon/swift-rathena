//
//  RAEquipmentLocation.h
//  rAthena
//
//  Created by Leon Li on 2023/3/17.
//

#import <Foundation/Foundation.h>
#import "RAEnum.h"

NS_ASSUME_NONNULL_BEGIN

@interface RAEquipmentLocation : RAEnum

@property (nonatomic, class, readonly) RAEquipmentLocation *headTop;
@property (nonatomic, class, readonly) RAEquipmentLocation *headMid;
@property (nonatomic, class, readonly) RAEquipmentLocation *headLow;
@property (nonatomic, class, readonly) RAEquipmentLocation *armor;
@property (nonatomic, class, readonly) RAEquipmentLocation *rightHand;
@property (nonatomic, class, readonly) RAEquipmentLocation *leftHand;
@property (nonatomic, class, readonly) RAEquipmentLocation *garment;
@property (nonatomic, class, readonly) RAEquipmentLocation *shoes;
@property (nonatomic, class, readonly) RAEquipmentLocation *rightAccessory;
@property (nonatomic, class, readonly) RAEquipmentLocation *leftAccessory;
@property (nonatomic, class, readonly) RAEquipmentLocation *costumeHeadTop;
@property (nonatomic, class, readonly) RAEquipmentLocation *costumeHeadMid;
@property (nonatomic, class, readonly) RAEquipmentLocation *costumeHeadLow;
@property (nonatomic, class, readonly) RAEquipmentLocation *costumeGarment;
@property (nonatomic, class, readonly) RAEquipmentLocation *ammo;
@property (nonatomic, class, readonly) RAEquipmentLocation *shadowArmor;
@property (nonatomic, class, readonly) RAEquipmentLocation *shadowWeapon;
@property (nonatomic, class, readonly) RAEquipmentLocation *shadowShield;
@property (nonatomic, class, readonly) RAEquipmentLocation *shadowShoes;
@property (nonatomic, class, readonly) RAEquipmentLocation *shadowRightAccessory;
@property (nonatomic, class, readonly) RAEquipmentLocation *shadowLeftAccessory;

@property (nonatomic, class, readonly) NSArray<RAEquipmentLocation *> *bothHand;
@property (nonatomic, class, readonly) NSArray<RAEquipmentLocation *> *bothAccessory;

@property (nonatomic, class, readonly) NSArray<RAEquipmentLocation *> *allCases;

@end

NS_ASSUME_NONNULL_END
