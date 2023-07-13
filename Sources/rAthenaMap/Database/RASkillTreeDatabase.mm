//
//  RASkillTreeDatabase.m
//  rAthena
//
//  Created by Leon Li on 2023/6/27.
//

#import "RASkillTreeDatabase.h"
#import "RASkillDatabase.h"
#import "RAJobDatabase.h"
#include "map/pc.hpp"

@interface RASkillTree ()

- (instancetype)initWithJob:(uint16)job tree:(std::shared_ptr<s_skill_tree>)skill_tree;

@end

@interface RASkillTreeSkill ()

- (instancetype)initWithSkill:(std::shared_ptr<s_skill_tree_entry>)skill;

@end

@interface RASkillTreePrerequisiteSkill ()

- (instancetype)initWithSkillID:(uint16)skillID skillLevel:(uint16)skillLevel;

@end

@implementation RASkillTreeDatabase

+ (RASkillTreeDatabase *)sharedDatabase {
    static RASkillTreeDatabase *sharedDatabase = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDatabase = [[RASkillTreeDatabase alloc] init];
    });
    return sharedDatabase;
}

- (NSString *)name {
    return @"Skill Tree Database";
}

- (void)recoverCache:(NSMutableDictionary<NSNumber *, RADatabaseRecord *> *)cache {
    for (auto entry = skill_tree_db.begin(); entry != skill_tree_db.end(); ++entry) {
        RASkillTree *skillTree = [[RASkillTree alloc] initWithJob:entry->first tree:entry->second];
        cache[@(skillTree.job)] = skillTree;
    }
}

@end

@implementation RASkillTree

- (instancetype)initWithJob:(uint16)job tree:(std::shared_ptr<s_skill_tree>)skill_tree {
    self = [super init];
    if (self) {
        _job = job;
        _inherit = NSArrayFromUInt16Array(skill_tree->inherit_job.data(), skill_tree->inherit_job.size());

        NSMutableArray<RASkillTreeSkill *> *tree = [NSMutableArray arrayWithCapacity:skill_tree->skills.size()];
        for (auto entry : skill_tree->skills) {
            RASkillTreeSkill *skill = [[RASkillTreeSkill alloc] initWithSkill:entry.second];
            [tree addObject:skill];
        }
        _tree = [tree copy];
    }
    return self;
}

- (NSInteger)recordID {
    return self.job;
}

- (NSString *)recordTitle {
    RAJob *job = [[RAJobDatabase sharedDatabase] recordWithID:self.job];
    return job.jobName;
}

- (NSArray<RADatabaseRecordField *> *)recordFields {
    NSMutableArray<RADatabaseRecordField *> *fields = [NSMutableArray array];

    NSMutableArray<RADatabaseRecordField *> *inheritFields = [NSMutableArray arrayWithCapacity:self.inherit.count];
    for (NSNumber *inheritJob in self.inherit) {
        RAJob *job = [[RAJobDatabase sharedDatabase] recordWithID:inheritJob.integerValue];
        RASkillTree *skillTree = [[RASkillTreeDatabase sharedDatabase] recordWithID:inheritJob.integerValue];
        [inheritFields ra_addFieldWithName:job.jobName referenceValue:skillTree];
    }
    [fields ra_addFieldWithName:@"Inherit" arrayValue:inheritFields];

    for (RASkillTreeSkill *skill in self.tree) {
        RASkill *reference = [[RASkillDatabase sharedDatabase] recordWithID:skill.skillID];

        NSMutableArray<RADatabaseRecordField *> *skillFields = [NSMutableArray array];

        [skillFields ra_addFieldWithName:@"Maximum Level" numberValue:@(skill.maxLevel)];
        [skillFields ra_addFieldWithName:@"Minimum Base Level Required" numberValue:@(skill.baseLevel)];
        [skillFields ra_addFieldWithName:@"Minimum Job Level Required" numberValue:@(skill.jobLevel)];
        [skillFields ra_addFieldWithName:@"Reference" referenceValue:reference];

        NSMutableArray<RADatabaseRecordField *> *prerequisiteFields = [NSMutableArray arrayWithCapacity:skill.prerequisites.count];
        for (RASkillTreePrerequisiteSkill *prerequisiteSkill in skill.prerequisites) {
            RASkill *reference = [[RASkillDatabase sharedDatabase] recordWithID:prerequisiteSkill.skillID];
            [prerequisiteFields ra_addFieldWithName:[NSString stringWithFormat:@"%@ (Level %ld)", reference.skillDescription, prerequisiteSkill.level] referenceValue:reference];
        }
        [skillFields ra_addFieldWithName:@"Prerequisites" arrayValue:prerequisiteFields];

        [fields ra_addFieldWithName:reference.skillDescription arrayValue:skillFields];
    }

    return [fields copy];
}

@end

@implementation RASkillTreeSkill

- (instancetype)initWithSkill:(std::shared_ptr<s_skill_tree_entry>)skill {
    self = [super init];
    if (self) {
        _skillID = skill->skill_id;
        _maxLevel = skill->max_lv;
        _exclude = skill->exclude_inherit;
        _baseLevel = skill->baselv;
        _jobLevel = skill->joblv;

        NSMutableArray<RASkillTreePrerequisiteSkill *> *prerequisites = [NSMutableArray arrayWithCapacity:skill->need.size()];
        for (auto need : skill->need) {
            RASkillTreePrerequisiteSkill *prerequisite = [[RASkillTreePrerequisiteSkill alloc] initWithSkillID:need.first skillLevel:need.second];
            [prerequisites addObject:prerequisite];
        }
        _prerequisites = [prerequisites copy];
    }
    return self;
}

@end

@implementation RASkillTreePrerequisiteSkill

- (instancetype)initWithSkillID:(uint16)skillID skillLevel:(uint16)skillLevel {
    self = [super init];
    if (self) {
        _skillID = skillID;
        _level = skillLevel;
    }
    return self;
}

@end
