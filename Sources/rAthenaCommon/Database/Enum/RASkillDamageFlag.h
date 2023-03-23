//
//  RASkillDamageFlag.h
//  rAthena
//
//  Created by Leon Li on 2023/3/22.
//

#import <Foundation/Foundation.h>
#import "RAEnum.h"

NS_ASSUME_NONNULL_BEGIN

@interface RASkillDamageFlag : RAEnum

@property (nonatomic, class, readonly) RASkillDamageFlag *noDamage;
@property (nonatomic, class, readonly) RASkillDamageFlag *splash;
@property (nonatomic, class, readonly) RASkillDamageFlag *splashSplit;
@property (nonatomic, class, readonly) RASkillDamageFlag *ignoreAtkCard;
@property (nonatomic, class, readonly) RASkillDamageFlag *ignoreElement;
@property (nonatomic, class, readonly) RASkillDamageFlag *ignoreDefense;
@property (nonatomic, class, readonly) RASkillDamageFlag *ignoreFlee;
@property (nonatomic, class, readonly) RASkillDamageFlag *ignoreDefCard;
@property (nonatomic, class, readonly) RASkillDamageFlag *ignoreLongCard;
@property (nonatomic, class, readonly) RASkillDamageFlag *critical;

@property (nonatomic, class, readonly) NSArray<RASkillDamageFlag *> *allCases;

@end

NS_ASSUME_NONNULL_END
