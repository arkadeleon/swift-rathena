//
//  NSString+RAConstants.m
//  rAthena
//
//  Created by Leon Li on 2023/7/2.
//

#import "NSString+RAConstants.h"
#import "RAConstants.h"

NSString *RAConstantNotFound = @"None";

NSString *NSStringFromRAArmorType(NSInteger armorType) {
    static NSDictionary<NSNumber *, NSString *> *armorTypes = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        armorTypes = @{
            @(RA_AMMO_ARROW): @"Arrow",
            @(RA_AMMO_DAGGER): @"Dagger",
            @(RA_AMMO_BULLET): @"Bullet",
            @(RA_AMMO_SHELL): @"Shell",
            @(RA_AMMO_GRENADE): @"Grenade",
            @(RA_AMMO_SHURIKEN): @"Shuriken",
            @(RA_AMMO_KUNAI): @"Kunai",
            @(RA_AMMO_CANNONBALL): @"Cannon Ball",
            @(RA_AMMO_THROWWEAPON): @"Throw Weapon",
        };
    });
    return armorTypes[@(armorType)] ?: RAConstantNotFound;
}

NSString *NSStringFromRACardType(NSInteger cardType) {
    static NSDictionary<NSNumber *, NSString *> *cardTypes = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cardTypes = @{
            @(RA_CARD_NORMAL): @"Normal",
            @(RA_CARD_ENCHANT): @"Enchant",
        };
    });
    return cardTypes[@(cardType)] ?: RAConstantNotFound;
}

NSString *NSStringFromRAItemType(NSInteger itemType) {
    static NSDictionary<NSNumber *, NSString *> *itemTypes = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        itemTypes = @{
            @(RA_IT_HEALING): @"Healing",
            @(RA_IT_USABLE): @"Usable",
            @(RA_IT_ETC): @"Etc",
            @(RA_IT_ARMOR): @"Armor",
            @(RA_IT_WEAPON): @"Weapon",
            @(RA_IT_CARD): @"Card",
            @(RA_IT_PETEGG): @"Pet Egg",
            @(RA_IT_PETARMOR): @"Pet Armor",
            @(RA_IT_AMMO): @"Ammo",
            @(RA_IT_DELAYCONSUME): @"Delay Consume",
            @(RA_IT_SHADOWGEAR): @"Shadow Gear",
            @(RA_IT_CASH): @"Cash",
        };
    });
    return itemTypes[@(itemType)] ?: RAConstantNotFound;
}

NSString *NSStringFromRAWeaponType(NSInteger weaponType) {
    static NSDictionary<NSNumber *, NSString *> *weaponTypes = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        weaponTypes = @{
            @(RA_W_FIST): @"Fist",
            @(RA_W_DAGGER): @"Dagger",
            @(RA_W_1HSWORD): @"One-Handed Sword",
            @(RA_W_2HSWORD): @"Two-Handed Sword",
            @(RA_W_1HSPEAR): @"One-Handed Spear",
            @(RA_W_2HSPEAR): @"Two-Handed Spear",
            @(RA_W_1HAXE): @"One-Handed Axe",
            @(RA_W_2HAXE): @"Two-Handed Axe",
            @(RA_W_MACE): @"Mace",
            @(RA_W_2HMACE): @"Two-Handed Mace",
            @(RA_W_STAFF): @"Staff",
            @(RA_W_BOW): @"Bow",
            @(RA_W_KNUCKLE): @"Knuckle",
            @(RA_W_MUSICAL): @"Musical",
            @(RA_W_WHIP): @"Whip",
            @(RA_W_BOOK): @"Book",
            @(RA_W_KATAR): @"Katar",
            @(RA_W_REVOLVER): @"Revolver",
            @(RA_W_RIFLE): @"Rifle",
            @(RA_W_GATLING): @"Gatling",
            @(RA_W_SHOTGUN): @"Shotgun",
            @(RA_W_GRENADE): @"Grenade",
            @(RA_W_HUUMA): @"Huuma",
            @(RA_W_2HSTAFF): @"Two-Handed Staff",
        };
    });
    return weaponTypes[@(weaponType)] ?: RAConstantNotFound;
}
