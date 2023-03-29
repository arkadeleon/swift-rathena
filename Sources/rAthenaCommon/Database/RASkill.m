//
//  RASkill.m
//  rAthena
//
//  Created by Leon Li on 2023/3/21.
//

#import "RASkill.h"
#import "Enum/RASkillType.h"
#import "Enum/RASkillTargetType.h"
#import "Enum/RASkillDamageFlag.h"
#import "Enum/RASkillFlag.h"
#import "Enum/RASkillHitType.h"
#import "Enum/RAElement.h"
#import "Enum/RAWeaponType.h"
#import "Enum/RAAmmoType.h"

@interface RASkillLevelSpecificSize ()

- (instancetype)initWithSize:(NSInteger)size;

@end

@interface RASkillLevelSpecificCount ()

- (instancetype)initWithCount:(NSInteger)count;

@end

@interface RASkillLevelSpecificElement ()

- (instancetype)initWithElement:(RAElement *)element;

@end

@interface RASkillLevelSpecificArea ()

- (instancetype)initWithArea:(NSInteger)area;

@end

@interface RASkillLevelSpecificMaxAmount ()

- (instancetype)initWithMax:(NSInteger)max;

@end

@interface RASkillLevelSpecificAmount ()

- (instancetype)initWithAmount:(NSInteger)amount;

@end

@interface RASkillLevelSpecificTime ()

- (instancetype)initWithTime:(NSInteger)time;

@end

@implementation RASkill

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"skillID"              : @"Id",
        @"skillName"            : @"Name",
        @"skillDescription"     : @"Description",
        @"maxLevel"             : @"MaxLevel",
        @"range"                : @"Range",
        @"hitCount"             : @"HitCount",
        @"element"              : @"Element",
        @"splashArea"           : @"SplashArea",
        @"activeInstance"       : @"ActiveInstance",
        @"knockback"            : @"Knockback",
        @"giveAp"               : @"GiveAp",
        @"castCancel"           : @"CastCancel",
        @"castDefenseReduction" : @"CastDefenseReduction",
        @"castTime"             : @"CastTime",
        @"afterCastActDelay"    : @"AfterCastActDelay",
        @"afterCastWalkDelay"   : @"AfterCastWalkDelay",
        @"duration1"            : @"Duration1",
        @"duration2"            : @"Duration2",
        @"cooldown"             : @"Cooldown",
        @"fixedCastTime"        : @"FixedCastTime",
        @"requires"             : @"Requires",
        @"unit"                 : @"Unit",
    };
}

