//
//  RAItemSubType.m
//  rAthena
//
//  Created by Leon Li on 2023/3/14.
//

#import "RAItemSubType.h"
#import "Enum/RAItemType.h"

id<RAItemSubType> RAItemSubTypeFromName(NSString *name, RAItemType *type) {
    if (type == RAItemType.weapon) {
        return [RAWeaponType valueOfName:name];
    } else if (type == RAItemType.ammo) {
        return [RAAmmoType valueOfName:name];
    } else if (type == RAItemType.card) {
        return [RACardType valueOfName:name];
    } else {
        return nil;
    }
}

@implementation RAWeaponType (RAItemSubType)

@end

@implementation RAAmmoType (RAItemSubType)

@end

@implementation RACardType (RAItemSubType)

@end
