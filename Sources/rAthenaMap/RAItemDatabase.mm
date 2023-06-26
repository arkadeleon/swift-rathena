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

        std::map<t_itemid, std::shared_ptr<item_data>> sorted_itemdb(item_db.begin(), item_db.end());
        for (auto entry = sorted_itemdb.begin(); entry != sorted_itemdb.end(); ++entry) {
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

            RAItemFlags2 *flags = [[RAItemFlags2 alloc] init];
            flags.buyingStore = it->flag.buyingstore;
            flags.deadBranch = it->flag.dead_branch;
            flags.container = it->flag.group;
            flags.uniqueId = it->flag.guid;
            flags.bindOnEquip = it->flag.bindOnEquip;
            flags.dropAnnounce = it->flag.broadcast;
            flags.noConsume = (it->flag.delay_consume & DELAYCONSUME_NOCONSUME) != 0;
            flags.dropEffect = it->flag.dropEffect;
            item.flags = flags;

            RAItemDelay2 *delay = [[RAItemDelay2 alloc] init];
            delay.duration = it->delay.duration;
            delay.status = it->delay.sc;
            item.delay = delay;

            RAItemStack2 *stack = [[RAItemStack2 alloc] init];
            stack.amount = it->stack.amount;
            stack.inventory = it->stack.inventory;
            stack.cart = it->stack.cart;
            stack.storage = it->stack.storage;
            stack.guildStorage = it->stack.guild_storage;
            item.stack = stack;

            RAItemNoUse2 *noUse = [[RAItemNoUse2 alloc] init];
            noUse.override = it->item_usage.override;
            noUse.sitting = it->item_usage.sitting;
            item.noUse = noUse;

            RAItemTrade2 *trade = [[RAItemTrade2 alloc] init];
            trade.override = it->gm_lv_trade_override;
            trade.noDrop = it->flag.trade_restriction.drop;
            trade.noTrade = it->flag.trade_restriction.trade;
            trade.tradePartner = it->flag.trade_restriction.trade_partner;
            trade.noSell = it->flag.trade_restriction.sell;
            trade.noCart = it->flag.trade_restriction.cart;
            trade.noStorage = it->flag.trade_restriction.storage;
            trade.noGuildStorage = it->flag.trade_restriction.guild_storage;
            trade.noMail = it->flag.trade_restriction.mail;
            trade.noAuction = it->flag.trade_restriction.auction;
            item.trade = trade;

//            item.script = it->script;
//            item.equipScript = it->equip_script;
//            item.unEquipScript = it->unequip_script;

            [items addObject:item];
        }

        completionHandler([items copy]);
    });
}

@end
