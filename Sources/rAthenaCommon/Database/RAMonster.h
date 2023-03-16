//
//  RAMonster.h
//  rAthena
//
//  Created by Leon Li on 2023/3/13.
//

#import <Foundation/Foundation.h>

@import YYModel;

@class RASize;
@class RARace;
@class RARaceGroup;
@class RAElement;
@class RAMonsterClass;

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, RAMonsterAi) {
    RAMonsterAi01,
    RAMonsterAi02,
    RAMonsterAi03,
    RAMonsterAi04,
    RAMonsterAi05,
    RAMonsterAi06,
    RAMonsterAi07,
    RAMonsterAi08,
    RAMonsterAi09,
    RAMonsterAi10,
    RAMonsterAi11,
    RAMonsterAi12,
    RAMonsterAi13,
    RAMonsterAi17,
    RAMonsterAi19,
    RAMonsterAi20,
    RAMonsterAi21,
    RAMonsterAi24,
    RAMonsterAi25,
    RAMonsterAi26,
    RAMonsterAi27,
};

typedef NS_OPTIONS(NSUInteger, RAMonsterMode) {
    RAMonsterModeCanMove            = 1 << 0,
    RAMonsterModeLooter             = 1 << 1,
    RAMonsterModeAggressive         = 1 << 2,
    RAMonsterModeAssist             = 1 << 3,
    RAMonsterModeCastSensorIdle     = 1 << 4,
    RAMonsterModeNoRandomWalk       = 1 << 5,
    RAMonsterModeNoCast             = 1 << 6,
    RAMonsterModeCanAttack          = 1 << 7,
    RAMonsterModeCastSensorChase    = 1 << 8,
    RAMonsterModeChangeChase        = 1 << 9,
    RAMonsterModeAngry              = 1 << 10,
    RAMonsterModeChangeTargetMelee  = 1 << 11,
    RAMonsterModeChangeTargetChase  = 1 << 12,
    RAMonsterModeTargetWeak         = 1 << 13,
    RAMonsterModeRandomTarget       = 1 << 14,
    RAMonsterModeIgnoreMelee        = 1 << 15,
    RAMonsterModeIgnoreMagic        = 1 << 16,
    RAMonsterModeIgnoreRanged       = 1 << 17,
    RAMonsterModeMvp                = 1 << 18,
    RAMonsterModeIgnoreMisc         = 1 << 19,
    RAMonsterModeKnockBackImmune    = 1 << 20,
    RAMonsterModeTeleportBlock      = 1 << 21,
    RAMonsterModeFixedItemDrop      = 1 << 22,
    RAMonsterModeDetector           = 1 << 23,
    RAMonsterModeStatusImmune       = 1 << 24,
    RAMonsterModeSkillImmune        = 1 << 25,
};

@class RAMonsterDrop;

@interface RAMonster : NSObject <YYModel>

/// Monster ID.
@property (nonatomic) NSInteger monsterID;

/// Server name to reference the monster in scripts and lookups, should use no spaces.
@property (nonatomic, copy) NSString *aegisName;

/// Name in English.
@property (nonatomic, copy) NSString *name;

/// Name in Japanese. (Default: 'Name' value)
@property (nonatomic, copy, nullable) NSString *japaneseName;

/// Level. (Default: 1)
@property (nonatomic) NSInteger level;

/// Total HP. (Default: 1)
@property (nonatomic) NSInteger hp;

/// Total SP. (Default: 1)
@property (nonatomic) NSInteger sp;

/// Base experience gained. (Default: 0)
@property (nonatomic) NSInteger baseExp;

/// Job experience gained. (Default: 0)
@property (nonatomic) NSInteger jobExp;

/// MVP experience gained. (Default: 0)
@property (nonatomic) NSInteger mvpExp;

/// Minimum attack in pre-renewal and base attack in renewal. (Default: 0)
@property (nonatomic) NSInteger attack;

