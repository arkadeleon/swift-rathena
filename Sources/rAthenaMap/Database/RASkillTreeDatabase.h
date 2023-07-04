//
//  RASkillTreeDatabase.h
//  rAthena
//
//  Created by Leon Li on 2023/6/27.
//

#import <Foundation/Foundation.h>

@import rAthenaCommon;

NS_ASSUME_NONNULL_BEGIN

@class RASkillTree;
@class RASkillTreeSkill;
@class RASkillTreePrerequisiteSkill;

@interface RASkillTreeDatabase : RADatabase

@property (nonatomic, class, readonly) RASkillTreeDatabase *sharedDatabase;

@end

@interface RASkillTree : RADatabaseRecord

/// Job name.
///
/// @discussion See enum @c e_job in mmo.hpp
@property (nonatomic) NSInteger job;

/// Map of job name from which Job will inherit the skill tree.
/// Note that Job doesn't inherit the child skills, it only inherits the skills defined in Tree of the given job name.
///
/// @discussion See enum @c e_job in mmo.hpp
@property (nonatomic, copy) NSArray<NSNumber *> *inherit;

/// List of skills available for the job.
@property (nonatomic, copy) NSSet<RASkillTreeSkill *> *tree;

@end

@interface RASkillTreeSkill : NSObject

/// Skill ID.
@property (nonatomic) NSInteger skillID;

/// Max level of the skill. Set to 0 to remove the skill.
@property (nonatomic) NSInteger maxLevel;

/// Whether the skill is excluded from being inherited.
@property (nonatomic) BOOL exclude;

/// Minimum base level required to unlock the skill.
@property (nonatomic) NSInteger baseLevel;

/// Minimum job level required to unlock the skill.
@property (nonatomic) NSInteger jobLevel;

/// List of skills required to unlock the skill.
@property (nonatomic, copy) NSSet<RASkillTreePrerequisiteSkill *> *prerequisites;

@end

@interface RASkillTreePrerequisiteSkill : NSObject

/// Skill ID.
@property (nonatomic) NSInteger skillID;

/// Skill level required. Set to 0 to remove the skill.
@property (nonatomic) NSInteger level;

@end

NS_ASSUME_NONNULL_END
