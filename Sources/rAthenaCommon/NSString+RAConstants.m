//
//  NSString+RAConstants.m
//  rAthena
//
//  Created by Leon Li on 2023/7/2.
//

#import "NSString+RAConstants.h"
#import "RAConstants.h"

NSString *RAConstantNotFound = @"None";

NSString *NSStringFromRAAmmoType(NSInteger ammoType) {
    static NSDictionary<NSNumber *, NSString *> *ammoTypes = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ammoTypes = @{
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
    return ammoTypes[@(ammoType)] ?: RAConstantNotFound;
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

NSString *NSStringFromRAElement(NSInteger element) {
    static NSDictionary<NSNumber *, NSString *> *elements = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        elements = @{
            @(RA_ELE_NEUTRAL): @"Neutral",
            @(RA_ELE_WATER): @"Water",
            @(RA_ELE_EARTH): @"Earth",
            @(RA_ELE_FIRE): @"Fire",
            @(RA_ELE_WIND): @"Wind",
            @(RA_ELE_POISON): @"Poison",
            @(RA_ELE_HOLY): @"Holy",
            @(RA_ELE_DARK): @"Dark",
            @(RA_ELE_GHOST): @"Ghost",
            @(RA_ELE_UNDEAD): @"Undead",
        };
    });
    return elements[@(element)] ?: RAConstantNotFound;
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

NSString *NSStringFromRAMode(NSInteger mode) {
    static NSDictionary<NSNumber *, NSString *> *modes = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        modes = @{
            @(RA_MD_NONE): @"None",
            @(RA_MD_CANMOVE): @"Can Move",
            @(RA_MD_LOOTER): @"Looter",
            @(RA_MD_AGGRESSIVE): @"Aggressive",
            @(RA_MD_ASSIST): @"Assist",
            @(RA_MD_CASTSENSORIDLE): @"Cast Sensor Idle",
            @(RA_MD_NORANDOMWALK): @"No Random Walk",
            @(RA_MD_NOCAST): @"No Cast",
            @(RA_MD_CANATTACK): @"Can Attack",
            @(RA_MD_CASTSENSORCHASE): @"Cast Sensor Chase",
            @(RA_MD_CHANGECHASE): @"Change Chase",
            @(RA_MD_ANGRY): @"Angry",
            @(RA_MD_CHANGETARGETMELEE): @"Change Target Melee",
            @(RA_MD_CHANGETARGETCHASE): @"Change Target Chase",
            @(RA_MD_TARGETWEAK): @"Target Weak",
            @(RA_MD_RANDOMTARGET): @"Random Target",
            @(RA_MD_IGNOREMELEE): @"Ignore Melee",
            @(RA_MD_IGNOREMAGIC): @"Ignore Magic",
            @(RA_MD_IGNORERANGED): @"Ignore Ranged",
            @(RA_MD_MVP): @"Mvp",
            @(RA_MD_IGNOREMISC): @"Ignore Misc",
            @(RA_MD_KNOCKBACKIMMUNE): @"Knock Back Immune",
            @(RA_MD_TELEPORTBLOCK): @"Teleport Block",
            @(RA_MD_FIXEDITEMDROP): @"Fixed Item Drop",
            @(RA_MD_DETECTOR): @"Detector",
            @(RA_MD_STATUSIMMUNE): @"Status Immune",
            @(RA_MD_SKILLIMMUNE): @"Skill Immune",
        };
    });
    return modes[@(mode)] ?: RAConstantNotFound;
}

NSString *NSStringFromRAMonsterClass(NSInteger monsterClass) {
    static NSDictionary<NSNumber *, NSString *> *monsterClasses = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        monsterClasses = @{
            @(RA_CLASS_NONE): @"None",
            @(RA_CLASS_NORMAL): @"Normal",
            @(RA_CLASS_BOSS): @"Boss",
            @(RA_CLASS_GUARDIAN): @"Guardian",
            @(RA_CLASS_BATTLEFIELD): @"Battlefield",
            @(RA_CLASS_EVENT): @"Event",
        };
    });
    return monsterClasses[@(monsterClass)] ?: RAConstantNotFound;
}

NSString *NSStringFromRAParameter(NSInteger parameter) {
    static NSDictionary<NSNumber *, NSString *> *parameters = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        parameters = @{
            @(RA_PARAM_STR): @"Str",
            @(RA_PARAM_AGI): @"Agi",
            @(RA_PARAM_VIT): @"Vit",
            @(RA_PARAM_INT): @"Int",
            @(RA_PARAM_DEX): @"Dex",
            @(RA_PARAM_LUK): @"Luk",
            @(RA_PARAM_POW): @"Pow",
            @(RA_PARAM_STA): @"Sta",
            @(RA_PARAM_WIS): @"Wis",
            @(RA_PARAM_SPL): @"Spl",
            @(RA_PARAM_CON): @"Con",
            @(RA_PARAM_CRT): @"Crt",
        };
    });
    return parameters[@(parameter)] ?: RAConstantNotFound;
}

NSString *NSStringFromRARace(NSInteger race) {
    static NSDictionary<NSNumber *, NSString *> *races = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        races = @{
            @(RA_RC_FORMLESS): @"Formless",
            @(RA_RC_UNDEAD): @"Undead",
            @(RA_RC_BRUTE): @"Brute",
            @(RA_RC_PLANT): @"Plant",
            @(RA_RC_INSECT): @"Insect",
            @(RA_RC_FISH): @"Fish",
            @(RA_RC_DEMON): @"Demon",
            @(RA_RC_DEMIHUMAN): @"Demi-Human",
            @(RA_RC_ANGEL): @"Angel",
            @(RA_RC_DRAGON): @"Dragon",
        };
    });
    return races[@(race)] ?: RAConstantNotFound;
}

NSString *NSStringFromRASex(NSInteger sex) {
    static NSDictionary<NSNumber *, NSString *> *sexes = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sexes = @{
            @(RA_SEX_FEMALE): @"Female",
            @(RA_SEX_MALE): @"Male",
            @(RA_SEX_BOTH): @"Both",
        };
    });
    return sexes[@(sex)] ?: RAConstantNotFound;
}

NSString *NSStringFromRASize(NSInteger size) {
    static NSDictionary<NSNumber *, NSString *> *sizes = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sizes = @{
            @(RA_SZ_SMALL): @"Small",
            @(RA_SZ_MEDIUM): @"Medium",
            @(RA_SZ_BIG): @"Large",
        };
    });
    return sizes[@(size)] ?: RAConstantNotFound;
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
