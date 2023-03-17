//
//  RAItem.m
//  rAthena
//
//  Created by Leon Li on 2023/3/13.
//

#import "RAItem.h"
#import "Enum/RAItemType.h"
#import "RAItemSubType.h"
#import "Enum/RAItemJob.h"
#import "Enum/RAItemClass.h"
#import "Enum/RAGender.h"
#import "Enum/RAEquipmentLocation.h"

@implementation RAItem

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"itemID"       : @"Id",
        @"aegisName"    : @"AegisName",
        @"name"         : @"Name",
        @"type"         : @"Type",
        @"subType"      : @"SubType",
        @"buy"          : @"Buy",
        @"sell"         : @"Sell",
        @"weight"       : @"Weight",
        @"attack"       : @"Attack",
        @"magicAttack"  : @"MagicAttack",
        @"defense"      : @"Defense",
        @"range"        : @"Range",
        @"slots"        : @"Slots",
        @"jobs"         : @"Jobs",
        @"classes"      : @"Classes",
        @"gender"       : @"Gender",
        @"locations"    : @"Locations",
        @"weaponLevel"  : @"WeaponLevel",
        @"armorLevel"   : @"ArmorLevel",
        @"equipLevelMin": @"EquipLevelMin",
        @"equipLevelMax": @"EquipLevelMax",
        @"refineable"   : @"Refineable",
        @"gradable"     : @"Gradable",
        @"view"         : @"View",
        @"aliasName"    : @"AliasName",
        @"flags"        : @"Flags",
        @"delay"        : @"Delay",
        @"stack"        : @"Stack",
        @"noUse"        : @"NoUse",
        @"trade"        : @"Trade",
        @"script"       : @"Script",
        @"equipScript"  : @"EquipScript",
        @"unEquipScript": @"UnEquipScript",
    };
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _type = RAItemType.etc;
        _subType = nil;
        _buy = 0;
        _sell = 0;
        _weight = 0;
        _attack = 0;
        _magicAttack = 0;
        _defense = 0;
        _range = 0;
        _slots = 0;
        _jobs = [[NSSet alloc] initWithArray:RAItemJob.allCases];
        _classes = [[NSSet alloc] initWithArray:RAItemClass.allCases];
        _gender = RAGender.both;
        _locations = [[NSSet alloc] init];
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
    NSString *typeName = dic[@"Type"];
    if (typeName) {
        RAItemType *type = [RAItemType valueOfName:typeName];
        if (type) {
            _type = type;
        }
    }

    _subType = [RAItemSubType itemSubTypeOfType:_type name:dic[@"SubType"]];

    NSDictionary<NSString *, NSNumber *> *jobNames = dic[@"Jobs"];
    if (jobNames) {
        NSMutableSet<RAItemJob *> *jobs = [[NSMutableSet alloc] init];
        NSNumber *allValue = jobNames[@"All"];
        if (allValue && allValue.boolValue) {
            [jobs addObjectsFromArray:RAItemJob.allCases];
        }
        [jobNames enumerateKeysAndObjectsUsingBlock:^(NSString *jobName, NSNumber *value, BOOL *stop) {
            RAItemJob *job = [RAItemJob valueOfName:jobName];
            if (job) {
                if (value.boolValue) {
                    [jobs addObject:job];
                } else {
                    [jobs removeObject:job];
                }
            }
        }];
        _jobs = [jobs copy];
    }

    NSDictionary<NSString *, NSNumber *> *classNames = dic[@"Classes"];
    if (classNames) {
        NSMutableSet<RAItemClass *> *classes = [[NSMutableSet alloc] init];
        NSNumber *allValue = classNames[@"All"];
        NSNumber *allUpperValue = classNames[@"All_Upper"];
        NSNumber *allBabyValue = classNames[@"All_Baby"];
        NSNumber *allThirdValue = classNames[@"All_Third"];
        if (allValue && allValue.boolValue) {
            [classes addObjectsFromArray:RAItemClass.allCases];
        }
        if (allUpperValue) {
            if (allUpperValue.boolValue) {
                [classes addObjectsFromArray:RAItemClass.allUpper];
            } else {
                [classes minusSet:[NSSet setWithArray:RAItemClass.allUpper]];
            }
        }
        if (allBabyValue) {
            if (allBabyValue.boolValue) {
                [classes addObjectsFromArray:RAItemClass.allBaby];
            } else {
                [classes minusSet:[NSSet setWithArray:RAItemClass.allBaby]];
            }
        }
        if (allThirdValue) {
            if (allThirdValue.boolValue) {
                [classes addObjectsFromArray:RAItemClass.allThird];
            } else {
                [classes minusSet:[NSSet setWithArray:RAItemClass.allThird]];
            }
        }
        [classNames enumerateKeysAndObjectsUsingBlock:^(NSString *className, NSNumber *value, BOOL *stop) {
            RAItemClass *itemClass = [RAItemClass valueOfName:className];
            if (itemClass) {
                if (value.boolValue) {
                    [classes addObject:itemClass];
                } else {
                    [classes removeObject:itemClass];
                }
            }
        }];
        _classes = [classes copy];
    }

    NSString *genderName = dic[@"Gender"];
    if (genderName) {
        RAGender *gender = [RAGender valueOfName:genderName];
        if (gender) {
            _gender = gender;
        }
    }

    NSDictionary<NSString *, NSNumber *> *locationNames = dic[@"Locations"];
    if (locationNames) {
        _locations = [RAEquipmentLocation valuesOfNames:locationNames];
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
