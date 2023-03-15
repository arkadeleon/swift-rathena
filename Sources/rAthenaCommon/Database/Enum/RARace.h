//
//  RARace.h
//  rAthena
//
//  Created by Leon Li on 2023/3/15.
//

#import <Foundation/Foundation.h>
#import "RAEnum.h"

NS_ASSUME_NONNULL_BEGIN

@interface RARace : RAEnum

@property (nonatomic, class, readonly) RARace *none;
@property (nonatomic, class, readonly) RARace *formless;
@property (nonatomic, class, readonly) RARace *undead;
@property (nonatomic, class, readonly) RARace *brute;
@property (nonatomic, class, readonly) RARace *plant;
@property (nonatomic, class, readonly) RARace *insect;
@property (nonatomic, class, readonly) RARace *fish;
@property (nonatomic, class, readonly) RARace *demon;
@property (nonatomic, class, readonly) RARace *demiHuman;
@property (nonatomic, class, readonly) RARace *angel;
@property (nonatomic, class, readonly) RARace *dragon;
@property (nonatomic, class, readonly) RARace *playerHuman;
@property (nonatomic, class, readonly) RARace *playerDoram;

@end

NS_ASSUME_NONNULL_END
