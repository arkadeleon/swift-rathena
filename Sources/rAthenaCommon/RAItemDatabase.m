//
//  RAItemDatabase.m
//  rAthena
//
//  Created by Leon Li on 2023/2/22.
//

#import "RAItemDatabase.h"
#import "RADatabaseParser.h"
#import "YYModel/YYModel.h"

@implementation RAItem

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"itemID"       : @"Id",
        @"aegisName"    : @"AegisName",
        @"name"         : @"Name",
        @"buy"          : @"Buy",
        @"sell"         : @"Sell",
        @"weight"       : @"Weight",
        @"attack"       : @"Attack",
        @"magicAttack"  : @"MagicAttack",
        @"defense"      : @"Defense",
        @"range"        : @"Range",
        @"slots"        : @"Slots",
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

+ (NSNumber *)typeFromString:(NSString *)string {
    static NSDictionary<NSString *, NSNumber *> *typeMap = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        typeMap = @{
            @"healing"      : @(RAItemTypeHealing),
            @"usable"       : @(RAItemTypeUsable),
            @"etc"          : @(RAItemTypeEtc),
            @"armor"        : @(RAItemTypeArmor),
            @"weapon"       : @(RAItemTypeWeapon),
            @"card"         : @(RAItemTypeCard),
            @"petegg"       : @(RAItemTypePetEgg),
            @"petarmor"     : @(RAItemTypePetArmor),
            @"ammo"         : @(RAItemTypeAmmo),
            @"delayconsume" : @(RAItemTypeDelayConsume),
            @"shadowgear"   : @(RAItemTypeShadowGear),
            @"cash"         : @(RAItemTypeCash),
        };
    });

    if (string == nil) {
        return nil;
    }

    return typeMap[string.lowercaseString];
}

+ (NSNumber *)subTypeFromString:(NSString *)string {
    static NSDictionary<NSString *, NSNumber *> *subTypeMap = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        subTypeMap = @{
            @"fist"             : @(RAItemSubTypeFist),
            @"dagger"           : @(RAItemSubTypeDagger),
            @"1hsword"          : @(RAItemSubTypeOneHandedSword),
            @"2hsword"          : @(RAItemSubTypeTwoHandedSword),
            @"1hspear"          : @(RAItemSubTypeOneHandedSpear),
            @"2hspear"          : @(RAItemSubTypeTwoHandedSpear),
            @"1haxe"            : @(RAItemSubTypeOneHandedAxe),
            @"2haxe"            : @(RAItemSubTypeTwoHandedAxe),
            @"mace"             : @(RAItemSubTypeMace),
            @"staff"            : @(RAItemSubTypeStaff),
            @"bow"              : @(RAItemSubTypeBow),
            @"knuckle"          : @(RAItemSubTypeKnuckle),
            @"musical"          : @(RAItemSubTypeMusical),
            @"whip"             : @(RAItemSubTypeWhip),
            @"book"             : @(RAItemSubTypeBook),
            @"katar"            : @(RAItemSubTypeKatar),
            @"revolver"         : @(RAItemSubTypeRevolver),
            @"rifle"            : @(RAItemSubTypeRifle),
            @"gatling"          : @(RAItemSubTypeGatling),
            @"shotgun"          : @(RAItemSubTypeShotgun),
            @"grenade"          : @(RAItemSubTypeGrenade),
            @"huuma"            : @(RAItemSubTypeHuuma),
            @"2hstaff"          : @(RAItemSubTypeTwoHandedStaff),
            @"arrow"            : @(RAItemSubTypeArrow),
            @"bullet"           : @(RAItemSubTypeBullet),
            @"shell"            : @(RAItemSubTypeShell),
            @"shuriken"         : @(RAItemSubTypeShuriken),
            @"kunai"            : @(RAItemSubTypeKunai),
            @"cannonball"       : @(RAItemSubTypeCannonball),
            @"throwweapon"      : @(RAItemSubTypeThrowWeapon),
            @"normal"           : @(RAItemClassNormal),
            @"enchant"          : @(RAItemSubTypeEnchant),
        };
    });

    if (string == nil) {
        return nil;
    }

    return subTypeMap[string.lowercaseString];
}

