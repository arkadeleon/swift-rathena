//
//  RAMonsterClass.h
//  rAthena
//
//  Created by Leon Li on 2023/3/16.
//

#import <Foundation/Foundation.h>
#import "RAEnum.h"

NS_ASSUME_NONNULL_BEGIN

@interface RAMonsterClass : RAEnum

@property (nonatomic, class, readonly) RAMonsterClass *normal;
@property (nonatomic, class, readonly) RAMonsterClass *boss;
@property (nonatomic, class, readonly) RAMonsterClass *guardian;
@property (nonatomic, class, readonly) RAMonsterClass *battlefield;
@property (nonatomic, class, readonly) RAMonsterClass *event;

@property (nonatomic, class, readonly) NSArray<RAMonsterClass *> *allCases;

@end

NS_ASSUME_NONNULL_END
