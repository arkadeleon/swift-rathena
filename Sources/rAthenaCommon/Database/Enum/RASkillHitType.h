//
//  RASkillHitType.h
//  rAthena
//
//  Created by Leon Li on 2023/3/23.
//

#import "RAEnum.h"

NS_ASSUME_NONNULL_BEGIN

@interface RASkillHitType : RAEnum

@property (nonatomic, class, readonly) RASkillHitType *normal;
@property (nonatomic, class, readonly) RASkillHitType *single;
@property (nonatomic, class, readonly) RASkillHitType *multiple;

@end

NS_ASSUME_NONNULL_END
