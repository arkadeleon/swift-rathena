//
//  RASkillDatabase.m
//  rAthena
//
//  Created by Leon Li on 2023/6/27.
//

#import "RASkillDatabase.h"
#include "map/skill.hpp"

@interface RASkill ()

- (instancetype)initWithSkill:(std::shared_ptr<s_skill_db>)skill;

@end

@interface RASkillCopyFlags ()

- (instancetype)initWithSkillCopyable:(s_skill_copyable)skill_copyable;

@end

@interface RASkillNoNearNPC ()

- (instancetype)initWithSkill:(std::shared_ptr<s_skill_db>)skill;

@end

@interface RASkillRequirement ()

- (instancetype)initWithSkillRequirement:(s_skill_require)skill_requirement;

@end

@interface RASkillUnit ()

- (instancetype)initWithSkill:(std::shared_ptr<s_skill_db>)skill;

@end

@implementation RASkillDatabase

+ (RASkillDatabase *)sharedDatabase {
    static RASkillDatabase *sharedDatabase = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDatabase = [[RASkillDatabase alloc] init];
    });
    return sharedDatabase;
}

- (NSString *)name {
    return @"Skill Database";
}

- (void)recoverCache:(NSMutableDictionary<NSNumber *, RADatabaseRecord *> *)cache {
    for (auto entry = skill_db.begin(); entry != skill_db.end(); ++entry) {
        RASkill *skill = [[RASkill alloc] initWithSkill:entry->second];
        cache[@(skill.skillID)] = skill;
    }
}

@end

@implementation RASkill

- (instancetype)initWithSkill:(std::shared_ptr<s_skill_db>)skill {
    self = [super init];
    if (self) {
        _skillID = skill->nameid;
        _skillName = [NSString stringWithUTF8String:skill->name];
        _skillDescription = [NSString stringWithUTF8String:skill->desc];
        _maxLevel = skill->max;
        _type = skill->skill_type;
        _targetType = skill->inf;
        _damageFlags = skill->nk.to_ulong();
        _flags = skill->inf2.to_ulong();
        _range = NSArrayFromInt32Array(skill->range, MAX_SKILL_LEVEL);
        _hit = skill->hit;
        _hitCount = NSArrayFromInt32Array(skill->num, MAX_SKILL_LEVEL);
        _element = NSArrayFromInt8Array((int8_t *)skill->element, MAX_SKILL_LEVEL);
        _splashArea = NSArrayFromInt32Array(skill->splash, MAX_SKILL_LEVEL);
        _activeInstance = NSArrayFromInt32Array(skill->maxcount, MAX_SKILL_LEVEL);
        _knockback = NSArrayFromInt32Array(skill->blewcount, MAX_SKILL_LEVEL);
        _giveAp = NSArrayFromInt32Array(skill->giveap, MAX_SKILL_LEVEL);
        _skillCopyFlags = [[RASkillCopyFlags alloc] initWithSkillCopyable:skill->copyable];
        _noNearNPC = [[RASkillNoNearNPC alloc] initWithSkill:skill];
        _castCancel = skill->castcancel;
        _castDefenseReduction = skill->cast_def_rate;
        _castTime = NSArrayFromInt32Array(skill->cast, MAX_SKILL_LEVEL);
        _afterCastActDelay = NSArrayFromInt32Array(skill->delay, MAX_SKILL_LEVEL);
        _afterCastWalkDelay = NSArrayFromInt32Array(skill->walkdelay, MAX_SKILL_LEVEL);
        _duration1 = NSArrayFromInt32Array(skill->upkeep_time, MAX_SKILL_LEVEL);
        _duration2 = NSArrayFromInt32Array(skill->upkeep_time2, MAX_SKILL_LEVEL);
        _cooldown = NSArrayFromInt32Array(skill->cooldown, MAX_SKILL_LEVEL);
#ifdef RENEWAL_CAST
        _fixedCastTime = NSArrayFromInt32Array(skill->fixed_cast, MAX_SKILL_LEVEL);
#endif
        _castTimeFlags = skill->castnodex;
        _castDelayFlags = skill->delaynodex;
        _requirement = [[RASkillRequirement alloc] initWithSkillRequirement:skill->require];
        _unit = [[RASkillUnit alloc] initWithSkill:skill];
        _status = skill->sc;
    }
    return self;
}

- (NSInteger)recordID {
    return self.skillID;
}

- (NSString *)recordTitle {
    return self.skillDescription;
}

