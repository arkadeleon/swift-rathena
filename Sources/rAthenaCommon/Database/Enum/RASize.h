//
//  RASize.h
//  rAthena
//
//  Created by Leon Li on 2023/3/15.
//

#import <Foundation/Foundation.h>
#import "RAEnum.h"

NS_ASSUME_NONNULL_BEGIN

@interface RASize : RAEnum

@property (nonatomic, class, readonly) RASize *small;
@property (nonatomic, class, readonly) RASize *medium;
@property (nonatomic, class, readonly) RASize *large;

@end

NS_ASSUME_NONNULL_END
