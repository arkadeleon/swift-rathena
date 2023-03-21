//
//  RAJob.h
//  rAthena
//
//  Created by Leon Li on 2023/3/8.
//

#import <Foundation/Foundation.h>
#import "RAEnum.h"

NS_ASSUME_NONNULL_BEGIN

@interface RAJob : RAEnum

@property (nonatomic, class, readonly) RAJob *novice;
@property (nonatomic, class, readonly) RAJob *swordman;
@property (nonatomic, class, readonly) RAJob *magician;
@property (nonatomic, class, readonly) RAJob *archer;
@property (nonatomic, class, readonly) RAJob *acolyte;
@property (nonatomic, class, readonly) RAJob *merchant;
@property (nonatomic, class, readonly) RAJob *thief;
@property (nonatomic, class, readonly) RAJob *knight;
@property (nonatomic, class, readonly) RAJob *priest;
@property (nonatomic, class, readonly) RAJob *wizard;
@property (nonatomic, class, readonly) RAJob *blacksmith;
@property (nonatomic, class, readonly) RAJob *hunter;
@property (nonatomic, class, readonly) RAJob *assassin;
@property (nonatomic, class, readonly) RAJob *knight2;
@property (nonatomic, class, readonly) RAJob *crusader;
@property (nonatomic, class, readonly) RAJob *monk;
@property (nonatomic, class, readonly) RAJob *sage;
@property (nonatomic, class, readonly) RAJob *rogue;
@property (nonatomic, class, readonly) RAJob *alchemist;
@property (nonatomic, class, readonly) RAJob *bard;
@property (nonatomic, class, readonly) RAJob *dancer;
@property (nonatomic, class, readonly) RAJob *crusader2;
@property (nonatomic, class, readonly) RAJob *wedding;
@property (nonatomic, class, readonly) RAJob *superNovice;
@property (nonatomic, class, readonly) RAJob *gunslinger;
@property (nonatomic, class, readonly) RAJob *ninja;
@property (nonatomic, class, readonly) RAJob *christmas;
@property (nonatomic, class, readonly) RAJob *summer;
@property (nonatomic, class, readonly) RAJob *hanbok;
@property (nonatomic, class, readonly) RAJob *oktoberfest;
@property (nonatomic, class, readonly) RAJob *summer2;

@property (nonatomic, class, readonly) RAJob *highNovice;
@property (nonatomic, class, readonly) RAJob *highSwordman;
@property (nonatomic, class, readonly) RAJob *highMagician;
@property (nonatomic, class, readonly) RAJob *highArcher;
@property (nonatomic, class, readonly) RAJob *highAcolyte;
@property (nonatomic, class, readonly) RAJob *highMerchant;
@property (nonatomic, class, readonly) RAJob *highThief;
@property (nonatomic, class, readonly) RAJob *lordKnight;
@property (nonatomic, class, readonly) RAJob *highPriest;
@property (nonatomic, class, readonly) RAJob *highWizard;
@property (nonatomic, class, readonly) RAJob *whitesmith;
@property (nonatomic, class, readonly) RAJob *sniper;
@property (nonatomic, class, readonly) RAJob *assassinCross;
@property (nonatomic, class, readonly) RAJob *lordKnight2;
@property (nonatomic, class, readonly) RAJob *paladin;
@property (nonatomic, class, readonly) RAJob *champion;
@property (nonatomic, class, readonly) RAJob *professor;
@property (nonatomic, class, readonly) RAJob *stalker;
@property (nonatomic, class, readonly) RAJob *creator;
@property (nonatomic, class, readonly) RAJob *clown;
@property (nonatomic, class, readonly) RAJob *gypsy;
@property (nonatomic, class, readonly) RAJob *paladin2;