+ (NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
        @"range"                : [RASkillLevelSpecificSize class],
        @"hitCount"             : [RASkillLevelSpecificCount class],
        @"element"              : [RASkillLevelSpecificElement class],
        @"splashArea"           : [RASkillLevelSpecificArea class],
        @"activeInstance"       : [RASkillLevelSpecificMaxAmount class],
        @"knockback"            : [RASkillLevelSpecificAmount class],
        @"giveAp"               : [RASkillLevelSpecificAmount class],
        @"castTime"             : [RASkillLevelSpecificTime class],
        @"afterCastActDelay"    : [RASkillLevelSpecificTime class],
        @"afterCastWalkDelay"   : [RASkillLevelSpecificTime class],
        @"duration1"            : [RASkillLevelSpecificTime class],
        @"duration2"            : [RASkillLevelSpecificTime class],
        @"cooldown"             : [RASkillLevelSpecificTime class],
        @"fixedCastTime"        : [RASkillLevelSpecificTime class],
    };
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _castCancel = NO;
        _castDefenseReduction = 0;
    }
    return self;
}

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    // Type
    NSString *type = dic[@"Type"] ?: @"";
    self.type = [RASkillType valueOfName:type] ?: RASkillType.none;

    // TargetType
    NSString *targetType = dic[@"TargetType"] ?: @"";
    self.targetType = [RASkillTargetType valueOfName:targetType] ?: RASkillTargetType.passive;

    // DamageFlags
    NSDictionary<NSString *, NSNumber *> *damageFlags = dic[@"DamageFlags"] ?: @{};
    self.damageFlags = [RASkillDamageFlag valuesOfNames:damageFlags];

    // Flags
    NSDictionary<NSString *, NSNumber *> *flags = dic[@"Flags"] ?: @{};
    self.flags = [RASkillFlag valuesOfNames:flags];

    // Range
    NSString *range = dic[@"Range"];
    if (range && [range isKindOfClass:[NSString class]]) {
        self.range = @[
            [[RASkillLevelSpecificSize alloc] initWithSize:range.integerValue]
        ];
    }

    // Hit
    NSString *hit = dic[@"Hit"] ?: @"";
    self.hit = [RASkillHitType valueOfName:hit] ?: RASkillHitType.normal;

    // HitCount
    NSString *hitCount = dic[@"HitCount"];
    if (hitCount && [hitCount isKindOfClass:[NSString class]]) {
        self.hitCount = @[
            [[RASkillLevelSpecificCount alloc] initWithCount:hitCount.integerValue]
        ];
    }

    // Element
    NSString *element = dic[@"Element"];
    if (element && [element isKindOfClass:[NSString class]]) {
        self.element = @[
            [[RASkillLevelSpecificElement alloc] initWithElement:[RAElement valueOfName:element] ?: RAElement.neutral]
        ];
    }

    // SplashArea
    NSString *splashArea = dic[@"SplashArea"];
    if (splashArea && [splashArea isKindOfClass:[NSString class]]) {
        self.splashArea = @[
            [[RASkillLevelSpecificArea alloc] initWithArea:splashArea.integerValue]
        ];
    }

    // ActiveInstance
    NSString *activeInstance = dic[@"ActiveInstance"];
    if (activeInstance && [activeInstance isKindOfClass:[NSString class]]) {
        self.activeInstance = @[
            [[RASkillLevelSpecificMaxAmount alloc] initWithMax:activeInstance.integerValue]
        ];
    }

    // Knockback
    NSString *knockback = dic[@"Knockback"];
    if (knockback && [knockback isKindOfClass:[NSString class]]) {
        self.knockback = @[
            [[RASkillLevelSpecificAmount alloc] initWithAmount:knockback.integerValue]
        ];
    }

    // GiveAp
    NSString *giveAp = dic[@"GiveAp"];
    if (giveAp && [giveAp isKindOfClass:[NSString class]]) {
        self.giveAp = @[
            [[RASkillLevelSpecificAmount alloc] initWithAmount:giveAp.integerValue]
        ];
    }

    // CopyFlags

    // NoNearNPC

    // CastTime
    NSString *castTime = dic[@"CastTime"];
    if (castTime && [castTime isKindOfClass:[NSString class]]) {
        self.castTime = @[
            [[RASkillLevelSpecificTime alloc] initWithTime:castTime.integerValue]
        ];
    }

    // AfterCastActDelay
    NSString *afterCastActDelay = dic[@"AfterCastActDelay"];
    if (afterCastActDelay && [afterCastActDelay isKindOfClass:[NSString class]]) {
        self.afterCastActDelay = @[
            [[RASkillLevelSpecificTime alloc] initWithTime:afterCastActDelay.integerValue]
        ];
    }

    // AfterCastWalkDelay
    NSString *afterCastWalkDelay = dic[@"AfterCastWalkDelay"];
    if (afterCastWalkDelay && [afterCastWalkDelay isKindOfClass:[NSString class]]) {
        self.afterCastWalkDelay = @[
            [[RASkillLevelSpecificTime alloc] initWithTime:afterCastWalkDelay.integerValue]
        ];
    }

    // Duration1
    NSString *duration1 = dic[@"Duration1"];
    if (duration1 && [duration1 isKindOfClass:[NSString class]]) {
        self.duration1 = @[
            [[RASkillLevelSpecificTime alloc] initWithTime:duration1.integerValue]
        ];
    }

    // Duration2
    NSString *duration2 = dic[@"Duration2"];
    if (duration2 && [duration2 isKindOfClass:[NSString class]]) {
        self.duration2 = @[
            [[RASkillLevelSpecificTime alloc] initWithTime:duration2.integerValue]
        ];
    }

    // Cooldown
    NSString *cooldown = dic[@"Cooldown"];
    if (cooldown && [cooldown isKindOfClass:[NSString class]]) {
        self.cooldown = @[
            [[RASkillLevelSpecificTime alloc] initWithTime:cooldown.integerValue]
        ];
    }

    // FixedCastTime
    NSString *fixedCastTime = dic[@"FixedCastTime"];
    if (fixedCastTime && [fixedCastTime isKindOfClass:[NSString class]]) {
        self.fixedCastTime = @[
            [[RASkillLevelSpecificTime alloc] initWithTime:fixedCastTime.integerValue]
        ];
    }

    // CastTimeFlags

    // CastDelayFlags

    // Status

    return YES;
}

