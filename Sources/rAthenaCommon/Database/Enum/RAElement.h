//
//  RAElement.h
//  rAthena
//
//  Created by Leon Li on 2023/3/16.
//

#import <Foundation/Foundation.h>
#import "RAEnum.h"

NS_ASSUME_NONNULL_BEGIN

@interface RAElement : RAEnum

@property (nonatomic, class, readonly) RAElement *neutral;
@property (nonatomic, class, readonly) RAElement *water;
@property (nonatomic, class, readonly) RAElement *earth;
@property (nonatomic, class, readonly) RAElement *fire;
@property (nonatomic, class, readonly) RAElement *wind;
@property (nonatomic, class, readonly) RAElement *poison;
@property (nonatomic, class, readonly) RAElement *holy;
@property (nonatomic, class, readonly) RAElement *dark;
@property (nonatomic, class, readonly) RAElement *ghost;
@property (nonatomic, class, readonly) RAElement *undead;

@property (nonatomic, class, readonly) RAElement *weapon;
@property (nonatomic, class, readonly) RAElement *endowed;
@property (nonatomic, class, readonly) RAElement *random;

@property (nonatomic, class, readonly) NSArray<RAElement *> *allCases;

@end

NS_ASSUME_NONNULL_END