+ (RAItemJob)jobsFromDictionary:(NSDictionary *)dictionary {
    static NSDictionary<NSString *, NSNumber *> *jobMap = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        jobMap = @{
            @"Acolyte"          : @(RAItemJobAcolyte),
            @"Alchemist"        : @(RAItemJobAlchemist),
            @"Archer"           : @(RAItemJobArcher),
            @"Assassin"         : @(RAItemJobAssassin),
            @"BardDancer"       : @(RAItemJobBardDancer),
            @"Blacksmith"       : @(RAItemJobBlacksmith),
            @"Crusader"         : @(RAItemJobCrusader),
            @"Gunslinger"       : @(RAItemJobGunslinger),
            @"Hunter"           : @(RAItemJobHunter),
            @"KagerouOboro"     : @(RAItemJobKagerouOboro),
            @"Knight"           : @(RAItemJobKnight),
            @"Mage"             : @(RAItemJobMage),
            @"Merchant"         : @(RAItemJobMerchant),
            @"Monk"             : @(RAItemJobMonk),
            @"Ninja"            : @(RAItemJobNinja),
            @"Novice"           : @(RAItemJobNovice),
            @"Priest"           : @(RAItemJobPriest),
            @"Rebellion"        : @(RAItemJobRebellion),
            @"Rogue"            : @(RAItemJobRogue),
            @"Sage"             : @(RAItemJobSage),
            @"SoulLinker"       : @(RAItemJobSoulLinker),
            @"StarGladiator"    : @(RAItemJobStarGladiator),
            @"Summoner"         : @(RAItemJobSummoner),
            @"SuperNovice"      : @(RAItemJobSuperNovice),
            @"Swordman"         : @(RAItemJobSwordman),
            @"Taekwon"          : @(RAItemJobTaekwon),
            @"Thief"            : @(RAItemJobThief),
            @"Wizard"           : @(RAItemJobWizard),
            @"All"              : @(RAItemJobAll),
        };
    });

    if (dictionary == nil || dictionary.count == 0) {
        return 0;
    }

    __block RAItemJob jobs = 0;
    [jobMap enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSNumber *job, BOOL *stop) {
        if (dictionary[key] && [dictionary[key] boolValue] == YES) {
            jobs |= job.unsignedIntegerValue;
        }
    }];

    return jobs;
}

+ (RAItemClass)classesFromDictionary:(NSDictionary *)dictionary {
    static NSDictionary<NSString *, NSNumber *> *classMap = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        classMap = @{
            @"All"          : @(RAItemClassAll),
            @"Normal"       : @(RAItemClassNormal),
            @"Upper"        : @(RAItemClassUpper),
            @"Baby"         : @(RAItemClassBaby),
            @"Third"        : @(RAItemClassThird),
            @"Third_Upper"  : @(RAItemClassThirdUpper),
            @"Third_Baby"   : @(RAItemClassThirdBaby),
            @"Fourth"       : @(RAItemClassFourth),
            @"All_Upper"    : @(RAItemClassAllUpper),
            @"All_Baby"     : @(RAItemClassAllBaby),
            @"All_Third"    : @(RAItemClassAllThird),
        };
    });

    if (dictionary == nil || dictionary.count == 0) {
        return 0;
    }

    __block RAItemClass classes = 0;
    [classMap enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSNumber *class, BOOL *stop) {
        if (dictionary[key] && [dictionary[key] boolValue] == YES) {
            classes |= class.unsignedIntegerValue;
        }
    }];

    return classes;
}

+ (NSNumber *)genderFromString:(NSString *)string {
    static NSDictionary<NSString *, NSNumber *> *genderMap = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        genderMap = @{
            @"female"   : @(RAItemGenderFemale),
            @"male"     : @(RAItemGenderMale),
            @"both"     : @(RAItemGenderBoth),
        };
    });

    if (string == nil) {
        return nil;
    }

    return genderMap[string.lowercaseString];
}

