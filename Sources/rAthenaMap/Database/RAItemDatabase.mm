//
//  RAItemDatabase.m
//  rAthena
//
//  Created by Leon Li on 2023/6/25.
//

#import "RAItemDatabase.h"
#include "map/itemdb.hpp"

@interface RAItemDatabase ()

@property (nonatomic, copy) NSArray<RAItem *> *cachedItems;

@end

@interface RAItem ()

- (instancetype)initWithItem:(std::shared_ptr<item_data>)item;

@end

@implementation RAItemDatabase

+ (RAItemDatabase *)sharedDatabase {
    static RAItemDatabase *sharedDatabase = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDatabase = [[RAItemDatabase alloc] init];
    });
    return sharedDatabase;
}

- (NSString *)name {
    return @"Item Database";
}

- (void)loadWithCompletionHandler:(void (^)(NSArray<RAItem *> *))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (self.cachedItems.count > 0) {
            completionHandler(self.cachedItems);
            return;
        }

        auto db = item_db;
        NSMutableArray<RAItem *> *items = [NSMutableArray arrayWithCapacity:db.size()];
        for (auto entry = db.begin(); entry != db.end(); ++entry) {
            RAItem *item = [[RAItem alloc] initWithItem:entry->second];
            [items addObject:item];
        }
        [items sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"itemID" ascending:YES]]];

        self.cachedItems = items;

        completionHandler(self.cachedItems);
    });
}

@end

@implementation RAItem

- (instancetype)initWithItem:(std::shared_ptr<item_data>)item {
    self = [super init];
    if (self) {
        _itemID = item->nameid;
        _aegisName = [NSString stringWithUTF8String:item->name.c_str()];
        _name = [NSString stringWithUTF8String:item->ename.c_str()];
        _type = item->type;
        _subType = item->subtype;
        _buy = item->value_buy;
        _sell = item->value_sell;
        _weight = item->weight;
        _attack = item->atk;
#ifdef RENEWAL
        _magicAttack = item->matk;
#endif
        _defense = item->def;
        _range = item->range;
        _slots = item->slots;
        _jobs11 = item->class_base[0];
        _jobs21 = item->class_base[1];
        _jobs22 = item->class_base[2];
        _classes = item->class_upper;
        _gender = item->sex;
        _locations = item->equip;
        _weaponLevel = item->weapon_level;
        _armorLevel = item->armor_level;
        _equipLevelMin = item->elv;
        _equipLevelMax = item->elvmax;
        _refineable = !item->flag.no_refine;
        _gradable = item->flag.gradable;
        _view = item->look;
//        _aliasName = item->view_id;

        _flags = [[RAItemFlags alloc] init];
        _flags.buyingStore = item->flag.buyingstore;
        _flags.deadBranch = item->flag.dead_branch;
        _flags.container = item->flag.group;
        _flags.uniqueId = item->flag.guid;
        _flags.bindOnEquip = item->flag.bindOnEquip;
        _flags.dropAnnounce = item->flag.broadcast;
        _flags.noConsume = (item->flag.delay_consume & DELAYCONSUME_NOCONSUME) != 0;
        _flags.dropEffect = item->flag.dropEffect;

        _delay = [[RAItemDelay alloc] init];
        _delay.duration = item->delay.duration;
        _delay.status = item->delay.sc;

        _stack = [[RAItemStack alloc] init];
        _stack.amount = item->stack.amount;
        _stack.inventory = item->stack.inventory;
        _stack.cart = item->stack.cart;
        _stack.storage = item->stack.storage;
        _stack.guildStorage = item->stack.guild_storage;

        _noUse = [[RAItemNoUse alloc] init];
        _noUse.override = item->item_usage.override;
        _noUse.sitting = item->item_usage.sitting;

        _trade = [[RAItemTrade alloc] init];
        _trade.override = item->gm_lv_trade_override;
        _trade.noDrop = item->flag.trade_restriction.drop;
        _trade.noTrade = item->flag.trade_restriction.trade;
        _trade.tradePartner = item->flag.trade_restriction.trade_partner;
        _trade.noSell = item->flag.trade_restriction.sell;
        _trade.noCart = item->flag.trade_restriction.cart;
        _trade.noStorage = item->flag.trade_restriction.storage;
        _trade.noGuildStorage = item->flag.trade_restriction.guild_storage;
        _trade.noMail = item->flag.trade_restriction.mail;
        _trade.noAuction = item->flag.trade_restriction.auction;

//        _script = item->script;
//        _equipScript = item->equip_script;
//        _unEquipScript = item->unequip_script;
    }
    return self;
}

- (NSInteger)recordID {
    return self.itemID;
}

- (NSString *)recordTitle {
    return self.name;
}

- (NSArray<RADatabaseRecordField *> *)recordFields {
    return @[
        [[RADatabaseRecordField alloc] initWithName:@"Type" stringValue:@(self.type).stringValue],
        [[RADatabaseRecordField alloc] initWithName:@"Buy" stringValue:@(self.buy).stringValue],
        [[RADatabaseRecordField alloc] initWithName:@"Sell" stringValue:@(self.sell).stringValue],
    ];
}

@end

@implementation RAItemFlags

@end

@implementation RAItemDelay

@end

@implementation RAItemStack

@end

@implementation RAItemNoUse

@end

@implementation RAItemTrade

@end
