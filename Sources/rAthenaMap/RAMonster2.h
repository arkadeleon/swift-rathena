//
//  RAMonster2.h
//  rAthena
//
//  Created by Leon Li on 2023/3/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class RAMonsterDrop2;

@interface RAMonster2 : NSObject

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
@property (nonatomic) NSInteger size;

/// Race. (Default: Formless)
@property (nonatomic) NSInteger race;

/// List of secondary groups the monster may be part of. (Optional)
@property (nonatomic) NSInteger raceGroups;

/// Element. (Default: Neutral)
@property (nonatomic) NSInteger element;

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

/// Aegis monster class. (Default: Normal)
@property (nonatomic) NSInteger monsterClass;

/// List of unique behavior not defined by AI, Class, or Attribute. (Optional)
@property (nonatomic) NSUInteger modes;

/// List of possible MVP prize items. Max of MAX_MVP_DROP. (Optional)
@property (nonatomic, copy) NSArray<RAMonsterDrop2 *> *mvpDrops;

/// List of possible normal item drops. Max of MAX_MOB_DROP. (Optional)
@property (nonatomic, copy) NSArray<RAMonsterDrop2 *> *drops;

@end

@interface RAMonsterDrop2 : NSObject

/// Item ID.
@property (nonatomic) NSInteger itemID;

/// Drop rate of item.
@property (nonatomic) NSInteger rate;

/// If the item is shielded from TF_STEAL. (Default: false)
@property (nonatomic) BOOL stealProtected;

/// Random Option Group applied to item on drop. (Default: None)
@property (nonatomic) NSInteger randomOptionGroup;

@end

NS_ASSUME_NONNULL_END