/// Maximum attack in pre-renewal and base magic attack in renewal. (Default: 0)
@property (nonatomic) NSInteger attack2;

/// Physical defense of the monster, reduces melee and ranged physical attack/skill damage. (Default: 0)
@property (nonatomic) NSInteger defense;

/// Magic defense of the monster, reduces magical skill damage. (Default: 0)
@property (nonatomic) NSInteger magicDefense;

/// Physical resistance of the monster, reduces melee and ranged physical attack/skill damage. (Default: 0)
@property (nonatomic) NSInteger resistance;

/// Magic resistance of the monster, reduces magical skill damage. (Default: 0)
@property (nonatomic) NSInteger magicResistance;

/// Strength which affects attack. (Default: 1)
@property (nonatomic) NSInteger strength;

/// Agility which affects flee. (Default: 1)
@property (nonatomic) NSInteger agility;

/// Vitality which affects defense. (Default: 1)
@property (nonatomic) NSInteger vitality;

/// Intelligence which affects magic attack. (Default: 1)
@property (nonatomic) NSInteger intelligence;

/// Dexterity which affects hit rate. (Default: 1)
@property (nonatomic) NSInteger dexterity;

/// Luck which affects perfect dodge/lucky flee/perfect flee/lucky dodge rate. (Default: 1)
@property (nonatomic) NSInteger luck;

/// Attack range. (Default: 0)
@property (nonatomic) NSInteger attackRange;

/// Skill cast range. (Default: 0)
@property (nonatomic) NSInteger skillRange;

/// Chase range. (Default: 0)
@property (nonatomic) NSInteger chaseRange;

/// Size. (Default: Small)
@property (nonatomic) RASize *size;

/// Race. (Default: Formless)
@property (nonatomic) RARace *race;

/// List of secondary groups the monster may be part of. (Optional)
@property (nonatomic, copy, nullable) NSSet<RARaceGroup *> *raceGroups;

/// Element. (Default: Neutral)
@property (nonatomic) RAElement *element;

/// Level of element. (Default: 1)
@property (nonatomic) NSInteger elementLevel;

/// Walk speed. (Default: DEFAULT_WALK_SPEED)
@property (nonatomic) NSInteger walkSpeed;

/// Attack speed. (Default: 0)
@property (nonatomic) NSInteger attackDelay;

/// Attack animation speed. (Default: 0)
@property (nonatomic) NSInteger attackMotion;

/// Damage animation speed. (Default: 0)
@property (nonatomic) NSInteger damageMotion;

/// Rate at which the monster will receive incoming damage. (Default: 100)
@property (nonatomic) NSInteger damageTaken;

/// Aegis monster type AI behavior. (Default: 06)
@property (nonatomic) RAMonsterAi ai;

/// Aegis monster class. (Default: Normal)
@property (nonatomic) RAMonsterClass *monsterClass;

/// List of unique behavior not defined by AI, Class, or Attribute. (Optional)
@property (nonatomic) RAMonsterMode modes;

/// List of possible MVP prize items. Max of MAX_MVP_DROP. (Optional)
@property (nonatomic, copy, nullable) NSArray<RAMonsterDrop *> *mvpDrops;

/// List of possible normal item drops. Max of MAX_MOB_DROP. (Optional)
@property (nonatomic, copy, nullable) NSArray<RAMonsterDrop *> *drops;

@end

@interface RAMonsterDrop : NSObject <YYModel>

/// Item name.
@property (nonatomic, copy) NSString *item;

/// Drop rate of item.
@property (nonatomic) NSInteger rate;

/// If the item is shielded from TF_STEAL. (Default: false)
@property (nonatomic) BOOL stealProtected;

/// Random Option Group applied to item on drop. (Default: None)
@property (nonatomic, copy, nullable) NSString *randomOptionGroup;

/// Index used for overwriting item. (Optional)
@property (nonatomic) NSNumber *index;

@end

NS_ASSUME_NONNULL_END
