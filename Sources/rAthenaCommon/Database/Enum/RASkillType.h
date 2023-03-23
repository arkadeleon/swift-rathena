//
//  RASkillType.h
//  rAthena
//
//  Created by Leon Li on 2023/3/21.
//

#import <Foundation/Foundation.h>
#import "RAEnum.h"

NS_ASSUME_NONNULL_BEGIN

@interface RASkillType : RAEnum

@property (nonatomic, class, readonly) RASkillType *none;
@property (nonatomic, class, readonly) RASkillType *weapon;
@property (nonatomic, class, readonly) RASkillType *magic;
@property (nonatomic, class, readonly) RASkillType *misc;

@property (nonatomic, class, readonly) NSArray<RASkillType *> *allCases;

@end

NS_ASSUME_NONNULL_END
