//
//  RAItemJob.h
//  rAthena
//
//  Created by Leon Li on 2023/3/17.
//

#import <Foundation/Foundation.h>
#import "RAEnum.h"

NS_ASSUME_NONNULL_BEGIN

@interface RAItemJob : RAEnum

@property (nonatomic, class, readonly) RAItemJob *acolyte;
@property (nonatomic, class, readonly) RAItemJob *alchemist;
@property (nonatomic, class, readonly) RAItemJob *archer;
@property (nonatomic, class, readonly) RAItemJob *assassin;
@property (nonatomic, class, readonly) RAItemJob *bardDancer;
@property (nonatomic, class, readonly) RAItemJob *blacksmith;
@property (nonatomic, class, readonly) RAItemJob *crusader;
@property (nonatomic, class, readonly) RAItemJob *gunslinger;
@property (nonatomic, class, readonly) RAItemJob *hunter;
@property (nonatomic, class, readonly) RAItemJob *kagerouOboro;
@property (nonatomic, class, readonly) RAItemJob *knight;
@property (nonatomic, class, readonly) RAItemJob *magician;
@property (nonatomic, class, readonly) RAItemJob *merchant;
@property (nonatomic, class, readonly) RAItemJob *monk;
@property (nonatomic, class, readonly) RAItemJob *ninja;
@property (nonatomic, class, readonly) RAItemJob *novice;
@property (nonatomic, class, readonly) RAItemJob *priest;
@property (nonatomic, class, readonly) RAItemJob *rebellion;
@property (nonatomic, class, readonly) RAItemJob *rogue;
@property (nonatomic, class, readonly) RAItemJob *sage;
@property (nonatomic, class, readonly) RAItemJob *soulLinker;
@property (nonatomic, class, readonly) RAItemJob *starGladiator;
@property (nonatomic, class, readonly) RAItemJob *summoner;
@property (nonatomic, class, readonly) RAItemJob *superNovice;
@property (nonatomic, class, readonly) RAItemJob *swordman;
@property (nonatomic, class, readonly) RAItemJob *taekwon;
@property (nonatomic, class, readonly) RAItemJob *thief;
@property (nonatomic, class, readonly) RAItemJob *wizard;

@property (nonatomic, class, readonly) NSArray<RAItemJob *> *allCases;

@end

NS_ASSUME_NONNULL_END
