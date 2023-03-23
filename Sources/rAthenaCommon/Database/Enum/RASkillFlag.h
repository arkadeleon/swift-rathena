//
//  RASkillFlag.h
//  rAthena
//
//  Created by Leon Li on 2023/3/22.
//

#import <Foundation/Foundation.h>
#import "RAEnum.h"

NS_ASSUME_NONNULL_BEGIN

@interface RASkillFlag : RAEnum

@property (nonatomic, class, readonly) RASkillFlag *isQuest;
@property (nonatomic, class, readonly) RASkillFlag *isNpc;
@property (nonatomic, class, readonly) RASkillFlag *isWedding;
@property (nonatomic, class, readonly) RASkillFlag *isSpirit;
@property (nonatomic, class, readonly) RASkillFlag *isGuild;
@property (nonatomic, class, readonly) RASkillFlag *isSong;
@property (nonatomic, class, readonly) RASkillFlag *isEnsemble;
@property (nonatomic, class, readonly) RASkillFlag *isTrap;
@property (nonatomic, class, readonly) RASkillFlag *targetSelf;
@property (nonatomic, class, readonly) RASkillFlag *noTargetSelf;
@property (nonatomic, class, readonly) RASkillFlag *partyOnly;
@property (nonatomic, class, readonly) RASkillFlag *guildOnly;
@property (nonatomic, class, readonly) RASkillFlag *noTargetEnemy;
@property (nonatomic, class, readonly) RASkillFlag *isAutoShadowSpell;
@property (nonatomic, class, readonly) RASkillFlag *isChorus;
@property (nonatomic, class, readonly) RASkillFlag *ignoreBgReduction;
@property (nonatomic, class, readonly) RASkillFlag *ignoreGvgReduction;
@property (nonatomic, class, readonly) RASkillFlag *disableNearNpc;
@property (nonatomic, class, readonly) RASkillFlag *targetTrap;
@property (nonatomic, class, readonly) RASkillFlag *ignoreLandProtector;
@property (nonatomic, class, readonly) RASkillFlag *allowWhenHidden;
@property (nonatomic, class, readonly) RASkillFlag *allowWhenPerforming;
@property (nonatomic, class, readonly) RASkillFlag *targetEmperium;
@property (nonatomic, class, readonly) RASkillFlag *ignoreKagehumi;
@property (nonatomic, class, readonly) RASkillFlag *alterRangeVulture;
@property (nonatomic, class, readonly) RASkillFlag *alterRangeSnakeEye;
@property (nonatomic, class, readonly) RASkillFlag *alterRangeShadowJump;
@property (nonatomic, class, readonly) RASkillFlag *alterRangeRadius;
@property (nonatomic, class, readonly) RASkillFlag *alterRangeResearchTrap;
@property (nonatomic, class, readonly) RASkillFlag *ignoreHovering;
@property (nonatomic, class, readonly) RASkillFlag *allowOnWarg;
@property (nonatomic, class, readonly) RASkillFlag *allowOnMado;
@property (nonatomic, class, readonly) RASkillFlag *targetManHole;
@property (nonatomic, class, readonly) RASkillFlag *targetHidden;
@property (nonatomic, class, readonly) RASkillFlag *increaseDanceWithWugDamage;
@property (nonatomic, class, readonly) RASkillFlag *ignoreWugBite;
@property (nonatomic, class, readonly) RASkillFlag *ignoreAutoGuard;
@property (nonatomic, class, readonly) RASkillFlag *ignoreCicada;
@property (nonatomic, class, readonly) RASkillFlag *showScale;
@property (nonatomic, class, readonly) RASkillFlag *ignoreGtb;
@property (nonatomic, class, readonly) RASkillFlag *toggleable;

@end

NS_ASSUME_NONNULL_END
