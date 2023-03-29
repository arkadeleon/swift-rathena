//
//  RASkill.h
//  rAthena
//
//  Created by Leon Li on 2023/3/21.
//

#import <Foundation/Foundation.h>

@import YYModel;

NS_ASSUME_NONNULL_BEGIN

@class RASkillType;
@class RASkillTargetType;
@class RASkillDamageFlag;
@class RASkillFlag;
@class RASkillHitType;
@class RAElement;
@class RAWeaponType;
@class RAAmmoType;

@class RASkillRequirement;
@class RASkillUnit;
@class RASkillLevelSpecificSize;
@class RASkillLevelSpecificCount;
@class RASkillLevelSpecificElement;
@class RASkillLevelSpecificArea;
@class RASkillLevelSpecificMaxAmount;
@class RASkillLevelSpecificAmount;
@class RASkillLevelSpecificTime;
@class RASkillLevelSpecificItem;

@interface RASkill : NSObject <YYModel>

/// Unique skill ID.
@property (nonatomic) NSInteger skillID;

/// Skill Aegis name.
@property (nonatomic, copy) NSString *skillName;

/// Skill description.
@property (nonatomic, copy) NSString *skillDescription;

/// Max skill level.
@property (nonatomic) NSInteger maxLevel;

/// Skill type. (Default: None)
@property (nonatomic) RASkillType *type;

/// Skill target type. (Default: Passive)
@property (nonatomic) RASkillTargetType *targetType;

/// Skill damage properties.
@property (nonatomic, copy) NSSet<RASkillDamageFlag *> *damageFlags;

/// Skill information flags.
@property (nonatomic, copy) NSSet<RASkillFlag *> *flags;

/// Skill range. (Default: 0)
@property (nonatomic, copy, nullable) NSArray<RASkillLevelSpecificSize *> *range;

/// Skill hit type. (Default: Normal)
@property (nonatomic) RASkillHitType *hit;

/// Skill hit count. (Default: 0)
@property (nonatomic, copy, nullable) NSArray<RASkillLevelSpecificCount *> *hitCount;

/// Skill element. (Default: Neutral)
@property (nonatomic, copy, nullable) NSArray<RASkillLevelSpecificElement *> *element;

/// Skill splash area of effect. (Default: 0)
@property (nonatomic, copy, nullable) NSArray<RASkillLevelSpecificArea *> *splashArea;

/// Maximum amount of active skill instances that can be on the ground. (Default: 0)
@property (nonatomic, copy, nullable) NSArray<RASkillLevelSpecificMaxAmount *> *activeInstance;

/// Amount of tiles the skill knockbacks.
@property (nonatomic, copy, nullable) NSArray<RASkillLevelSpecificAmount *> *knockback;

/// Gives AP on successful skill cast. (Default: 0)
@property (nonatomic, copy, nullable) NSArray<RASkillLevelSpecificAmount *> *giveAp;

/// Determines if the skill is copyable. (Optional)
//@property (nonatomic, nullable) RASkillCopyFlags *copyFlags;

/// Determines if the skill can be used near a NPC. (Optional)
//@property (nonatomic, nullable) RASkillNoNearNPC *noNearNPC;

/// Cancel cast when hit. (Default: false)
@property (nonatomic) BOOL castCancel;

/// Defense reduction rate during skill cast. (Default: 0)
@property (nonatomic) NSInteger castDefenseReduction;

/// Time to cast the skill in milliseconds. (Default: 0)
@property (nonatomic, copy, nullable) NSArray<RASkillLevelSpecificTime *> *castTime;

/// Time the character cannot use skills in milliseconds. (Default: 0)
@property (nonatomic, copy, nullable) NSArray<RASkillLevelSpecificTime *> *afterCastActDelay;

/// Time before the character can move again in milliseconds. (Default: 0)
@property (nonatomic, copy, nullable) NSArray<RASkillLevelSpecificTime *> *afterCastWalkDelay;

/// Duration of the skill in milliseconds. (Default: 0)
@property (nonatomic, copy, nullable) NSArray<RASkillLevelSpecificTime *> *duration1;

/// Duration of the skill in milliseconds. (Default: 0)
@property (nonatomic, copy, nullable) NSArray<RASkillLevelSpecificTime *> *duration2;

/// Time before the character can use the same skill again in milliseconds. (Default: 0)
@property (nonatomic, copy, nullable) NSArray<RASkillLevelSpecificTime *> *cooldown;

/// Time that is fixed during cast of the skill in milliseconds. (Default: 0)
@property (nonatomic, copy, nullable) NSArray<RASkillLevelSpecificTime *> *fixedCastTime;

/// Effects of the skill's cast time. (Optional)
//@property (nonatomic, copy, nullable) NSSet<RASkillCastTimeFlag *> *castTimeFlags;

/// Effects of the skill's delay. (Optional)
//@property (nonatomic, copy, nullable) NSSet<RASkillCastDelayFlag *> *castDelayFlags;

/// List of requirements to cast the skill. (Optional)
@property (nonatomic, nullable) RASkillRequirement *requires;

/// Skill unit values. (Optional)
@property (nonatomic, nullable) RASkillUnit *unit;

/// Status Change that is associated to the skill. (Optional)
//@property (nonatomic, nullable) RAStatusChange *status;

@end

@interface RASkillRequirement : NSObject <YYModel>

