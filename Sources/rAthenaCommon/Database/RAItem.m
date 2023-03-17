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

+ (RAItemClass)classesFromDictionary:(NSDictionary *)dictionary {
    static NSDictionary<NSString *, NSNumber *> *classMap = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        classMap = @{
            @"Normal"     .lowercaseString : @(RAItemClassNormal),
            @"Upper"      .lowercaseString : @(RAItemClassUpper),
            @"Baby"       .lowercaseString : @(RAItemClassBaby),
            @"Third"      .lowercaseString : @(RAItemClassThird),
            @"Third_Upper".lowercaseString : @(RAItemClassThirdUpper),
            @"Third_Baby" .lowercaseString : @(RAItemClassThirdBaby),
            @"Fourth"     .lowercaseString : @(RAItemClassFourth),
            @"All_Upper"  .lowercaseString : @(RAItemClassAllUpper),
            @"All_Baby"   .lowercaseString : @(RAItemClassAllBaby),
            @"All_Third"  .lowercaseString : @(RAItemClassAllThird),
            @"All"        .lowercaseString : @(RAItemClassAll),
        };
    });

    if (dictionary == nil || dictionary.count == 0) {
        return 0;
    }

    __block RAItemClass classes = 0;
    [dictionary enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSNumber *obj, BOOL *stop) {
        NSNumber *itemClass = classMap[key.lowercaseString];
        if (itemClass && obj.boolValue == YES) {
            classes |= itemClass.unsignedIntegerValue;
        }
    }];

    return classes;
}

+ (NSNumber *)genderFromString:(NSString *)string {
    static NSDictionary<NSString *, NSNumber *> *genderMap = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        genderMap = @{
            @"Female".lowercaseString : @(RAItemGenderFemale),
            @"Male"  .lowercaseString : @(RAItemGenderMale),
            @"Both"  .lowercaseString : @(RAItemGenderBoth),
        };
    });

    if (string == nil) {
        return nil;
    }

    NSNumber *gender = genderMap[string.lowercaseString];
    return gender;
}

+ (RAItemLocation)locationsFromDictionary:(NSDictionary *)dictionary {
    static NSDictionary<NSString *, NSNumber *> *locationMap = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        locationMap = @{
            @"Head_Top"              .lowercaseString : @(RAItemLocationHeadTop),
            @"Head_Mid"              .lowercaseString : @(RAItemLocationHeadMid),
            @"Head_Low"              .lowercaseString : @(RAItemLocationHeadLow),
            @"Armor"                 .lowercaseString : @(RAItemLocationArmor),
            @"Right_Hand"            .lowercaseString : @(RAItemLocationRightHand),
            @"Left_Hand"             .lowercaseString : @(RAItemLocationLeftHand),
            @"Garment"               .lowercaseString : @(RAItemLocationGarment),
            @"Shoes"                 .lowercaseString : @(RAItemLocationShoes),
            @"Right_Accessory"       .lowercaseString : @(RAItemLocationRightAccessory),
            @"Left_Accessory"        .lowercaseString : @(RAItemLocationLeftAccessory),
            @"Costume_Head_Top"      .lowercaseString : @(RAItemLocationCostumeHeadTop),
            @"Costume_Head_Mid"      .lowercaseString : @(RAItemLocationCostumeHeadMid),
            @"Costume_Head_Low"      .lowercaseString : @(RAItemLocationCostumeHeadLow),
            @"Costume_Garment"       .lowercaseString : @(RAItemLocationCostumeGarment),
            @"Ammo"                  .lowercaseString : @(RAItemLocationAmmo),
            @"Shadow_Armor"          .lowercaseString : @(RAItemLocationShadowArmor),
            @"Shadow_Weapon"         .lowercaseString : @(RAItemLocationShadowWeapon),
            @"Shadow_Shield"         .lowercaseString : @(RAItemLocationShadowShield),
            @"Shadow_Shoes"          .lowercaseString : @(RAItemLocationShadowShoes),
            @"Shadow_Right_Accessory".lowercaseString : @(RAItemLocationShadowRightAccessory),
            @"Shadow_Left_Accessory" .lowercaseString : @(RAItemLocationShadowLeftAccessory),
            @"Both_Hand"             .lowercaseString : @(RAItemLocationBothHand),
            @"Both_Accessory"        .lowercaseString : @(RAItemLocationBothAccessory),
        };
    });

    if (dictionary == nil || dictionary.count == 0) {
        return 0;
    }

    __block RAItemLocation locations = 0;
    [dictionary enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSNumber *obj, BOOL *stop) {
        NSNumber *location = locationMap[key.lowercaseString];
        if (location && obj.boolValue == YES) {
            locations |= location.unsignedIntegerValue;
        }
    }];

    return locations;
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
        _classes = RAItemClassAll;
        _gender = RAItemGenderBoth;
        _locations = 0;
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

    _classes = [RAItem classesFromDictionary:dic[@"Classes"]];

    NSNumber *gender = [RAItem genderFromString:dic[@"Gender"]];
    if (gender) {
        _gender = gender.integerValue;
    }

    _locations = [RAItem locationsFromDictionary:dic[@"Locations"]];

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
