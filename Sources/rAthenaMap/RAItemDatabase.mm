//
//  RAItemDatabase.m
//  rAthena
//
//  Created by Leon Li on 2023/6/25.
//

#import "RAItemDatabase.h"
#import "RAItem2.h"
#include "map/itemdb.hpp"

@implementation RAItemDatabase

- (void)fetchItemsWithCompletionHandler:(void (^)(NSArray<RAItem2 *> *))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSMutableArray<RAItem2 *> *items = [NSMutableArray arrayWithCapacity:item_db.size()];

        for (auto entry = item_db.begin(); entry != item_db.end(); ++entry) {
            auto it = entry->second;

            RAItem2 *item = [[RAItem2 alloc] init];
            item.itemID = it->nameid;
            item.aegisName = [NSString stringWithUTF8String:it->name.c_str()];
            item.name = [NSString stringWithUTF8String:it->ename.c_str()];
            item.type = it->type;
            item.subType = it->subtype;
            item.buy = it->value_buy;
            item.sell = it->value_sell;
            item.weight = it->weight;
            item.attack = it->atk;
    #ifdef RENEWAL
            item.magicAttack = it->matk;
    #endif
            item.defense = it->def;
            item.range = it->range;
            item.slots = it->slots;
            item.jobs11 = it->class_base[0];
            item.jobs21 = it->class_base[1];
            item.jobs22 = it->class_base[2];
            item.classes = it->class_upper;
            item.gender = it->sex;
            item.locations = it->equip;
            item.weaponLevel = it->weapon_level;
            item.armorLevel = it->armor_level;
            item.equipLevelMin = it->elv;
            item.equipLevelMax = it->elvmax;
            item.refineable = !it->flag.no_refine;
            item.gradable = it->flag.gradable;
            item.view = it->look;
//            item.aliasName = it->view_id;

            item.flags.buyingStore = it->flag.buyingstore;
            item.flags.deadBranch = it->flag.dead_branch;
            item.flags.container = it->flag.group;
            item.flags.uniqueId = it->flag.guid;
            item.flags.bindOnEquip = it->flag.bindOnEquip;
            item.flags.dropAnnounce = it->flag.broadcast;
            item.flags.noConsume = (it->flag.delay_consume & DELAYCONSUME_NOCONSUME) != 0;
            item.flags.dropEffect = it->flag.dropEffect;

            item.delay.duration = it->delay.duration;
            item.delay.status = it->delay.sc;

            item.stack.amount = it->stack.amount;
            item.stack.inventory = it->stack.inventory;
            item.stack.cart = it->stack.cart;
            item.stack.storage = it->stack.storage;
            item.stack.guildStorage = it->stack.guild_storage;

            item.noUse.override = it->item_usage.override;
            item.noUse.sitting = it->item_usage.sitting;

            item.trade.override = it->gm_lv_trade_override;
            item.trade.noDrop = it->flag.trade_restriction.drop;
            item.trade.noTrade = it->flag.trade_restriction.trade;
            item.trade.tradePartner = it->flag.trade_restriction.trade_partner;
            item.trade.noSell = it->flag.trade_restriction.sell;
            item.trade.noCart = it->flag.trade_restriction.cart;
            item.trade.noStorage = it->flag.trade_restriction.storage;
            item.trade.noGuildStorage = it->flag.trade_restriction.guild_storage;
            item.trade.noMail = it->flag.trade_restriction.mail;
            item.trade.noAuction = it->flag.trade_restriction.auction;

//            item.script = it->script;
//            item.equipScript = it->equip_script;
//            item.unEquipScript = it->unequip_script;

            [items addObject:item];
        }

        completionHandler([items copy]);
    });
}

@end
