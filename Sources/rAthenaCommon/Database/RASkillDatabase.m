//
//  RASkillDatabase.m
//  rAthena
//
//  Created by Leon Li on 2023/3/6.
//

#import "RASkillDatabase.h"
#import "RADatabaseDecoder.h"

@implementation RASkillDatabase

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
