//
//  RAItemSubType.m
//  rAthena
//
//  Created by Leon Li on 2023/3/14.
//

#import "RAItemSubType.h"
#import "Enum/RAItemType.h"
#import "Enum/RAWeaponType.h"
#import "Enum/RAAmmoType.h"
#import "Enum/RACardType.h"

@interface RAItemSubType ()

@property (nonatomic, strong) RAWeaponType *weaponType;
@property (nonatomic, strong) RAAmmoType *ammoType;
@property (nonatomic, strong) RACardType *cardType;

@end

@implementation RAItemSubType

+ (instancetype)itemSubTypeOfType:(RAItemType *)type name:(nullable NSString *)name {
    if (type == RAItemType.weapon) {
        RAItemSubType *subType = [[RAItemSubType alloc] init];
        subType.weaponType = name ? [RAWeaponType caseOfName:name] : nil;
        return subType;
    } else if (type == RAItemType.ammo) {
        RAItemSubType *subType = [[RAItemSubType alloc] init];
        subType.ammoType = name ? [RAAmmoType caseOfName:name] : RAAmmoType.none;
        return subType;
    } else if (type == RAItemType.card) {
        RAItemSubType *subType = [[RAItemSubType alloc] init];
        subType.cardType = name ? [RACardType caseOfName:name] : RACardType.normal;
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
