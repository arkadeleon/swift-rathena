//
//  RASkillTree.h
//  rAthena
//
//  Created by Leon Li on 2023/3/13.
//

#import <Foundation/Foundation.h>

@import YYModel;

@class RAJob;

NS_ASSUME_NONNULL_BEGIN

@class RASkillTreeSkill;
@class RASkillTreeRequiredSkill;

@interface RASkillTree : NSObject <YYModel>

/// Job name.
@property (nonatomic) RAJob *job;

/// Map of job name from which Job will inherit the skill tree. (Default: null)
/// Note that Job doesn't inherit the child skills, it only inherits the skills defined in Tree of the given job name.
@property (nonatomic, copy) NSSet<RAJob *> *inherit;

/// List of skills available for the job. (Default: null)
@property (nonatomic, copy, nullable) NSArray<RASkillTreeSkill *> *tree;

@end

@interface RASkillTreeSkill : NSObject <YYModel>

/// Skill name.
@property (nonatomic, copy) NSString *name;

/// Max level of the skill. Set to 0 to remove the skill.
@property (nonatomic) NSInteger maxLevel;

/// Whether the skill is excluded from being inherited. (Default: false)
@property (nonatomic) BOOL exclude;

/// Minimum base level required to unlock the skill. (Default: 0)
@property (nonatomic) NSInteger baseLevel;

/// Minimum job level required to unlock the skill. (Default: 0)
@property (nonatomic) NSInteger jobLevel;

/// List of skills required to unlock the skill. (Default: null)
@property (nonatomic, copy, nullable) NSArray<RASkillTreeRequiredSkill *> *requires;

@end

@interface RASkillTreeRequiredSkill : NSObject <YYModel>

/// Skill name.
@property (nonatomic, copy) NSString *name;

/// Skill level required. Set to 0 to remove the skill.
@property (nonatomic) NSInteger level;

@end

NS_ASSUME_NONNULL_END