/// HP required to cast. (Default: 0)
@property (nonatomic, copy, nullable) NSArray<RASkillLevelSpecificAmount *> *hpCost;

/// SP required to cast. (Default: 0)
@property (nonatomic, copy, nullable) NSArray<RASkillLevelSpecificAmount *> *spCost;

/// AP required to cast. (Default: 0)
@property (nonatomic, copy, nullable) NSArray<RASkillLevelSpecificAmount *> *apCost;

/// HP rate required to cast. If positive, uses current HP, else uses Max HP. (Default: 0)
@property (nonatomic, copy, nullable) NSArray<RASkillLevelSpecificAmount *> *hpRateCost;

/// SP rate required to cast. If positive, uses current SP, else uses Max SP. (Default: 0)
@property (nonatomic, copy, nullable) NSArray<RASkillLevelSpecificAmount *> *spRateCost;

/// AP rate required to cast. If positive, uses current AP, else uses Max AP. (Default: 0)
@property (nonatomic, copy, nullable) NSArray<RASkillLevelSpecificAmount *> *apRateCost;

/// Maximum amount of HP to cast the skill. (Default: 0)
@property (nonatomic, copy, nullable) NSArray<RASkillLevelSpecificAmount *> *maxHpTrigger;

/// Zeny required to cast. (Default: 0)
@property (nonatomic, copy, nullable) NSArray<RASkillLevelSpecificAmount *> *zenyCost;

/// Weapon required to cast. (Default: All)
@property (nonatomic, copy) NSSet<RAWeaponType *> *weapon;

/// Ammo required to cast. (Default: None)
@property (nonatomic, copy) NSSet<RAAmmoType *> *ammo;

/// Ammo amount required to cast. (Default: 0)
@property (nonatomic, copy, nullable) NSArray<RASkillLevelSpecificAmount *> *ammoAmount;

/// Special state required to cast. (Default: None)
//@property (nonatomic) RASkillStateRequirement *state;

/// Status change required to cast. (Default: nullptr)
//@property (nonatomic, nullable) RAStatusChange *status;

/// Spirit sphere required to cast. (Default: 0)
@property (nonatomic, copy, nullable) NSArray<RASkillLevelSpecificAmount *> *spiritSphereCost;

/// Item required to cast. (Default: 0)
@property (nonatomic, copy, nullable) NSArray<RASkillLevelSpecificItem *> *itemCost;

/// Equipped item required to cast. (Default: nullptr)
@property (nonatomic, copy, nullable) NSSet<NSString *> *equipment;

@end

@interface RASkillUnit : NSObject <YYModel>

/// Skill unit ID.
@property (nonatomic, copy) NSString *skillUnitID;

/// Alternate skill unit ID. (Default: 0)
@property (nonatomic, copy, nullable) NSString *alternateSkillUnitID;

/// Skill unit layout. (Default: 0)
@property (nonatomic, copy, nullable) NSArray<RASkillLevelSpecificSize *> *layout;

/// Skill unit range. (Default: 0)
@property (nonatomic, copy, nullable) NSArray<RASkillLevelSpecificSize *> *range;

/// Skill unit interval in milliseconds. (Default: 0)
@property (nonatomic) NSInteger interval;

/// Skill unit target type. (Default: All)
//@property (nonatomic) RASkillUnitTargetType *target;

/// Skill unit flags. (Default: None)
//@property (nonatomic, copy, nullable) NSSet<RASkillUnitFlag *> *flag;

@end

@interface RASkillLevelSpecificSize : NSObject <YYModel>

/// Skill level.
@property (nonatomic) NSInteger level;

/// Size at specific skill level.
@property (nonatomic) NSInteger size;

@end

@interface RASkillLevelSpecificCount : NSObject <YYModel>

/// Skill level.
@property (nonatomic) NSInteger level;

/// Count at specific skill level.
@property (nonatomic) NSInteger count;

@end

@interface RASkillLevelSpecificElement : NSObject <YYModel>

/// Skill level.
@property (nonatomic) NSInteger level;

/// Element at specific skill level.
@property (nonatomic) RAElement *element;

@end

@interface RASkillLevelSpecificArea : NSObject <YYModel>

/// Skill level.
@property (nonatomic) NSInteger level;

/// Area at specific skill level.
@property (nonatomic) NSInteger area;

@end

@interface RASkillLevelSpecificMaxAmount : NSObject <YYModel>

/// Skill level.
@property (nonatomic) NSInteger level;

/// Max amount at specific skill level.
@property (nonatomic) NSInteger max;

@end

@interface RASkillLevelSpecificAmount : NSObject <YYModel>

/// Skill level.
@property (nonatomic) NSInteger level;

/// Amount at specific skill level.
@property (nonatomic) NSInteger amount;

@end

@interface RASkillLevelSpecificTime : NSObject <YYModel>

/// Skill level.
@property (nonatomic) NSInteger level;

/// Time at specific skill level in milliseconds.
@property (nonatomic) NSInteger time;

@end

@interface RASkillLevelSpecificItem : NSObject <YYModel>

/// Item name.
@property (nonatomic, copy) NSString *item;

/// Item amount.
@property (nonatomic) NSInteger amount;

/// Skill level. Makes the skill item check become level dependent if supplied. (Default: applies to all levels)
@property (nonatomic) NSInteger level;

@end

NS_ASSUME_NONNULL_END
