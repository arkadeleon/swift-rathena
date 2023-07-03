//
//  RASkillTreeDatabase.m
//  rAthena
//
//  Created by Leon Li on 2023/6/27.
//

#import "RASkillTreeDatabase.h"
#include "map/pc.hpp"

@interface RASkillTreeDatabase ()

@property (nonatomic, copy) NSArray<RASkillTree *> *cachedSkillTrees;

@end

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

- (void)loadWithCompletionHandler:(void (^)(NSArray<RASkillTree *> *))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (self.cachedSkillTrees.count > 0) {
            completionHandler(self.cachedSkillTrees);
            return;
        }
        
        auto db = skill_tree_db;
        NSMutableArray<RASkillTree *> *skillTrees = [NSMutableArray arrayWithCapacity:db.size()];
        for (auto entry = db.begin(); entry != db.end(); ++entry) {
            RASkillTree *skillTree = [[RASkillTree alloc] initWithJob:entry->first tree:entry->second];
            [skillTrees addObject:skillTree];
        }
        [skillTrees sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"job" ascending:YES]]];

        self.cachedSkillTrees = skillTrees;

        completionHandler(self.cachedSkillTrees);
    });
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

- (RADatabaseRecordFieldCollection *)recordFieldCollection {
    RADatabaseRecordFieldCollection *recordFieldCollection = [[RADatabaseRecordFieldCollection alloc] init];

    [recordFieldCollection addRecordFieldWithName:@"Job" stringValue:@(self.job).stringValue];

    return recordFieldCollection;
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
