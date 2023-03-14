//
//  RAItemSubType.m
//  rAthena
//
//  Created by Leon Li on 2023/3/14.
//

#import "RAItemSubType.h"
#import "RAItemType.h"
#import "RAWeaponType.h"
#import "RAAmmoType.h"
#import "RACardType.h"

@interface RAItemSubType ()

@property (nonatomic, strong) RAWeaponType *weaponType;
@property (nonatomic, strong) RAAmmoType *ammoType;
@property (nonatomic, strong) RACardType *cardType;

@end

@implementation RAItemSubType

+ (instancetype)itemSubTypeWithType:(RAItemType *)type aegisName:(nullable NSString *)aegisName {
    if (type == RAItemType.weapon) {
        RAItemSubType *subType = [[RAItemSubType alloc] init];
        subType.weaponType = aegisName ? [RAWeaponType weaponTypeWithAegisName:aegisName] : nil;
        return subType;
    } else if (type == RAItemType.ammo) {
        RAItemSubType *subType = [[RAItemSubType alloc] init];
        subType.ammoType = aegisName ? [RAAmmoType ammoTypeWithAegisName:aegisName] : RAAmmoType.none;
        return subType;
    } else if (type == RAItemType.card) {
        RAItemSubType *subType = [[RAItemSubType alloc] init];
        subType.cardType = aegisName ? [RACardType cardTypeWithAegisName:aegisName] : RACardType.normal;
        return subType;
    } else {
        return nil;
    }
}

- (RAWeaponType *)asWeaponType {
    return self.weaponType;
}

- (RAAmmoType *)asAmmoType {
    return self.ammoType;
}

- (RACardType *)asCardType {
    return self.cardType;
}

@end