- (NSArray<RADatabaseRecordField *> *)recordFields {
    NSMutableArray<RADatabaseRecordField *> *fields = [NSMutableArray array];

    [fields ra_addFieldWithName:@"ID" stringValue:[NSString stringWithFormat:@"#%ld", self.skillID]];
    [fields ra_addFieldWithName:@"Name" stringValue:self.skillName];
    [fields ra_addFieldWithName:@"Description" stringValue:self.skillDescription];

    [fields ra_addFieldWithName:@"Maximum Level" numberValue:@(self.maxLevel)];
    [fields ra_addFieldWithName:@"Type" stringValue:@(self.type).stringValue];
    [fields ra_addFieldWithName:@"Target Type" stringValue:@(self.targetType).stringValue];

    // TODO: Damage Flags

    // TODO: Flags

    [fields ra_addFieldWithName:@"Range" arrayValue:[self fieldsWithNumbers:self.range]];

    // TODO: Hit

    [fields ra_addFieldWithName:@"Hit Count" arrayValue:[self fieldsWithNumbers:self.hitCount]];

    [fields ra_addFieldWithName:@"Element" arrayValue:[self fieldsWithNumbers:self.element transform:^NSString *(NSNumber *element) {
        return NSStringFromRAElement(element.integerValue);
    }]];

    [fields ra_addFieldWithName:@"Splash Area" arrayValue:[self fieldsWithNumbers:self.splashArea]];

    [fields ra_addFieldWithName:@"Maximum Active Instances" arrayValue:[self fieldsWithNumbers:self.activeInstance]];

    [fields ra_addFieldWithName:@"Knockback" arrayValue:[self fieldsWithNumbers:self.knockback]];

    [fields ra_addFieldWithName:@"Give AP" arrayValue:[self fieldsWithNumbers:self.giveAp]];

    // TODO: Copy Flags

    // TODO: No Near NPC

    [fields ra_addFieldWithName:@"Cancel Cast When Hit" numberValue:@(self.castCancel)];
    [fields ra_addFieldWithName:@"Defense Reducation Rate During Cast" numberValue:@(self.castDefenseReduction)];

    [fields ra_addFieldWithName:@"Cast Time" arrayValue:[self fieldsWithNumbers:self.castTime]];
    [fields ra_addFieldWithName:@"Action Delay After Cast" arrayValue:[self fieldsWithNumbers:self.afterCastActDelay]];
    [fields ra_addFieldWithName:@"Walk Delay After Cast" arrayValue:[self fieldsWithNumbers:self.afterCastWalkDelay]];
    [fields ra_addFieldWithName:@"Duration 1" arrayValue:[self fieldsWithNumbers:self.duration1]];
    [fields ra_addFieldWithName:@"Duration 2" arrayValue:[self fieldsWithNumbers:self.duration2]];
    [fields ra_addFieldWithName:@"Cooldown" arrayValue:[self fieldsWithNumbers:self.cooldown]];
    [fields ra_addFieldWithName:@"Fixed Cast Time" arrayValue:[self fieldsWithNumbers:self.fixedCastTime]];

    // TODO: Cast Time Flags

    // TODO: Cast Delay Flags

    NSMutableArray<RADatabaseRecordField *> *requirementFields = [NSMutableArray array];
    [requirementFields ra_addFieldWithName:@"HP" arrayValue:[self fieldsWithNumbers:self.requirement.hpCost]];
    [requirementFields ra_addFieldWithName:@"SP" arrayValue:[self fieldsWithNumbers:self.requirement.spCost]];
    [requirementFields ra_addFieldWithName:@"AP" arrayValue:[self fieldsWithNumbers:self.requirement.apCost]];
    [requirementFields ra_addFieldWithName:@"HP Rate" arrayValue:[self fieldsWithNumbers:self.requirement.hpRateCost]];
    [requirementFields ra_addFieldWithName:@"SP Rate" arrayValue:[self fieldsWithNumbers:self.requirement.spRateCost]];
    [requirementFields ra_addFieldWithName:@"AP Rate" arrayValue:[self fieldsWithNumbers:self.requirement.apRateCost]];
    [requirementFields ra_addFieldWithName:@"Maximum HP" arrayValue:[self fieldsWithNumbers:self.requirement.maxHpTrigger]];
    [requirementFields ra_addFieldWithName:@"Zeny" arrayValue:[self fieldsWithNumbers:self.requirement.zenyCost]];
    // TODO: Weapon
    // TODO: Ammo
    [requirementFields ra_addFieldWithName:@"Ammo Amount" arrayValue:[self fieldsWithNumbers:self.requirement.ammoAmount]];
    // TODO: State
    // TODO: Status
    [requirementFields ra_addFieldWithName:@"Spirit Sphere" arrayValue:[self fieldsWithNumbers:self.requirement.spiritSphereCost]];
    // TODO: Item
    // TODO: Equipment
    [fields ra_addFieldWithName:@"Requirements" arrayValue:requirementFields];

    // TODO: Unit

    // TODO: Status

    return [fields copy];
}