@property (nonatomic, class, readonly) RAJob *babyNovice;
@property (nonatomic, class, readonly) RAJob *babySwordman;
@property (nonatomic, class, readonly) RAJob *babyMagician;
@property (nonatomic, class, readonly) RAJob *babyArcher;
@property (nonatomic, class, readonly) RAJob *babyAcolyte;
@property (nonatomic, class, readonly) RAJob *babyMerchant;
@property (nonatomic, class, readonly) RAJob *babyThief;
@property (nonatomic, class, readonly) RAJob *babyKnight;
@property (nonatomic, class, readonly) RAJob *babyPriest;
@property (nonatomic, class, readonly) RAJob *babyWizard;
@property (nonatomic, class, readonly) RAJob *babyBlacksmith;
@property (nonatomic, class, readonly) RAJob *babyHunter;
@property (nonatomic, class, readonly) RAJob *babyAssassin;
@property (nonatomic, class, readonly) RAJob *babyKnight2;
@property (nonatomic, class, readonly) RAJob *babyCrusader;
@property (nonatomic, class, readonly) RAJob *babyMonk;
@property (nonatomic, class, readonly) RAJob *babySage;
@property (nonatomic, class, readonly) RAJob *babyRogue;
@property (nonatomic, class, readonly) RAJob *babyAlchemist;
@property (nonatomic, class, readonly) RAJob *babyBard;
@property (nonatomic, class, readonly) RAJob *babyDancer;
@property (nonatomic, class, readonly) RAJob *babyCrusader2;
@property (nonatomic, class, readonly) RAJob *superBaby;

@property (nonatomic, class, readonly) RAJob *taekwon;
@property (nonatomic, class, readonly) RAJob *starGladiator;
@property (nonatomic, class, readonly) RAJob *starGladiator2;
@property (nonatomic, class, readonly) RAJob *soulLinker;

@property (nonatomic, class, readonly) RAJob *gangsi;
@property (nonatomic, class, readonly) RAJob *deathKnight;
@property (nonatomic, class, readonly) RAJob *darkCollector;

@property (nonatomic, class, readonly) RAJob *runeKnight;
@property (nonatomic, class, readonly) RAJob *warlock;
@property (nonatomic, class, readonly) RAJob *ranger;
@property (nonatomic, class, readonly) RAJob *archBishop;
@property (nonatomic, class, readonly) RAJob *mechanic;
@property (nonatomic, class, readonly) RAJob *guillotineCross;

@property (nonatomic, class, readonly) RAJob *runeKnightT;
@property (nonatomic, class, readonly) RAJob *warlockT;
@property (nonatomic, class, readonly) RAJob *rangerT;
@property (nonatomic, class, readonly) RAJob *archBishopT;
@property (nonatomic, class, readonly) RAJob *mechanicT;
@property (nonatomic, class, readonly) RAJob *guillotineCrossT;

@property (nonatomic, class, readonly) RAJob *royalGuard;
@property (nonatomic, class, readonly) RAJob *sorcerer;
@property (nonatomic, class, readonly) RAJob *minstrel;
@property (nonatomic, class, readonly) RAJob *wanderer;
@property (nonatomic, class, readonly) RAJob *sura;
@property (nonatomic, class, readonly) RAJob *genetic;
@property (nonatomic, class, readonly) RAJob *shadowChaser;

@property (nonatomic, class, readonly) RAJob *royalGuardT;
@property (nonatomic, class, readonly) RAJob *sorcererT;
@property (nonatomic, class, readonly) RAJob *minstrelT;
@property (nonatomic, class, readonly) RAJob *wandererT;
@property (nonatomic, class, readonly) RAJob *suraT;
@property (nonatomic, class, readonly) RAJob *geneticT;
@property (nonatomic, class, readonly) RAJob *shadowChaserT;

@property (nonatomic, class, readonly) RAJob *runeKnight2;
@property (nonatomic, class, readonly) RAJob *runeKnightT2;
@property (nonatomic, class, readonly) RAJob *royalGuard2;
@property (nonatomic, class, readonly) RAJob *royalGuardT2;
@property (nonatomic, class, readonly) RAJob *ranger2;
@property (nonatomic, class, readonly) RAJob *rangerT2;
@property (nonatomic, class, readonly) RAJob *mechanic2;
@property (nonatomic, class, readonly) RAJob *mechanicT2;

@property (nonatomic, class, readonly) RAJob *babyRuneKnight;
@property (nonatomic, class, readonly) RAJob *babyWarlock;
@property (nonatomic, class, readonly) RAJob *babyRanger;
@property (nonatomic, class, readonly) RAJob *babyArchBishop;
@property (nonatomic, class, readonly) RAJob *babyMechanic;
@property (nonatomic, class, readonly) RAJob *babyGuillotineCross;
@property (nonatomic, class, readonly) RAJob *babyRoyalGuard;
@property (nonatomic, class, readonly) RAJob *babySorcerer;
@property (nonatomic, class, readonly) RAJob *babyMinstrel;
@property (nonatomic, class, readonly) RAJob *babyWanderer;
@property (nonatomic, class, readonly) RAJob *babySura;
@property (nonatomic, class, readonly) RAJob *babyGenetic;
@property (nonatomic, class, readonly) RAJob *babyShadowChaser;

