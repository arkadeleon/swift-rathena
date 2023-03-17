//
//  RAItemClass.h
//  rAthena
//
//  Created by Leon Li on 2023/3/17.
//

#import <Foundation/Foundation.h>
#import "RAEnum.h"

NS_ASSUME_NONNULL_BEGIN

@interface RAItemClass : RAEnum

@property (nonatomic, class, readonly) RAItemClass *normal;
@property (nonatomic, class, readonly) RAItemClass *upper;
@property (nonatomic, class, readonly) RAItemClass *baby;
@property (nonatomic, class, readonly) RAItemClass *third;
@property (nonatomic, class, readonly) RAItemClass *thirdUpper;
@property (nonatomic, class, readonly) RAItemClass *thirdBaby;
@property (nonatomic, class, readonly) RAItemClass *fourth;

@property (nonatomic, class, readonly) NSArray<RAItemClass *> *allUpper;
@property (nonatomic, class, readonly) NSArray<RAItemClass *> *allBaby;
@property (nonatomic, class, readonly) NSArray<RAItemClass *> *allThird;

@property (nonatomic, class, readonly) NSArray<RAItemClass *> *allCases;

@end

NS_ASSUME_NONNULL_END
