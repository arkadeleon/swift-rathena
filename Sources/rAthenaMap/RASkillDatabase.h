//
//  RASkillDatabase.h
//  rAthena
//
//  Created by Leon Li on 2023/6/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class RASkill;
@class RASkillCopyFlags;
@class RASkillNoNearNPC;
@class RASkillRequirement;
@class RASkillUnit;

@interface RASkillDatabase : NSObject

- (void)fetchSkillsWithCompletionHandler:(void (^)(NSArray<RASkill *> *skills))completionHandler NS_SWIFT_ASYNC(1);

@end

@interface RASkill : NSObject

/// Unique skill ID.
@property (nonatomic) NSInteger skillID;

/// Skill Aegis name.
@property (nonatomic, copy) NSString *skillName;

/// Skill description.
@property (nonatomic, copy) NSString *skillDescription;

/// Max skill level.
@property (nonatomic) NSInteger maxLevel;

/// Skill type. (Default: BF_NONE)
/// BF_
@property (nonatomic) NSInteger type;

/// Skill target type. (Default: INF_PASSIVE_SKILL)
/// INF_
@property (nonatomic) NSInteger targetType;

/// Skill damage properties.
/// NK_
@property (nonatomic) NSUInteger damageFlags;

/// Skill information flags.
/// INF2_
@property (nonatomic) NSUInteger flags;

/// Skill range. (Default: 0)
@property (nonatomic, copy) NSArray<NSNumber *> *range;

/// Skill hit type. (Default: DMG_NORMAL)
/// DMG_
@property (nonatomic) NSInteger hit;

/// Skill hit count. (Default: 0)
@property (nonatomic, copy) NSArray<NSNumber *> *hitCount;

/// Skill element. (Default: Neutral)
@property (nonatomic, copy) NSArray<NSNumber *> *element;

/// Skill splash area of effect. (Default: 0)
@property (nonatomic, copy) NSArray<NSNumber *> *splashArea;

/// Maximum amount of active skill instances that can be on the ground. (Default: 0)
@property (nonatomic, copy) NSArray<NSNumber *> *activeInstance;

/// Amount of tiles the skill knockbacks.
@property (nonatomic, copy) NSArray<NSNumber *> *knockback;

/// Gives AP on successful skill cast. (Default: 0)
@property (nonatomic, copy) NSArray<NSNumber *> *giveAp;

/// Determines if the skill is copyable.
@property (nonatomic) RASkillCopyFlags *skillCopyFlags;

/// Determines if the skill can be used near a NPC.
@property (nonatomic) RASkillNoNearNPC *noNearNPC;

/// Cancel cast when hit. (Default: false)
@property (nonatomic) BOOL castCancel;

/// Defense reduction rate during skill cast. (Default: 0)
@property (nonatomic) NSInteger castDefenseReduction;

/// Time to cast the skill in milliseconds. (Default: 0)
@property (nonatomic, copy) NSArray<NSNumber *> *castTime;

/// Time the character cannot use skills in milliseconds. (Default: 0)
@property (nonatomic, copy) NSArray<NSNumber *> *afterCastActDelay;

/// Time before the character can move again in milliseconds. (Default: 0)
@property (nonatomic, copy) NSArray<NSNumber *> *afterCastWalkDelay;

/// Duration of the skill in milliseconds. (Default: 0)
@property (nonatomic, copy) NSArray<NSNumber *> *duration1;

/// Duration of the skill in milliseconds. (Default: 0)
@property (nonatomic, copy) NSArray<NSNumber *> *duration2;

/// Time before the character can use the same skill again in milliseconds. (Default: 0)
@property (nonatomic, copy) NSArray<NSNumber *> *cooldown;

/// Time that is fixed during cast of the skill in milliseconds. (Default: 0)
@property (nonatomic, copy) NSArray<NSNumber *> *fixedCastTime;

/// Effects of the skill's cast time.
/// SKILL_CAST_
@property (nonatomic) NSUInteger castTimeFlags;

/// Effects of the skill's delay.
/// SKILL_CAST_
@property (nonatomic) NSUInteger castDelayFlags;

