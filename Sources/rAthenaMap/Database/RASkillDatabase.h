//
//  RASkillDatabase.h
//  rAthena
//
//  Created by Leon Li on 2023/6/27.
//

#import <Foundation/Foundation.h>

@import rAthenaCommon;

NS_ASSUME_NONNULL_BEGIN

@class RASkill;
@class RASkillCopyFlags;
@class RASkillNoNearNPC;
@class RASkillRequirement;
@class RASkillUnit;

@interface RASkillDatabase : RADatabase

@property (nonatomic, class, readonly) RASkillDatabase *sharedDatabase;

- (void)loadWithCompletionHandler:(void (^)(NSArray<RASkill *> *skills))completionHandler;

@end

@interface RASkill : RADatabaseRecord

/// Unique skill ID.
@property (nonatomic) NSInteger skillID;

/// Skill Aegis name.
@property (nonatomic, copy) NSString *skillName;

/// Skill description.
@property (nonatomic, copy) NSString *skillDescription;

/// Max skill level.
@property (nonatomic) NSInteger maxLevel;

/// Skill type.
///
/// @discussion See enum @c e_battle_flag in battle.hpp
@property (nonatomic) NSInteger type;

/// Skill target type.
///
/// @discussion See enum @c e_skill_inf in skill.hpp
@property (nonatomic) NSInteger targetType;

/// Skill damage properties.
///
/// @discussion See enum @c e_skill_nk in skill.hpp
@property (nonatomic) NSUInteger damageFlags;

/// Skill information flags.
///
/// @discussion See enum @c e_skill_inf2 in skill.hpp
@property (nonatomic) NSUInteger flags;

/// Skill range.
@property (nonatomic, copy) NSArray<NSNumber *> *range;

/// Skill hit type.
///
/// @discussion See enum @c e_damage_type in clif.hpp
@property (nonatomic) NSInteger hit;

/// Skill hit count.
@property (nonatomic, copy) NSArray<NSNumber *> *hitCount;

/// Skill element.
///
/// @discussion See enum @c e_element in map.hpp
@property (nonatomic, copy) NSArray<NSNumber *> *element;

/// Skill splash area of effect.
@property (nonatomic, copy) NSArray<NSNumber *> *splashArea;

/// Maximum amount of active skill instances that can be on the ground.
@property (nonatomic, copy) NSArray<NSNumber *> *activeInstance;

/// Amount of tiles the skill knockbacks.
@property (nonatomic, copy) NSArray<NSNumber *> *knockback;

/// Gives AP on successful skill cast.
@property (nonatomic, copy) NSArray<NSNumber *> *giveAp;

/// Determines if the skill is copyable.
@property (nonatomic) RASkillCopyFlags *skillCopyFlags;

/// Determines if the skill can be used near a NPC.
@property (nonatomic) RASkillNoNearNPC *noNearNPC;

/// Cancel cast when hit.
@property (nonatomic) BOOL castCancel;

/// Defense reduction rate during skill cast.
@property (nonatomic) NSInteger castDefenseReduction;

/// Time to cast the skill in milliseconds.
@property (nonatomic, copy) NSArray<NSNumber *> *castTime;

/// Time the character cannot use skills in milliseconds.
@property (nonatomic, copy) NSArray<NSNumber *> *afterCastActDelay;

/// Time before the character can move again in milliseconds.
@property (nonatomic, copy) NSArray<NSNumber *> *afterCastWalkDelay;

/// Duration of the skill in milliseconds.
@property (nonatomic, copy) NSArray<NSNumber *> *duration1;

/// Duration of the skill in milliseconds.
@property (nonatomic, copy) NSArray<NSNumber *> *duration2;

/// Time before the character can use the same skill again in milliseconds.
@property (nonatomic, copy) NSArray<NSNumber *> *cooldown;

/// Time that is fixed during cast of the skill in milliseconds.
@property (nonatomic, copy) NSArray<NSNumber *> *fixedCastTime;

/// Effects of the skill's cast time.
///
/// @discussion See enum @c e_skill_cast_flags in skill.hpp
@property (nonatomic) NSUInteger castTimeFlags;

/// Effects of the skill's delay.
///
/// @discussion See enum @c e_skill_cast_flags in skill.hpp
@property (nonatomic) NSUInteger castDelayFlags;