- (NSArray<RADatabaseRecordField *> *)fieldsWithNumbers:(NSArray<NSNumber *> *)numbers {
    NSMutableArray<RADatabaseRecordField *> *fields = [NSMutableArray arrayWithCapacity:numbers.count];
    for (NSInteger level = 0; level < numbers.count; level++) {
        [fields ra_addFieldWithName:[NSString stringWithFormat:@"Level %ld", level + 1] numberValue:numbers[level]];
    }
    return [fields copy];
}

- (NSArray<RADatabaseRecordField *> *)fieldsWithNumbers:(NSArray<NSNumber *> *)numbers transform:(NSString *(^)(NSNumber *))transform {
    NSMutableArray<RADatabaseRecordField *> *fields = [NSMutableArray arrayWithCapacity:numbers.count];
    for (NSInteger level = 0; level < numbers.count; level++) {
        [fields ra_addFieldWithName:[NSString stringWithFormat:@"Level %ld", level + 1] stringValue:transform(numbers[level])];
    }
    return [fields copy];
}

@end

@implementation RASkillCopyFlags

- (instancetype)initWithSkillCopyable:(s_skill_copyable)skill_copyable {
    self = [super init];
    if (self) {
        _skill = skill_copyable.option;
        _removeRequirement = skill_copyable.req_opt;
    }
    return self;
}

@end

@implementation RASkillNoNearNPC

- (instancetype)initWithSkill:(std::shared_ptr<s_skill_db>)skill {
    self = [super init];
    if (self) {
        _additionalRange = skill->unit_nonearnpc_range;
        _type = skill->unit_nonearnpc_type;
    }
    return self;
}

@end

@implementation RASkillRequirement

- (instancetype)initWithSkillRequirement:(s_skill_require)skill_requirement {
    self = [super init];
    if (self) {
        _hpCost = NSArrayFromInt32Array(skill_requirement.hp, MAX_SKILL_LEVEL);
        _spCost = NSArrayFromInt32Array(skill_requirement.sp, MAX_SKILL_LEVEL);
        _apCost = NSArrayFromInt32Array(skill_requirement.ap, MAX_SKILL_LEVEL);
        _hpRateCost = NSArrayFromInt32Array(skill_requirement.hp_rate, MAX_SKILL_LEVEL);
        _spRateCost = NSArrayFromInt32Array(skill_requirement.sp_rate, MAX_SKILL_LEVEL);
        _apRateCost = NSArrayFromInt32Array(skill_requirement.sp_rate, MAX_SKILL_LEVEL);
        _maxHpTrigger = NSArrayFromInt32Array(skill_requirement.mhp, MAX_SKILL_LEVEL);
        _zenyCost = NSArrayFromInt32Array(skill_requirement.zeny, MAX_SKILL_LEVEL);
        _weapon = skill_requirement.weapon;
        _ammo = skill_requirement.ammo;
        _ammoAmount = NSArrayFromInt32Array(skill_requirement.ammo_qty, MAX_SKILL_LEVEL);
        _state = skill_requirement.state;
        _status = NSArrayFromInt16Array((int16_t *)skill_requirement.status.data(), skill_requirement.status.size());
        _spiritSphereCost = NSArrayFromInt32Array(skill_requirement.spiritball, MAX_SKILL_LEVEL);
        _itemID = NSArrayFromUInt32Array(skill_requirement.itemid, MAX_SKILL_ITEM_REQUIRE);
        _itemAmount = NSArrayFromInt32Array(skill_requirement.amount, MAX_SKILL_ITEM_REQUIRE);
        _equipment = NSArrayFromUInt32Array(skill_requirement.eqItem.data(), skill_requirement.eqItem.size());
    }
    return self;
}

@end

@implementation RASkillUnit

- (instancetype)initWithSkill:(std::shared_ptr<s_skill_db>)skill {
    self = [super init];
    if (self) {
        _skillUnitID = skill->unit_id;
        _alternateSkillUnitID = skill->unit_id2;
        _layout = NSArrayFromInt32Array(skill->unit_layout_type, MAX_SKILL_LEVEL);
        _range = NSArrayFromInt32Array(skill->unit_range, MAX_SKILL_LEVEL);
        _interval = skill->unit_interval;
        _target = skill->unit_target;
        _flags = skill->unit_flag.to_ulong();
    }
    return self;
}

@end
