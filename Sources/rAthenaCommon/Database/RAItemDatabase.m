//
//  RAItemDatabase.m
//  rAthena
//
//  Created by Leon Li on 2023/2/22.
//

#import "RAItemDatabase.h"
#import "RADatabaseDecoder.h"

@implementation RAItemDatabase

- (void)fetchItemsInMode:(RADatabaseMode)mode completionHandler:(void (^)(NSArray<RAItem *> *))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        RADatabaseDecoder *decoder = [[RADatabaseDecoder alloc] init];
        NSMutableArray<RAItem *> *items = [[NSMutableArray alloc] init];

        switch (mode) {
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

@end