/// List of requirements to cast the skill.
@property (nonatomic) RASkillRequirement *requirement;

/// Skill unit values.
@property (nonatomic) RASkillUnit *unit;

/// Status Change that is associated to the skill.
///
/// @discussion See enum @c sc_type in status.hpp
@property (nonatomic) NSInteger status;

@end

@interface RASkillCopyFlags : NSObject

/// Type of skill that can copy.
///
/// @discussion See enum @c e_skill_copyable_option in skill.hpp
@property (nonatomic) NSUInteger skill;

/// Ability to remove skill cast requirement.
///
/// @discussion See enum @c e_skill_require in skill.hpp
@property (nonatomic) NSUInteger removeRequirement;

@end

@interface RASkillNoNearNPC : NSObject

/// Number of cells from an NPC where the skill can be cast.
@property (nonatomic) NSInteger additionalRange;

/// Type of NPC that will block the skill.
///
/// @discussion See enum @c e_skill_nonear_npc in skill.hpp
@property (nonatomic) NSUInteger type;

@end

@interface RASkillRequirement : NSObject

/// HP required to cast.
@property (nonatomic, copy) NSArray<NSNumber *> *hpCost;

/// SP required to cast.
@property (nonatomic, copy) NSArray<NSNumber *> *spCost;

/// AP required to cast.
@property (nonatomic, copy) NSArray<NSNumber *> *apCost;

/// HP rate required to cast. If positive, uses current HP, else uses Max HP.
@property (nonatomic, copy) NSArray<NSNumber *> *hpRateCost;

/// SP rate required to cast. If positive, uses current SP, else uses Max SP.
@property (nonatomic, copy) NSArray<NSNumber *> *spRateCost;

/// AP rate required to cast. If positive, uses current AP, else uses Max AP.
@property (nonatomic, copy) NSArray<NSNumber *> *apRateCost;

/// Maximum amount of HP to cast the skill.
@property (nonatomic, copy) NSArray<NSNumber *> *maxHpTrigger;

/// Zeny required to cast.
@property (nonatomic, copy) NSArray<NSNumber *> *zenyCost;

/// Weapon required to cast.
///
/// @discussion See enum @c weapon_type in pc.hpp
@property (nonatomic) NSUInteger weapon;

/// Ammo required to cast.
///
/// @discussion See enum @c e_ammo_type in pc.hpp
@property (nonatomic) NSUInteger ammo;

/// Ammo amount required to cast.
@property (nonatomic, copy) NSArray<NSNumber *> *ammoAmount;

/// Special state required to cast.
///
/// @discussion See enum @c e_require_state in skill.hpp
@property (nonatomic) NSInteger state;

/// Status change required to cast.
///
/// @discussion See enum @c sc_type in status.hpp
@property (nonatomic, copy) NSArray<NSNumber *> *status;

/// Spirit sphere required to cast.
@property (nonatomic, copy) NSArray<NSNumber *> *spiritSphereCost;

/// Item ID required to cast.
@property (nonatomic, copy) NSArray<NSNumber *> *itemID;

/// Item amount required to cast.
@property (nonatomic, copy) NSArray<NSNumber *> *itemAmount;

/// Equipped item required to cast.
@property (nonatomic, copy) NSArray<NSNumber *> *equipment;

@end

@interface RASkillUnit : NSObject

/// Skill unit ID.
///
/// @discussion See enum @c e_skill_unit_id in skill.hpp
@property (nonatomic) NSInteger skillUnitID;

/// Alternate skill unit ID.
///
/// @discussion See enum @c e_skill_unit_id in skill.hpp
@property (nonatomic) NSInteger alternateSkillUnitID;

/// Skill unit layout.
@property (nonatomic, copy) NSArray<NSNumber *> *layout;

/// Skill unit range.
@property (nonatomic, copy) NSArray<NSNumber *> *range;

/// Skill unit interval in milliseconds.
@property (nonatomic) NSInteger interval;

/// Skill unit target type.
///
/// @discussion See enum @c e_battle_check_target in battle.hpp
@property (nonatomic) NSInteger target;

/// Skill unit flags.
///
/// @discussion See enum @c e_skill_unit_flag in skill.hpp
@property (nonatomic) NSUInteger flags;

@end

NS_ASSUME_NONNULL_END
