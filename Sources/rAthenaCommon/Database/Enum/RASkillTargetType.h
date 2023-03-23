//
//  RASkillTargetType.h
//  rAthena
//
//  Created by Leon Li on 2023/3/21.
//

#import <Foundation/Foundation.h>
#import "RAEnum.h"

NS_ASSUME_NONNULL_BEGIN

@interface RASkillTargetType : RAEnum

@property (nonatomic, class, readonly) RASkillTargetType *passive;
@property (nonatomic, class, readonly) RASkillTargetType *attack;
@property (nonatomic, class, readonly) RASkillTargetType *ground;
@property (nonatomic, class, readonly) RASkillTargetType *zelf;
@property (nonatomic, class, readonly) RASkillTargetType *support;
@property (nonatomic, class, readonly) RASkillTargetType *trap;

@property (nonatomic, class, readonly) NSArray<RASkillTargetType *> *allCases;

@end

NS_ASSUME_NONNULL_END
