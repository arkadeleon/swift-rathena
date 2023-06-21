//
//  RAItem.m
//  rAthena
//
//  Created by Leon Li on 2023/3/13.
//

#import "RAItem.h"
#import "Enum/RAItemJob.h"
#import "Enum/RAItemClass.h"
#import "Enum/RAGender.h"
#import "Enum/RAEquipmentLocation.h"
#import "../RAConstants.h"

@implementation RAItem

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"itemID"           : @"Id",
        @"aegisName"        : @"AegisName",
        @"name"             : @"Name",
        @"buy"              : @"Buy",
        @"sell"             : @"Sell",
        @"weight"           : @"Weight",
        @"attack"           : @"Attack",
        @"magicAttack"      : @"MagicAttack",
        @"defense"          : @"Defense",
        @"range"            : @"Range",
        @"slots"            : @"Slots",
        @"weaponLevel"      : @"WeaponLevel",
        @"armorLevel"       : @"ArmorLevel",
        @"equipLevelMin"    : @"EquipLevelMin",
        @"equipLevelMax"    : @"EquipLevelMax",
        @"refineable"       : @"Refineable",
        @"gradable"         : @"Gradable",
        @"view"             : @"View",
        @"aliasName"        : @"AliasName",
        @"flags"            : @"Flags",
        @"delay"            : @"Delay",
        @"stack"            : @"Stack",
        @"noUse"            : @"NoUse",
        @"trade"            : @"Trade",
        @"script"           : @"Script",
        @"equipScript"      : @"EquipScript",
        @"unEquipScript"    : @"UnEquipScript",
    };
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _buy = 0;
        _sell = 0;
        _weight = 0;
        _attack = 0;
        _magicAttack = 0;
        _defense = 0;
        _range = 0;
        _slots = 0;
        _weaponLevel = 1;
        _armorLevel = 1;
        _equipLevelMin = 0;
        _equipLevelMax = 0;
        _refineable = NO;
        _gradable = NO;
        _view = 0;
    }
    return self;
}

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    // Type
    NSString *type = dic[@"Type"] ?: @"";
    NSInteger typeConstant = RAConstantGetValue([[@"IT_" stringByAppendingString:type] uppercaseString]);
    self.type = typeConstant != NSNotFound ? typeConstant : RA_IT_ETC;

    // SubType
    NSString *subType = dic[@"SubType"] ?: @"";
    if (self.type == RA_IT_WEAPON) {
        NSInteger subTypeConstant = RAConstantGetValue([[@"W_" stringByAppendingString:subType] uppercaseString]);
        self.subType = subTypeConstant != NSNotFound ? subTypeConstant : RA_W_FIST;
    } else if (self.type == RA_IT_AMMO) {
        NSInteger subTypeConstant = RAConstantGetValue([[@"AMMO_" stringByAppendingString:subType] uppercaseString]);
        self.subType = subTypeConstant != NSNotFound ? subTypeConstant : 0;
    } else if (self.type == RA_IT_CARD) {
        NSInteger subTypeConstant = RAConstantGetValue([[@"CARD_" stringByAppendingString:subType] uppercaseString]);
        self.subType = subTypeConstant != NSNotFound ? subTypeConstant : RA_CARD_NORMAL;
    } else {
        self.subType = 0;
    }

    // Jobs
    NSDictionary<NSString *, NSNumber *> *jobs = dic[@"Jobs"] ?: @{@"All": @YES};
    self.jobs = [RAItemJob valuesOfNames:jobs];

    // Classes
    NSDictionary<NSString *, NSNumber *> *classes = dic[@"Classes"] ?: @{@"All": @YES};
    self.classes = [RAItemClass valuesOfNames:classes];

    // Gender
    NSString *gender = dic[@"Gender"] ?: @"";
    self.gender = [RAGender valueOfName:gender] ?: RAGender.both;

    // Locations
    NSDictionary<NSString *, NSNumber *> *locations = dic[@"Locations"] ?: @{};
    self.locations = [RAEquipmentLocation valuesOfNames:locations];

    if (self.type != RA_IT_WEAPON) {
        self.weaponLevel = 0;
    }

    if (self.type != RA_IT_ARMOR) {
        self.armorLevel = 0;
    }

    return YES;
}

@end

@implementation RAItemFlags

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"buyingStore"  : @"BuyingStore",
        @"deadBranch"   : @"DeadBranch",
        @"container"    : @"Container",
        @"uniqueId"     : @"UniqueId",
        @"bindOnEquip"  : @"BindOnEquip",
        @"dropAnnounce" : @"DropAnnounce",
        @"noConsume"    : @"NoConsume",
        @"dropEffect"   : @"DropEffect",
    };
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _buyingStore = NO;
        _deadBranch = NO;
        _container = NO;
        _uniqueId = NO;
        _bindOnEquip = NO;
        _dropAnnounce = NO;
        _noConsume = NO;
    }
    return self;
}

@end

@implementation RAItemDelay

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"duration" : @"Duration",
        @"status"   : @"Status",
    };
}

@end

@implementation RAItemStack

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"amount"       : @"Amount",
        @"inventory"    : @"Inventory",
        @"cart"         : @"Cart",
        @"storage"      : @"Storage",
        @"guildStorage" : @"GuildStorage",
    };
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _inventory = YES;
        _cart = NO;
        _storage = NO;
        _guildStorage = NO;
    }
    return self;
}

@end

@implementation RAItemNoUse

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"override" : @"Override",
        @"sitting"  : @"Sitting",
    };
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _override = 100;
        _sitting = NO;
    }
    return self;
}

@end

@implementation RAItemTrade

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"override"         : @"Override",
        @"noDrop"           : @"NoDrop",
        @"noTrade"          : @"NoTrade",
        @"tradePartner"     : @"TradePartner",
        @"noSell"           : @"NoSell",
        @"noCart"           : @"NoCart",
        @"noStorage"        : @"NoStorage",
        @"noGuildStorage"   : @"NoGuildStorage",
        @"noMail"           : @"NoMail",
        @"noAuction"        : @"NoAuction",
    };
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _override = 100;
        _noDrop = NO;
        _noTrade = NO;
        _tradePartner = NO;
        _noSell = NO;
        _noCart = NO;
        _noStorage = NO;
        _noGuildStorage = NO;
        _noMail = NO;
        _noAuction = NO;
    }
    return self;
}

@end
