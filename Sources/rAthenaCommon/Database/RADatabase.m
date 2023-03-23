//
//  RADatabase.m
//  rAthena
//
//  Created by Leon Li on 2023/2/22.
//

#import "RADatabase.h"
#import "RADatabaseDecoder.h"
#import "RAItem.h"
#import "RAMonster.h"
#import "RASkillTree.h"
#import "RASkill.h"

@implementation RADatabase

+ (RADatabase *)prerenewal {
    static RADatabase *prerenewal = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        prerenewal = [[RADatabase alloc] initWithMode:RADatabaseModePrerenewal];
    });
    return prerenewal;
}

+ (RADatabase *)renewal {
    static RADatabase *renewal = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        renewal = [[RADatabase alloc] initWithMode:RADatabaseModeRenewal];
    });
    return renewal;
}

- (instancetype)initWithMode:(RADatabaseMode)mode {
    self = [super init];
    if (self) {
        _mode = mode;
    }
    return self;
}

- (void)fetchItemsWithCompletionHandler:(void (^)(NSArray<RAItem *> *))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        RADatabaseDecoder *decoder = [[RADatabaseDecoder alloc] init];
        NSMutableArray<RAItem *> *items = [[NSMutableArray alloc] init];

        switch (self.mode) {
            case RADatabaseModePrerenewal: {
                NSArray<RAItem *> *usableItems = [decoder decodeArrayOfObjectsOfClass:[RAItem class] fromResource:@"db/pre-re/item_db_usable.yml"];
                [items addObjectsFromArray:usableItems];

                NSArray<RAItem *> *equipItems = [decoder decodeArrayOfObjectsOfClass:[RAItem class] fromResource:@"db/pre-re/item_db_equip.yml"];
                [items addObjectsFromArray:equipItems];

                NSArray<RAItem *> *etcItems = [decoder decodeArrayOfObjectsOfClass:[RAItem class] fromResource:@"db/pre-re/item_db_etc.yml"];
                [items addObjectsFromArray:etcItems];

                break;
            }
            case RADatabaseModeRenewal: {
                NSArray<RAItem *> *usableItems = [decoder decodeArrayOfObjectsOfClass:[RAItem class] fromResource:@"db/re/item_db_usable.yml"];
                [items addObjectsFromArray:usableItems];

                NSArray<RAItem *> *equipItems = [decoder decodeArrayOfObjectsOfClass:[RAItem class] fromResource:@"db/re/item_db_equip.yml"];
                [items addObjectsFromArray:equipItems];

                NSArray<RAItem *> *etcItems = [decoder decodeArrayOfObjectsOfClass:[RAItem class] fromResource:@"db/re/item_db_etc.yml"];
                [items addObjectsFromArray:etcItems];

                break;
            }
        }

        completionHandler([items copy]);
    });
}

- (void)fetchMonstersWithCompletionHandler:(void (^)(NSArray<RAMonster *> *))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        RADatabaseDecoder *decoder = [[RADatabaseDecoder alloc] init];
        NSArray<RAMonster *> *monsters;

        switch (self.mode) {
            case RADatabaseModePrerenewal:
                monsters = [decoder decodeArrayOfObjectsOfClass:[RAMonster class] fromResource:@"db/pre-re/mob_db.yml"];
                break;
            case RADatabaseModeRenewal:
                monsters = [decoder decodeArrayOfObjectsOfClass:[RAMonster class] fromResource:@"db/re/mob_db.yml"];
                break;
        }

        completionHandler(monsters);
    });
}

- (void)fetchSkillTreesWithCompletionHandler:(void (^)(NSArray<RASkillTree *> *))completionHandler {
    RADatabaseDecoder *decoder = [[RADatabaseDecoder alloc] init];
    NSArray<RASkillTree *> *skillTrees;

    switch (self.mode) {
        case RADatabaseModePrerenewal:
            skillTrees = [decoder decodeArrayOfObjectsOfClass:[RASkillTree class] fromResource:@"db/pre-re/skill_tree.yml"];
            break;
        case RADatabaseModeRenewal:
            skillTrees = [decoder decodeArrayOfObjectsOfClass:[RASkillTree class] fromResource:@"db/re/skill_tree.yml"];
            break;
    }

    completionHandler(skillTrees);
}

- (void)fetchSkillsWithCompletionHandler:(void (^)(NSArray<RASkill *> *))completionHandler {
    RADatabaseDecoder *decoder = [[RADatabaseDecoder alloc] init];
    NSArray<RASkill *> *skills;

    switch (self.mode) {
        case RADatabaseModePrerenewal:
            skills = [decoder decodeArrayOfObjectsOfClass:[RASkill class] fromResource:@"db/pre-re/skill_db.yml"];
            break;
        case RADatabaseModeRenewal:
            skills = [decoder decodeArrayOfObjectsOfClass:[RASkill class] fromResource:@"db/re/skill_db.yml"];
            break;
    }

    completionHandler(skills);
}

@end
