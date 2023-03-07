//
//  RASkillTreeDatabase.m
//  rAthena
//
//  Created by Leon Li on 2023/3/6.
//

#import "RASkillTreeDatabase.h"
#import "RADatabaseDecoder.h"

@implementation RASkillTree

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"job"      : @"Job",
        @"inherit"  : @"Inherit",
        @"tree"     : @"Tree",
    };
}

+ (NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
        @"tree"     : [RASkillTreeSkill class],
    };
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _inherit = 0;
        _tree = nil;
    }
    return self;
}

@end

@implementation RASkillTreeSkill

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"name"     : @"Name",
        @"maxLevel" : @"MaxLevel",
        @"exclude"  : @"Exclude",
        @"baseLevel": @"BaseLevel",
        @"jobLevel" : @"JobLevel",
        @"requires" : @"Requires",
    };
}

+ (NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
        @"requires" : [RASkillTreeRequiredSkill class],
    };
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _exclude = NO;
        _baseLevel = 0;
        _jobLevel = 0;
        _requires = nil;
    }
    return self;
}

@end

@implementation RASkillTreeRequiredSkill

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{
        @"name" : @"Name",
        @"level": @"Level",
    };
}

@end

@implementation RASkillTreeDatabase

- (void)fetchSkillTreesInMode:(RADatabaseMode)mode completionHandler:(void (^)(NSArray<RASkillTree *> *))completionHandler {
    RADatabaseDecoder *decoder = [[RADatabaseDecoder alloc] init];
    NSArray<RASkillTree *> *skillTrees;

    switch (mode) {
        case RADatabaseModePrerenewal:
            skillTrees = [decoder decodeArrayOfObjectsOfClass:[RASkillTree class] fromResource:@"db/pre-re/skill_tree.yml"];
            break;
        case RADatabaseModeRenewal:
            skillTrees = [decoder decodeArrayOfObjectsOfClass:[RASkillTree class] fromResource:@"db/re/skill_tree.yml"];
            break;
    }

    completionHandler(skillTrees);
}

@end
