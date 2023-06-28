//
//  RASkillTreeDatabase.h
//  rAthena
//
//  Created by Leon Li on 2023/6/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class RASkillTree;
@class RASkillTreeSkill;
@class RASkillTreeRequiredSkill;

@interface RASkillTreeDatabase : NSObject

- (void)fetchSkillTreesWithCompletionHandler:(void (^)(NSArray<RASkillTree *> *skillTrees))completionHandler NS_SWIFT_ASYNC(1);

@end

@interface RASkillTree : NSObject

/// Job name.
@property (nonatomic) NSInteger job;

/// Map of job name from which Job will inherit the skill tree. (Default: null)
/// Note that Job doesn't inherit the child skills, it only inherits the skills defined in Tree of the given job name.
@property (nonatomic, copy) NSArray<NSNumber *> *inherit;

/// List of skills available for the job. (Default: null)
@property (nonatomic, copy) NSSet<RASkillTreeSkill *> *tree;

@end

@interface RASkillTreeSkill : NSObject

/// Skill ID.
@property (nonatomic) NSInteger skillID;

/// Max level of the skill. Set to 0 to remove the skill.
@property (nonatomic) NSInteger maxLevel;

/// Whether the skill is excluded from being inherited. (Default: false)
@property (nonatomic) BOOL exclude;

/// Minimum base level required to unlock the skill. (Default: 0)
@property (nonatomic) NSInteger baseLevel;

/// Minimum job level required to unlock the skill. (Default: 0)
@property (nonatomic) NSInteger jobLevel;

/// List of skills required to unlock the skill. (Default: null)
@property (nonatomic, copy) NSSet<RASkillTreeRequiredSkill *> *requires;

@end

@interface RASkillTreeRequiredSkill : NSObject

/// Skill ID.
@property (nonatomic) NSInteger skillID;

/// Skill level required. Set to 0 to remove the skill.
@property (nonatomic) NSInteger level;

@end

NS_ASSUME_NONNULL_END
