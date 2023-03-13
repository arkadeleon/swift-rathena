//
//  RAMonsterDatabase.m
//  rAthena
//
//  Created by Leon Li on 2023/2/26.
//

#import "RAMonsterDatabase.h"
#import "RADatabaseDecoder.h"

@implementation RAMonsterDatabase

- (void)fetchMonstersInMode:(RADatabaseMode)mode completionHandler:(void (^)(NSArray<RAMonster *> *))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        RADatabaseDecoder *decoder = [[RADatabaseDecoder alloc] init];
        NSArray<RAMonster *> *monsters;

        switch (mode) {
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

@end
