//
//  RARaceGroup.h
//  rAthena
//
//  Created by Leon Li on 2023/3/16.
//

#import <Foundation/Foundation.h>
#import "RAEnum.h"

NS_ASSUME_NONNULL_BEGIN

@interface RARaceGroup : RAEnum

@property (nonatomic, class, readonly) RARaceGroup *goblin;
@property (nonatomic, class, readonly) RARaceGroup *kobold;
@property (nonatomic, class, readonly) RARaceGroup *orc;
@property (nonatomic, class, readonly) RARaceGroup *golem;
@property (nonatomic, class, readonly) RARaceGroup *guardian;
@property (nonatomic, class, readonly) RARaceGroup *ninja;
@property (nonatomic, class, readonly) RARaceGroup *gvg;
@property (nonatomic, class, readonly) RARaceGroup *battlefield;
@property (nonatomic, class, readonly) RARaceGroup *treasure;
@property (nonatomic, class, readonly) RARaceGroup *biolab;
@property (nonatomic, class, readonly) RARaceGroup *manuk;
@property (nonatomic, class, readonly) RARaceGroup *splendide;
@property (nonatomic, class, readonly) RARaceGroup *scaraba;
@property (nonatomic, class, readonly) RARaceGroup *oghAtkDef;
@property (nonatomic, class, readonly) RARaceGroup *oghHidden;
@property (nonatomic, class, readonly) RARaceGroup *bio5SwordmanThief;
@property (nonatomic, class, readonly) RARaceGroup *bio5AcolyteMerchant;
@property (nonatomic, class, readonly) RARaceGroup *bio5MageArcher;
@property (nonatomic, class, readonly) RARaceGroup *bio5Mvp;
@property (nonatomic, class, readonly) RARaceGroup *clocktower;
@property (nonatomic, class, readonly) RARaceGroup *thanatos;
@property (nonatomic, class, readonly) RARaceGroup *faceworm;
@property (nonatomic, class, readonly) RARaceGroup *hearthunter;
@property (nonatomic, class, readonly) RARaceGroup *rockridge;
@property (nonatomic, class, readonly) RARaceGroup *wernerLab;
@property (nonatomic, class, readonly) RARaceGroup *templeDemon;
@property (nonatomic, class, readonly) RARaceGroup *illusionVampire;
@property (nonatomic, class, readonly) RARaceGroup *malangdo;
@property (nonatomic, class, readonly) RARaceGroup *ep172Alpha;
@property (nonatomic, class, readonly) RARaceGroup *ep172Beta;
@property (nonatomic, class, readonly) RARaceGroup *ep172Bath;

@property (nonatomic, class, readonly) NSArray<RARaceGroup *> *allCases;

@end

NS_ASSUME_NONNULL_END
