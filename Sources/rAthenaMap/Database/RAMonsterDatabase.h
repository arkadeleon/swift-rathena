//
//  RAMonsterDatabase.h
//  rAthena
//
//  Created by Leon Li on 2023/6/27.
//

#import <Foundation/Foundation.h>

@import rAthenaCommon;

NS_ASSUME_NONNULL_BEGIN

@class RAMonster;
@class RAMonsterDrop;

@interface RAMonsterDatabase : RADatabase<RAMonster *>

@property (nonatomic, class, readonly) RAMonsterDatabase *sharedDatabase;

@end

@interface RAMonster : NSObject

/// Monster ID.
@property (nonatomic) NSInteger monsterID;

/// Server name to reference the monster in scripts and lookups, should use no spaces.
@property (nonatomic, copy) NSString *aegisName;

/// Name in English.
@property (nonatomic, copy) NSString *name;

/// Name in Japanese.
@property (nonatomic, copy) NSString *japaneseName;

/// Level.
@property (nonatomic) NSInteger level;

/// Total HP.
@property (nonatomic) NSInteger hp;

/// Total SP.
@property (nonatomic) NSInteger sp;

/// Base experience gained.
@property (nonatomic) NSInteger baseExp;

/// Job experience gained.
@property (nonatomic) NSInteger jobExp;

/// MVP experience gained.
@property (nonatomic) NSInteger mvpExp;

/// Minimum attack in pre-renewal and base attack in renewal.
@property (nonatomic) NSInteger attack;

/// Maximum attack in pre-renewal and base magic attack in renewal.
@property (nonatomic) NSInteger attack2;

/// Physical defense of the monster, reduces melee and ranged physical attack/skill damage.
@property (nonatomic) NSInteger defense;

/// Magic defense of the monster, reduces magical skill damage.
@property (nonatomic) NSInteger magicDefense;

/// Physical resistance of the monster, reduces melee and ranged physical attack/skill damage.
@property (nonatomic) NSInteger resistance;

/// Magic resistance of the monster, reduces magical skill damage.
@property (nonatomic) NSInteger magicResistance;

/// Strength which affects attack.
@property (nonatomic) NSInteger strength;

/// Agility which affects flee.
@property (nonatomic) NSInteger agility;

/// Vitality which affects defense.
@property (nonatomic) NSInteger vitality;

/// Intelligence which affects magic attack.
@property (nonatomic) NSInteger intelligence;

/// Dexterity which affects hit rate.
@property (nonatomic) NSInteger dexterity;

/// Luck which affects perfect dodge/lucky flee/perfect flee/lucky dodge rate.
@property (nonatomic) NSInteger luck;

/// Attack range.
@property (nonatomic) NSInteger attackRange;

/// Skill cast range.
@property (nonatomic) NSInteger skillRange;

/// Chase range.
@property (nonatomic) NSInteger chaseRange;

/// Size.
///
/// @discussion See enum @c e_size in mob.hpp
@property (nonatomic) NSInteger size;

/// Race.
///
/// @discussion See enum @c e_race in map.hpp
@property (nonatomic) NSInteger race;

/// List of secondary groups the monster may be part of.
///
/// @discussion See enum @c e_race2 in map.hpp
@property (nonatomic, copy) NSArray<NSNumber *> *raceGroups;

/// Element.
///
/// @discussion See enum @c e_element in map.hpp
@property (nonatomic) NSInteger element;

/// Level of element.
@property (nonatomic) NSInteger elementLevel;

/// Walk speed.
@property (nonatomic) NSInteger walkSpeed;

/// Attack speed.
@property (nonatomic) NSInteger attackDelay;

/// Attack animation speed.
@property (nonatomic) NSInteger attackMotion;

/// Damage animation speed.
@property (nonatomic) NSInteger damageMotion;

/// Rate at which the monster will receive incoming damage.
@property (nonatomic) NSInteger damageTaken;

/// Aegis monster class.
///
/// @discussion See enum @c e_aegis_monsterclass in mob.hpp
@property (nonatomic) NSInteger monsterClass;

/// List of unique behavior not defined by AI, Class, or Attribute.
///
/// @discussion See enum @c e_aegis_monstertype in mob.hpp
/// @discussion See enum @c e_mode in mmo.hpp
@property (nonatomic) NSUInteger modes;

/// List of possible MVP prize items. Max of @c MAX_MVP_DROP.
@property (nonatomic, copy) NSArray<RAMonsterDrop *> *mvpDrops;

/// List of possible normal item drops. Max of @c MAX_MOB_DROP.
@property (nonatomic, copy) NSArray<RAMonsterDrop *> *drops;

@end

@interface RAMonsterDrop : NSObject

/// Item ID.
@property (nonatomic) NSInteger itemID;

/// Drop rate of item.
@property (nonatomic) NSInteger rate;

/// If the item is shielded from @c TF_STEAL.
@property (nonatomic) BOOL stealProtected;

/// Random Option Group ID applied to item on drop.
@property (nonatomic) NSInteger randomOptionGroupID;

@end

NS_ASSUME_NONNULL_END