+ (RAItemLocation)locationsFromDictionary:(NSDictionary *)dictionary {
    static NSDictionary<NSString *, NSNumber *> *locationMap = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        locationMap = @{
            @"Head_Top"                 : @(RAItemLocationHeadTop),
            @"Head_Mid"                 : @(RAItemLocationHeadMid),
            @"Head_Low"                 : @(RAItemLocationHeadLow),
            @"Armor"                    : @(RAItemLocationArmor),
            @"Right_Hand"               : @(RAItemLocationRightHand),
            @"Left_Hand"                : @(RAItemLocationLeftHand),
            @"Garment"                  : @(RAItemLocationGarment),
            @"Shoes"                    : @(RAItemLocationShoes),
            @"Right_Accessory"          : @(RAItemLocationRightAccessory),
            @"Left_Accessory"           : @(RAItemLocationLeftAccessory),
            @"Costume_Head_Top"         : @(RAItemLocationCostumeHeadTop),
            @"Costume_Head_Mid"         : @(RAItemLocationCostumeHeadMid),
            @"Costume_Head_Low"         : @(RAItemLocationCostumeHeadLow),
            @"Costume_Garment"          : @(RAItemLocationCostumeGarment),
            @"Ammo"                     : @(RAItemLocationAmmo),
            @"Shadow_Armor"             : @(RAItemLocationShadowArmor),
            @"Shadow_Weapon"            : @(RAItemLocationShadowWeapon),
            @"Shadow_Shield"            : @(RAItemLocationShadowShield),
            @"Shadow_Shoes"             : @(RAItemLocationShadowShoes),
            @"Shadow_Right_Accessory"   : @(RAItemLocationShadowRightAccessory),
            @"Shadow_Left_Accessory"    : @(RAItemLocationShadowLeftAccessory),
            @"Both_Hand"                : @(RAItemLocationBothHand),
            @"Both_Accessory"           : @(RAItemLocationBothAccessory),
        };
    });

    if (dictionary == nil || dictionary.count == 0) {
        return 0;
    }

    __block RAItemLocation locations = 0;
    [locationMap enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSNumber *location, BOOL *stop) {
        if (dictionary[key] && [dictionary[key] boolValue] == YES) {
            locations |= location.unsignedIntegerValue;
        }
    }];

    return locations;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _type = RAItemTypeEtc;
        _subType = 0;
        _buy = 0;
        _sell = 0;
        _weight = 0;
        _attack = 0;
        _magicAttack = 0;
        _defense = 0;
        _range = 0;
        _slots = 0;
    }
    return self;
}

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    NSNumber *type = [RAItem typeFromString:dic[@"Type"]];
    if (type) {
        _type = type.integerValue;
    }

    NSNumber *subType = [RAItem subTypeFromString:dic[@"SubType"]];
    if (subType) {
        _subType = subType.integerValue;
    }

    _jobs = [RAItem jobsFromDictionary:dic[@"Jobs"]];

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

@interface RAItemDatabase () <RADatabaseParserDelegate>

@property (nonatomic) NSMutableArray<RAItem *> *allItems;

@end

@implementation RAItemDatabase

- (instancetype)init {
    self = [super init];
    if (self) {
        _allItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)fetchAllItemsWithCompletionHandler:(void (^)(NSArray<RAItem *> *))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        RADatabaseParser *parser;

        parser = [[RADatabaseParser alloc] initWithResource:@"db/re/item_db_usable.yml"];
        parser.delegate = self;
        [parser parse];

        parser = [[RADatabaseParser alloc] initWithResource:@"db/re/item_db_equip.yml"];
        parser.delegate = self;
        [parser parse];

        parser = [[RADatabaseParser alloc] initWithResource:@"db/re/item_db_etc.yml"];
        parser.delegate = self;
        [parser parse];

        completionHandler([self.allItems copy]);
    });
}

#pragma mark - RADatabaseParserDelegate

- (void)parser:(RADatabaseParser *)parser foundElement:(NSDictionary *)element {
    RAItem *item = [RAItem yy_modelWithJSON:element];
    [self.allItems addObject:item];
}

@end
