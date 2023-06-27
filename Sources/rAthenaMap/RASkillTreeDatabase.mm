//
//  RASkillTreeDatabase.m
//  rAthena
//
//  Created by Leon Li on 2023/6/27.
//

#import "RASkillTreeDatabase.h"
#include "map/pc.hpp"

@interface RASkillTree2 ()

- (instancetype)initWithJob:(uint16)job tree:(std::shared_ptr<s_skill_tree>)skill_tree;

@end

@interface RASkillTreeSkill2 ()

- (instancetype)initWithSkill:(std::shared_ptr<s_skill_tree_entry>)skill;

@end

@interface RASkillTreeRequiredSkill2 ()

- (instancetype)initWithSkillID:(uint16)skillID skillLevel:(uint16)skillLevel;

@end

@implementation RASkillTreeDatabase

- (void)fetchSkillTreesWithCompletionHandler:(void (^)(NSArray<RASkillTree2 *> *))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSMutableArray<RASkillTree2 *> *skillTrees = [NSMutableArray arrayWithCapacity:skill_tree_db.size()];
        for (auto entry = skill_tree_db.begin(); entry != skill_tree_db.end(); ++entry) {
            RASkillTree2 *skillTree = [[RASkillTree2 alloc] initWithJob:entry->first tree:entry->second];
            [skillTrees addObject:skillTree];
        }

        completionHandler([skillTrees copy]);
    });
}

@end

@implementation RASkillTree2

- (instancetype)initWithJob:(uint16)job tree:(std::shared_ptr<s_skill_tree>)skill_tree {
    self = [super init];
    if (self) {
        _job = job;

        NSMutableArray<NSNumber *> *inherit = [NSMutableArray arrayWithCapacity:skill_tree->inherit_job.size()];
        for (auto job : skill_tree->inherit_job) {
            [inherit addObject:@(job)];
        }
        _inherit = [inherit copy];

        NSMutableSet<RASkillTreeSkill2 *> *tree = [NSMutableSet setWithCapacity:skill_tree->skills.size()];
        for (auto entry : skill_tree->skills) {
            RASkillTreeSkill2 *skill = [[RASkillTreeSkill2 alloc] initWithSkill:entry.second];
            [tree addObject:skill];
        }
        _tree = [tree copy];
    }
    return self;
}

@end

@implementation RASkillTreeSkill2

- (instancetype)initWithSkill:(std::shared_ptr<s_skill_tree_entry>)skill {
    self = [super init];
    if (self) {
        _skillID = skill->skill_id;
        _maxLevel = skill->max_lv;
        _exclude = skill->exclude_inherit;
        _baseLevel = skill->baselv;
        _jobLevel = skill->joblv;

        NSMutableSet<RASkillTreeRequiredSkill2 *> *requires = [NSMutableSet setWithCapacity:skill->need.size()];
        for (auto need : skill->need) {
            RASkillTreeRequiredSkill2 *require = [[RASkillTreeRequiredSkill2 alloc] initWithSkillID:need.first skillLevel:need.second];
            [requires addObject:require];
        }
        _requires = [requires copy];
    }
    return self;
}

@end

@implementation RASkillTreeRequiredSkill2

- (instancetype)initWithSkillID:(uint16)skillID skillLevel:(uint16)skillLevel {
    self = [super init];
    if (self) {
        _skillID = skillID;
        _level = skillLevel;
    }
    return self;
}

@end