@end

@implementation RASkillRequirement

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"hpCost"           : @"HpCost",
        @"spCost"           : @"SpCost",
        @"apCost"           : @"ApCost",
        @"hpRateCost"       : @"HpRateCost",
        @"spRateCost"       : @"SpRateCost",
        @"apRateCost"       : @"ApRateCost",
        @"maxHpTrigger"     : @"MaxHpTrigger",
        @"zenyCost"         : @"ZenyCost",
        @"ammoAmount"       : @"AmmoAmount",
        @"spiritSphereCost" : @"SpiritSphereCost",
        @"itemCost"         : @"ItemCost",
    };
}

+ (NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
        @"hpCost"           : [RASkillLevelSpecificAmount class],
        @"spCost"           : [RASkillLevelSpecificAmount class],
        @"apCost"           : [RASkillLevelSpecificAmount class],
        @"hpRateCost"       : [RASkillLevelSpecificAmount class],
        @"spRateCost"       : [RASkillLevelSpecificAmount class],
        @"apRateCost"       : [RASkillLevelSpecificAmount class],
        @"maxHpTrigger"     : [RASkillLevelSpecificAmount class],
        @"zenyCost"         : [RASkillLevelSpecificAmount class],
        @"ammoAmount"       : [RASkillLevelSpecificAmount class],
        @"spiritSphereCost" : [RASkillLevelSpecificAmount class],
        @"itemCost"         : [RASkillLevelSpecificItem class],
    };
}

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    // HpCost
    NSString *hpCost = dic[@"HpCost"];
    if (hpCost && [hpCost isKindOfClass:[NSString class]]) {
        self.hpCost = @[
            [[RASkillLevelSpecificAmount alloc] initWithAmount:hpCost.integerValue]
        ];
    }

    // SpCost
    NSString *spCost = dic[@"SpCost"];
    if (spCost && [spCost isKindOfClass:[NSString class]]) {
        self.spCost = @[
            [[RASkillLevelSpecificAmount alloc] initWithAmount:spCost.integerValue]
        ];
    }

    // ApCost
    NSString *apCost = dic[@"ApCost"];
    if (apCost && [apCost isKindOfClass:[NSString class]]) {
        self.apCost = @[
            [[RASkillLevelSpecificAmount alloc] initWithAmount:apCost.integerValue]
        ];
    }

    // HpRateCost
    NSString *hpRateCost = dic[@"HpRateCost"];
    if (hpRateCost && [hpRateCost isKindOfClass:[NSString class]]) {
        self.hpRateCost = @[
            [[RASkillLevelSpecificAmount alloc] initWithAmount:hpRateCost.integerValue]
        ];
    }

    // SpRateCost
    NSString *spRateCost = dic[@"SpRateCost"];
    if (spRateCost && [spRateCost isKindOfClass:[NSString class]]) {
        self.spRateCost = @[
            [[RASkillLevelSpecificAmount alloc] initWithAmount:spRateCost.integerValue]
        ];
    }

    // ApRateCost
    NSString *apRateCost = dic[@"ApRateCost"];
    if (apRateCost && [apRateCost isKindOfClass:[NSString class]]) {
        self.apRateCost = @[
            [[RASkillLevelSpecificAmount alloc] initWithAmount:apRateCost.integerValue]
        ];
    }

    // MaxHpTrigger
    NSString *maxHpTrigger = dic[@"MaxHpTrigger"];
    if (maxHpTrigger && [maxHpTrigger isKindOfClass:[NSString class]]) {
        self.maxHpTrigger = @[
            [[RASkillLevelSpecificAmount alloc] initWithAmount:maxHpTrigger.integerValue]
        ];
    }

    // ZenyCost
    NSString *zenyCost = dic[@"ZenyCost"];
    if (zenyCost && [zenyCost isKindOfClass:[NSString class]]) {
        self.zenyCost = @[
            [[RASkillLevelSpecificAmount alloc] initWithAmount:zenyCost.integerValue]
        ];
    }

    // Weapon
    NSDictionary<NSString *, NSNumber *> *weapon = dic[@"Weapon"] ?: @{@"All": @YES};
    self.weapon = [RAWeaponType valuesOfNames:weapon];

    // Ammo
    NSDictionary<NSString *, NSNumber *> *ammo = dic[@"Ammo"] ?: @{};
    self.ammo = [RAAmmoType valuesOfNames:ammo];

    // AmmoAmount
    NSString *ammoAmount = dic[@"AmmoAmount"];
    if (ammoAmount && [ammoAmount isKindOfClass:[NSString class]]) {
        self.ammoAmount = @[
            [[RASkillLevelSpecificAmount alloc] initWithAmount:ammoAmount.integerValue]
        ];
    }

    // State

    // Status

    // SpiritSphereCost
    NSString *spiritSphereCost = dic[@"SpiritSphereCost"];
    if (spiritSphereCost && [spiritSphereCost isKindOfClass:[NSString class]]) {
        self.spiritSphereCost = @[
            [[RASkillLevelSpecificAmount alloc] initWithAmount:spiritSphereCost.integerValue]
        ];
    }

    // Equipment

    return YES;
}

