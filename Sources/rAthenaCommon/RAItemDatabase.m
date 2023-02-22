//
//  RAItemDatabase.m
//  rAthena
//
//  Created by Leon Li on 2023/2/22.
//

#import "RAItemDatabase.h"
#import "RADatabaseParser.h"

@interface RAItem ()

@property (nonatomic, readwrite, assign) NSUInteger itemID;
@property (nonatomic, readwrite, copy) NSString *aegisName;
@property (nonatomic, readwrite, copy) NSString *name;

@end

@implementation RAItem

@end

@interface RAItemDatabase () <RADatabaseParserDelegate>

@property (nonatomic, strong) NSMutableArray<RAItem *> *allItems;

@end

@implementation RAItemDatabase

- (instancetype)init {
    self = [super init];
    if (self) {
        _allItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)fetchAllItemsWithCompletionHandler:(void (^)(NSArray<RAItem *> *))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        RADatabaseParser *parser;

        parser = [[RADatabaseParser alloc] initWithResource:@"db/re/item_db_usable.yml"];
        parser.delegate = self;
        [parser parse];

        parser = [[RADatabaseParser alloc] initWithResource:@"db/re/item_db_equip.yml"];
        parser.delegate = self;
        [parser parse];

        parser = [[RADatabaseParser alloc] initWithResource:@"db/re/item_db_etc.yml"];
        parser.delegate = self;
        [parser parse];

        completionHandler([self.allItems copy]);
    });
}

#pragma mark - RADatabaseParserDelegate

- (void)parser:(RADatabaseParser *)parser foundElement:(NSDictionary *)element {
    RAItem *item = [[RAItem alloc] init];
    item.itemID = [element[@"Id"] integerValue];
    item.aegisName = element[@"AegisName"];
    item.name = element[@"Name"];
    [self.allItems addObject:item];
}

@end