@property (nonatomic, class, readonly) RAJob *babyRuneKnight2;
@property (nonatomic, class, readonly) RAJob *babyRoyalGuard2;
@property (nonatomic, class, readonly) RAJob *babyRanger2;
@property (nonatomic, class, readonly) RAJob *babyMechanic2;

@property (nonatomic, class, readonly) RAJob *expandedSuperNovice;
@property (nonatomic, class, readonly) RAJob *expandedSuperBaby;

@property (nonatomic, class, readonly) RAJob *kagerou;
@property (nonatomic, class, readonly) RAJob *oboro;

@property (nonatomic, class, readonly) RAJob *rebellion;

@property (nonatomic, class, readonly) RAJob *summoner;

@property (nonatomic, class, readonly) RAJob *babySummoner;

@property (nonatomic, class, readonly) RAJob *babyNinja;
@property (nonatomic, class, readonly) RAJob *babyKagerou;
@property (nonatomic, class, readonly) RAJob *babyOboro;
@property (nonatomic, class, readonly) RAJob *babyTaekwon;
@property (nonatomic, class, readonly) RAJob *babyStarGladiator;
@property (nonatomic, class, readonly) RAJob *babySoulLinker;
@property (nonatomic, class, readonly) RAJob *babyGunslinger;
@property (nonatomic, class, readonly) RAJob *babyRebellion;

@property (nonatomic, class, readonly) RAJob *babyStarGladiator2;

@property (nonatomic, class, readonly) RAJob *starEmperor;
@property (nonatomic, class, readonly) RAJob *soulReaper;
@property (nonatomic, class, readonly) RAJob *babyStarEmperor;
@property (nonatomic, class, readonly) RAJob *babySoulReaper;
@property (nonatomic, class, readonly) RAJob *starEmperor2;
@property (nonatomic, class, readonly) RAJob *babyStarEmperor2;

@property (nonatomic, class, readonly) RAJob *dragonKnight;
@property (nonatomic, class, readonly) RAJob *meister;
@property (nonatomic, class, readonly) RAJob *shadowCross;
@property (nonatomic, class, readonly) RAJob *archMage;
@property (nonatomic, class, readonly) RAJob *cardinal;
@property (nonatomic, class, readonly) RAJob *windhawk;
@property (nonatomic, class, readonly) RAJob *imperialGuard;
@property (nonatomic, class, readonly) RAJob *biolo;
@property (nonatomic, class, readonly) RAJob *abyssChaser;
@property (nonatomic, class, readonly) RAJob *elementalMaster;
@property (nonatomic, class, readonly) RAJob *inquisitor;
@property (nonatomic, class, readonly) RAJob *troubadour;
@property (nonatomic, class, readonly) RAJob *trouvere;

@property (nonatomic, class, readonly) RAJob *windhawk2;
@property (nonatomic, class, readonly) RAJob *meister2;
@property (nonatomic, class, readonly) RAJob *dragonKnight2;
@property (nonatomic, class, readonly) RAJob *imperialGuard2;

@property (nonatomic, class, readonly) RAJob *skyEmperor;
@property (nonatomic, class, readonly) RAJob *soulAscetic;
@property (nonatomic, class, readonly) RAJob *shinkiro;
@property (nonatomic, class, readonly) RAJob *shiranui;
@property (nonatomic, class, readonly) RAJob *nightWatch;
@property (nonatomic, class, readonly) RAJob *hyperNovice;
@property (nonatomic, class, readonly) RAJob *spiritHandler;

@property (nonatomic, class, readonly) RAJob *skyEmperor2;

@property (nonatomic, class, readonly) NSArray<RAJob *> *allCases;

+ (NSSet<RAJob *> *)valuesOfNames:(NSDictionary<NSString *, NSNumber *> *)names;

@end

NS_ASSUME_NONNULL_END