@end

@implementation RASkillUnit

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"skillUnitID"          : @"Id",
        @"alternateSkillUnitID" : @"AlternateId",
        @"layout"               : @"Layout",
        @"range"                : @"Range",
        @"interval"             : @"Interval",
    };
}

+ (NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
        @"layout"   : [RASkillLevelSpecificSize class],
        @"range"    : [RASkillLevelSpecificSize class],
    };
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _interval = 0;
    }
    return self;
}

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    // Layout
    NSString *layout = dic[@"Layout"];
    if (layout && [layout isKindOfClass:[NSString class]]) {
        self.layout = @[
            [[RASkillLevelSpecificSize alloc] initWithSize:layout.integerValue]
        ];
    }

    // Range
    NSString *range = dic[@"Range"];
    if (range && [range isKindOfClass:[NSString class]]) {
        self.range = @[
            [[RASkillLevelSpecificSize alloc] initWithSize:range.integerValue]
        ];
    }

    // Target

    // Flag

    return YES;
}

@end

@implementation RASkillLevelSpecificSize

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"level"    : @"Level",
        @"size"     : @"Size",
    };
}

- (instancetype)initWithSize:(NSInteger)size {
    self = [super init];
    if (self) {
        _level = 0;
        _size = size;
    }
    return self;
}

@end

@implementation RASkillLevelSpecificCount

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"level"    : @"Level",
        @"count"    : @"Count",
    };
}

- (instancetype)initWithCount:(NSInteger)count {
    self = [super init];
    if (self) {
        _level = 0;
        _count = count;
    }
    return self;
}

@end

@implementation RASkillLevelSpecificElement

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"level"    : @"Level",
    };
}

- (instancetype)initWithElement:(RAElement *)element {
    self = [super init];
    if (self) {
        _level = 0;
        _element = element;
    }
    return self;
}

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    // Element
    NSString *element = dic[@"Element"] ?: @"";
    self.element = [RAElement valueOfName:element] ?: RAElement.neutral;

    return YES;
}

@end

@implementation RASkillLevelSpecificArea

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"level"    : @"Level",
        @"area"     : @"Area",
    };
}

- (instancetype)initWithArea:(NSInteger)area {
    self = [super init];
    if (self) {
        _level = 0;
        _area = area;
    }
    return self;
}

@end

@implementation RASkillLevelSpecificMaxAmount

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"level"    : @"Level",
        @"max"      : @"Max",
    };
}

- (instancetype)initWithMax:(NSInteger)max {
    self = [super init];
    if (self) {
        _level = 0;
        _max = max;
    }
    return self;
}

@end

@implementation RASkillLevelSpecificAmount

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"level"    : @"Level",
        @"amount"   : @"Amount",
    };
}

- (instancetype)initWithAmount:(NSInteger)amount {
    self = [super init];
    if (self) {
        _level = 0;
        _amount = amount;
    }
    return self;
}

@end

@implementation RASkillLevelSpecificTime

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"level"    : @"Level",
        @"time"     : @"Time",
    };
}

- (instancetype)initWithTime:(NSInteger)time {
    self = [super init];
    if (self) {
        _level = 0;
        _time = time;
    }
    return self;
}

@end

@implementation RASkillLevelSpecificItem

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"item"     : @"Item",
        @"amount"   : @"Amount",
        @"level"    : @"Level",
    };
}

@end
