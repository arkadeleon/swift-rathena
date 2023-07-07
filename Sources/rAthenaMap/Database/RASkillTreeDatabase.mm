//
//  RASkillTreeDatabase.m
//  rAthena
//
//  Created by Leon Li on 2023/6/27.
//

#import "RASkillTreeDatabase.h"
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

        NSMutableArray<NSNumber *> *inherit = [NSMutableArray arrayWithCapacity:skill_tree->inherit_job.size()];
        for (auto job : skill_tree->inherit_job) {
            [inherit addObject:@(job)];
        }
        _inherit = [inherit copy];

        NSMutableSet<RASkillTreeSkill *> *tree = [NSMutableSet setWithCapacity:skill_tree->skills.size()];
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
    return @(self.job).stringValue;
}

- (NSArray<RADatabaseRecordField *> *)recordFields {
    NSMutableArray<RADatabaseRecordField *> *fields = [NSMutableArray array];

    [fields ra_addFieldWithName:@"Job" stringValue:@(self.job).stringValue];

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

        NSMutableSet<RASkillTreePrerequisiteSkill *> *prerequisites = [NSMutableSet setWithCapacity:skill->need.size()];
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
