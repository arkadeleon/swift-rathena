//
//  RACardType.h
//  rAthena
//
//  Created by Leon Li on 2023/3/14.
//

#import <Foundation/Foundation.h>
#import "RAEnum.h"

NS_ASSUME_NONNULL_BEGIN

@interface RACardType : RAEnum

@property (nonatomic, class, readonly) RACardType *normal;
@property (nonatomic, class, readonly) RACardType *enchant;

@property (nonatomic, class, readonly) NSArray<RACardType *> *allCases;

@end

NS_ASSUME_NONNULL_END
