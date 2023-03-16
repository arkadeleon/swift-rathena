//
//  RAMonsterMode.h
//  rAthena
//
//  Created by Leon Li on 2023/3/16.
//

#import <Foundation/Foundation.h>
#import "RAEnum.h"

NS_ASSUME_NONNULL_BEGIN

@interface RAMonsterMode : RAEnum

@property (nonatomic, class, readonly) RAMonsterMode *canMove;
@property (nonatomic, class, readonly) RAMonsterMode *looter;
@property (nonatomic, class, readonly) RAMonsterMode *aggressive;
@property (nonatomic, class, readonly) RAMonsterMode *assist;
@property (nonatomic, class, readonly) RAMonsterMode *castSensorIdle;
@property (nonatomic, class, readonly) RAMonsterMode *noRandomWalk;
@property (nonatomic, class, readonly) RAMonsterMode *noCast;
@property (nonatomic, class, readonly) RAMonsterMode *canAttack;
@property (nonatomic, class, readonly) RAMonsterMode *castSensorChase;
@property (nonatomic, class, readonly) RAMonsterMode *changeChase;
@property (nonatomic, class, readonly) RAMonsterMode *angry;
@property (nonatomic, class, readonly) RAMonsterMode *changeTargetMelee;
@property (nonatomic, class, readonly) RAMonsterMode *changeTargetChase;
@property (nonatomic, class, readonly) RAMonsterMode *targetWeak;
@property (nonatomic, class, readonly) RAMonsterMode *randomTarget;
@property (nonatomic, class, readonly) RAMonsterMode *ignoreMelee;
@property (nonatomic, class, readonly) RAMonsterMode *ignoreMagic;
@property (nonatomic, class, readonly) RAMonsterMode *ignoreRanged;
@property (nonatomic, class, readonly) RAMonsterMode *mvp;
@property (nonatomic, class, readonly) RAMonsterMode *ignoreMisc;
@property (nonatomic, class, readonly) RAMonsterMode *knockBackImmune;
@property (nonatomic, class, readonly) RAMonsterMode *teleportBlock;
@property (nonatomic, class, readonly) RAMonsterMode *fixedItemDrop;
@property (nonatomic, class, readonly) RAMonsterMode *detector;
@property (nonatomic, class, readonly) RAMonsterMode *statusImmune;
@property (nonatomic, class, readonly) RAMonsterMode *skillImmune;

@property (nonatomic, class, readonly) NSArray<RAMonsterMode *> *allCases;

@end

NS_ASSUME_NONNULL_END
