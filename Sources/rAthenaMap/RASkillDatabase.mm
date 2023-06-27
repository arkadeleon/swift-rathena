//
//  RASkillDatabase.m
//  rAthena
//
//  Created by Leon Li on 2023/6/27.
//

#import "RASkillDatabase.h"
#include "map/skill.hpp"

NSArray * NSArrayFromInt32Array(int32_t *array, size_t size) {
    NSMutableArray<NSNumber *> *numbers = [NSMutableArray arrayWithCapacity:size];
    for (int index = 0; index < size; index++) {
        [numbers addObject:@(array[index])];
    }
    return [numbers copy];
}

NSArray * NSArrayFromElementArray(e_element *array, size_t size) {
    NSMutableArray<NSNumber *> *numbers = [NSMutableArray arrayWithCapacity:size];
    for (int index = 0; index < size; index++) {
        [numbers addObject:@(array[index])];
    }
    return [numbers copy];
}

NSArray * NSArrayFromItemIDArray(t_itemid *array, size_t size) {
    NSMutableArray<NSNumber *> *numbers = [NSMutableArray arrayWithCapacity:size];
    for (int index = 0; index < size; index++) {
        [numbers addObject:@(array[index])];
    }
    return [numbers copy];
}

NSArray * NSArrayFromStatusVector(std::vector<sc_type> vector) {
    NSMutableArray<NSNumber *> *numbers = [NSMutableArray arrayWithCapacity:vector.size()];
    for (int index = 0; index < vector.size(); index++) {
        [numbers addObject:@(vector[index])];
    }
    return [numbers copy];
}

NSArray * NSArrayFromItemIDVector(std::vector<t_itemid> vector) {
    NSMutableArray<NSNumber *> *numbers = [NSMutableArray arrayWithCapacity:vector.size()];
    for (int index = 0; index < vector.size(); index++) {
        [numbers addObject:@(vector[index])];
    }
    return [numbers copy];
}

@interface RASkill2 ()

- (instancetype)initWithSkill:(std::shared_ptr<s_skill_db>)skill;

@end

@interface RASkillCopyFlags2 ()

- (instancetype)initWithSkillCopyable:(s_skill_copyable)skill_copyable;

@end

@interface RASkillNoNearNPC2 ()

- (instancetype)initWithSkill:(std::shared_ptr<s_skill_db>)skill;

@end

@interface RASkillRequirement2 ()

- (instancetype)initWithSkillRequirement:(s_skill_require)skill_requirement;

@end

@interface RASkillUnit2 ()

- (instancetype)initWithSkill:(std::shared_ptr<s_skill_db>)skill;

@end

@implementation RASkillDatabase

- (void)fetchSkillsWithCompletionHandler:(void (^)(NSArray<RASkill2 *> *))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSMutableArray<RASkill2 *> *skills = [NSMutableArray arrayWithCapacity:skill_db.size()];
        for (auto entry = skill_db.begin(); entry != skill_db.end(); ++entry) {
            RASkill2 *skill = [[RASkill2 alloc] initWithSkill:entry->second];
            [skills addObject:skill];
        }

        completionHandler([skills copy]);
    });
}

@end

@implementation RASkill2

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
        _element = NSArrayFromElementArray(skill->element, MAX_SKILL_LEVEL);
        _splashArea = NSArrayFromInt32Array(skill->splash, MAX_SKILL_LEVEL);
        _activeInstance = NSArrayFromInt32Array(skill->maxcount, MAX_SKILL_LEVEL);
        _knockback = NSArrayFromInt32Array(skill->blewcount, MAX_SKILL_LEVEL);
        _giveAp = NSArrayFromInt32Array(skill->giveap, MAX_SKILL_LEVEL);
        _skillCopyFlags = [[RASkillCopyFlags2 alloc] initWithSkillCopyable:skill->copyable];
        _noNearNPC = [[RASkillNoNearNPC2 alloc] initWithSkill:skill];
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
        _requires = [[RASkillRequirement2 alloc] initWithSkillRequirement:skill->require];
        _unit = [[RASkillUnit2 alloc] initWithSkill:skill];
        _status = skill->sc;
    }
    return self;
}

@end

@implementation RASkillCopyFlags2

- (instancetype)initWithSkillCopyable:(s_skill_copyable)skill_copyable {
    self = [super init];
    if (self) {
        _skill = skill_copyable.option;
        _removeRequirement = skill_copyable.req_opt;
    }
    return self;
}

@end

@implementation RASkillNoNearNPC2

- (instancetype)initWithSkill:(std::shared_ptr<s_skill_db>)skill {
    self = [super init];
    if (self) {
        _additionalRange = skill->unit_nonearnpc_range;
        _type = skill->unit_nonearnpc_type;
    }
    return self;
}

@end

@implementation RASkillRequirement2

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
        _status = NSArrayFromStatusVector(skill_requirement.status);
        _spiritSphereCost = NSArrayFromInt32Array(skill_requirement.spiritball, MAX_SKILL_LEVEL);
        _itemID = NSArrayFromItemIDArray(skill_requirement.itemid, MAX_SKILL_ITEM_REQUIRE);
        _itemAmount = NSArrayFromInt32Array(skill_requirement.amount, MAX_SKILL_ITEM_REQUIRE);
        _equipment = NSArrayFromItemIDVector(skill_requirement.eqItem);
    }
    return self;
}

@end

@implementation RASkillUnit2

- (instancetype)initWithSkill:(std::shared_ptr<s_skill_db>)skill {
    self = [super init];
    if (self) {
        _skillUnitID = skill->unit_id;
        _alternateSkillUnitID = skill->unit_id2;
        _layout = NSArrayFromInt32Array(skill->unit_layout_type, MAX_SKILL_LEVEL);
        _range = NSArrayFromInt32Array(skill->unit_range, MAX_SKILL_LEVEL);
        _interval = skill->unit_interval;
        _target = skill->unit_target;
        _flag = skill->unit_flag.to_ulong();
    }
    return self;
}

@end
