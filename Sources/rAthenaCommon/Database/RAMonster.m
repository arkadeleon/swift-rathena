//
//  RAMonster.m
//  rAthena
//
//  Created by Leon Li on 2023/3/13.
//

#import "RAMonster.h"
#import "Enum/RASize.h"
#import "Enum/RARace.h"
#import "Enum/RARaceGroup.h"
#import "Enum/RAElement.h"
#import "Enum/RAMonsterAi.h"
#import "Enum/RAMonsterClass.h"
#import "Enum/RAMonsterMode.h"

const NSInteger RAMonsterWalkSpeedFastest = 20;
const NSInteger RAMonsterWalkSpeedNormal = 150;
const NSInteger RAMonsterWalkSpeedSlowest = 1000;

@implementation RAMonster

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"monsterID"        : @"Id",
        @"aegisName"        : @"AegisName",
        @"name"             : @"Name",
        @"japaneseName"     : @"JapaneseName",
        @"level"            : @"Level",
        @"hp"               : @"Hp",
        @"sp"               : @"Sp",
        @"baseExp"          : @"BaseExp",
        @"jobExp"           : @"JobExp",
        @"mvpExp"           : @"MvpExp",
        @"attack"           : @"Attack",
        @"attack2"          : @"Attack2",
        @"defense"          : @"Defense",
        @"magicDefense"     : @"MagicDefense",
        @"resistance"       : @"Resistance",
        @"magicResistance"  : @"MagicResistance",
        @"strength"         : @"Str",
        @"agility"          : @"Agi",
        @"vitality"         : @"Vit",
        @"intelligence"     : @"Int",
        @"dexterity"        : @"Dex",
        @"luck"             : @"Luk",
        @"attackRange"      : @"AttackRange",
        @"skillRange"       : @"SkillRange",
        @"chaseRange"       : @"ChaseRange",
        @"size"             : @"Size",
        @"race"             : @"Race",
        @"raceGroups"       : @"RaceGroups",
        @"element"          : @"Element",
        @"elementLevel"     : @"ElementLevel",
        @"walkSpeed"        : @"WalkSpeed",
        @"attackDelay"      : @"AttackDelay",
        @"attackMotion"     : @"AttackMotion",
        @"damageMotion"     : @"DamageMotion",
        @"damageTaken"      : @"DamageTaken",
        @"ai"               : @"Ai",
        @"monsterClass"     : @"Class",
        @"modes"            : @"Modes",
        @"mvpDrops"         : @"MvpDrops",
        @"drops"            : @"Drops",
    };
}

+ (NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
        @"mvpDrops" : [RAMonsterDrop class],
        @"drops"    : [RAMonsterDrop class],
    };
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _level = 1;
        _hp = 1;
        _sp = 1;
        _baseExp = 0;
        _jobExp = 0;
        _mvpExp = 0;
        _attack = 0;
        _attack2 = 0;
        _defense = 0;
        _magicDefense = 0;
        _resistance = 0;
        _magicResistance = 0;
        _strength = 1;
        _agility = 1;
        _vitality = 1;
        _intelligence = 1;
        _dexterity = 1;
        _luck = 1;
        _attackRange = 0;
        _skillRange = 0;
        _chaseRange = 0;
        _size = RASize.small;
        _race = RARace.formless;
        _raceGroups = 0;
        _element = RAElement.neutral;
        _elementLevel = 1;
        _walkSpeed = RAMonsterWalkSpeedNormal;
        _attackDelay = 0;
        _attackMotion = 0;
        _damageMotion = 0;
        _damageTaken = 100;
        _ai = RAMonsterAi.ai06;
        _monsterClass = RAMonsterClass.normal;
        _modes = 0;
    }
    return self;
}

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    NSString *sizeName = dic[@"Size"];
    if (sizeName) {
        RASize *size = [RASize valueOfName:sizeName];
        if (size) {
            _size = size;
        }
    }

    NSString *raceName = dic[@"Race"];
    if (raceName) {
        RARace *race = [RARace valueOfName:raceName];
        if (race) {
            _race = race;
        }
    }

    NSDictionary<NSString *, NSNumber *> *raceGroupNames = dic[@"RaceGroups"];
    if (raceGroupNames) {
        NSMutableSet<RARaceGroup *> *raceGroups = [[NSMutableSet alloc] init];
        [raceGroupNames enumerateKeysAndObjectsUsingBlock:^(NSString *raceGroupName, NSNumber *value, BOOL *stop) {
            RARaceGroup *raceGroup = [RARaceGroup valueOfName:raceGroupName];
            if (raceGroup && value.boolValue) {
                [raceGroups addObject:raceGroup];
            }
        }];
        _raceGroups = [raceGroups copy];
    }

    NSString *elementName = dic[@"Element"];
    if (elementName) {
        RAElement *element = [RAElement valueOfName:elementName];
        if (element) {
            _element = element;
        }
    }

    NSString *aiName = dic[@"Ai"];
    if (aiName) {
        RAMonsterAi *ai = [RAMonsterAi valueOfName:aiName];
        if (ai) {
            _ai = ai;
        }
    }

    NSString *monsterClassName = dic[@"Class"];
    RAMonsterClass *monsterClass = [RAMonsterClass valueOfName:monsterClassName ?: @""];
    if (monsterClass) {
        _monsterClass = monsterClass;
    }

    NSDictionary<NSString *, NSNumber *> *modeNames = dic[@"Modes"];
    if (modeNames) {
        NSMutableSet<RAMonsterMode *> *modes = [[NSMutableSet alloc] init];
        [modeNames enumerateKeysAndObjectsUsingBlock:^(NSString *modeName, NSNumber *value, BOOL *stop) {
            RAMonsterMode *mode = [RAMonsterMode valueOfName:modeName];
            if (mode && value.boolValue) {
                [modes addObject:mode];
            }
        }];
        _modes = [modes copy];
    }

    return YES;
}

@end

@implementation RAMonsterDrop

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"item"                 : @"Item",
        @"rate"                 : @"Rate",
        @"stealProtected"       : @"StealProtected",
        @"randomOptionGroup"    : @"RandomOptionGroup",
        @"index"                : @"Index",
    };
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _stealProtected = false;
    }
    return self;
}

@end