/// List of requirements to cast the skill. (Optional)
@property (nonatomic, nullable) RASkillRequirement *requires;

/// Skill unit values. (Optional)
@property (nonatomic, nullable) RASkillUnit *unit;

/// Status Change that is associated to the skill. (Optional)
/// SC_
@property (nonatomic) NSInteger status;

@end

@interface RASkillCopyFlags : NSObject

/// Type of skill that can copy.
@property (nonatomic) NSUInteger skill;

/// Ability to remove skill cast requirement.
@property (nonatomic) NSUInteger removeRequirement;

@end

@interface RASkillNoNearNPC : NSObject

/// Number of cells from an NPC where the skill can be cast.
@property (nonatomic) NSInteger additionalRange;

/// Type of NPC that will block the skill.
/// SKILL_NONEAR_
@property (nonatomic) NSUInteger type;

@end

@interface RASkillRequirement : NSObject

/// HP required to cast. (Default: 0)
@property (nonatomic, copy) NSArray<NSNumber *> *hpCost;

/// SP required to cast. (Default: 0)
@property (nonatomic, copy) NSArray<NSNumber *> *spCost;

/// AP required to cast. (Default: 0)
@property (nonatomic, copy) NSArray<NSNumber *> *apCost;

/// HP rate required to cast. If positive, uses current HP, else uses Max HP. (Default: 0)
@property (nonatomic, copy) NSArray<NSNumber *> *hpRateCost;

/// SP rate required to cast. If positive, uses current SP, else uses Max SP. (Default: 0)
@property (nonatomic, copy) NSArray<NSNumber *> *spRateCost;

/// AP rate required to cast. If positive, uses current AP, else uses Max AP. (Default: 0)
@property (nonatomic, copy) NSArray<NSNumber *> *apRateCost;

/// Maximum amount of HP to cast the skill. (Default: 0)
@property (nonatomic, copy) NSArray<NSNumber *> *maxHpTrigger;

/// Zeny required to cast. (Default: 0)
@property (nonatomic, copy) NSArray<NSNumber *> *zenyCost;

/// Weapon required to cast. (Default: All)
/// W_
@property (nonatomic) NSUInteger weapon;

/// Ammo required to cast. (Default: None)
/// AMMO_
@property (nonatomic) NSUInteger ammo;

/// Ammo amount required to cast. (Default: 0)
@property (nonatomic, copy) NSArray<NSNumber *> *ammoAmount;

/// Special state required to cast. (Default: None)
/// ST_
@property (nonatomic) NSInteger state;

/// Status change required to cast. (Default: nullptr)
/// SC_
@property (nonatomic, copy) NSArray<NSNumber *> *status;

/// Spirit sphere required to cast. (Default: 0)
@property (nonatomic, copy) NSArray<NSNumber *> *spiritSphereCost;

/// Item ID required to cast. (Default: 0)
@property (nonatomic, copy) NSArray<NSNumber *> *itemID;

/// Item amount required to cast. (Default: 0)
@property (nonatomic, copy) NSArray<NSNumber *> *itemAmount;

/// Equipped item required to cast. (Default: nullptr)
@property (nonatomic, copy) NSArray<NSNumber *> *equipment;

@end

@interface RASkillUnit : NSObject

/// Skill unit ID.
/// UNT_
@property (nonatomic) NSInteger skillUnitID;

/// Alternate skill unit ID. (Default: 0)
/// UNT_
@property (nonatomic) NSInteger alternateSkillUnitID;

/// Skill unit layout. (Default: 0)
@property (nonatomic, copy) NSArray<NSNumber *> *layout;

/// Skill unit range. (Default: 0)
@property (nonatomic, copy) NSArray<NSNumber *> *range;

/// Skill unit interval in milliseconds. (Default: 0)
@property (nonatomic) NSInteger interval;

/// Skill unit target type. (Default: BCT_)
/// BCT_
@property (nonatomic) NSInteger target;

/// Skill unit flags. (Default: None)
/// UF_
@property (nonatomic) NSUInteger flag;

@end

NS_ASSUME_NONNULL_END
