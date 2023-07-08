//
//  RAItemDatabase.m
//  rAthena
//
//  Created by Leon Li on 2023/6/25.
//

#import "RAItemDatabase.h"
#import "RAJobDatabase.h"
#include "map/itemdb.hpp"
#include "map/pc.hpp"

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

- (void)recoverCache:(NSMutableDictionary<NSNumber *, RADatabaseRecord *> *)cache {
    for (auto entry = item_db.begin(); entry != item_db.end(); ++entry) {
        RAItem *item = [[RAItem alloc] initWithItem:entry->second];
        cache[@(item.itemID)] = item;
    }
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
        _jobs = NSArrayFromUInt64Array(item->class_base, 3);
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
    NSMutableArray<RADatabaseRecordField *> *fields = [NSMutableArray array];

    [fields ra_addFieldWithName:@"Type" stringValue:NSStringFromRAItemType(self.type)];

    if (self.type == RA_IT_WEAPON) {
        [fields ra_addFieldWithName:@"Weapon Type" stringValue:NSStringFromRAWeaponType(self.subType)];
    } else if (self.type == RA_IT_AMMO) {
        [fields ra_addFieldWithName:@"Ammo Type" stringValue:NSStringFromRAAmmoType(self.subType)];
    } else if (self.type == RA_IT_CARD) {
        [fields ra_addFieldWithName:@"Card Type" stringValue:NSStringFromRACardType(self.subType)];
    }

    [fields ra_addFieldWithName:@"Buy" stringValue:[NSString stringWithFormat:@"%ldz", self.buy]];
    [fields ra_addFieldWithName:@"Sell" stringValue:[NSString stringWithFormat:@"%ldz", self.sell]];

    [fields ra_addFieldWithName:@"Weight" numberValue:@(self.weight)];

    if (self.type == RA_IT_WEAPON) {
        [fields ra_addFieldWithName:@"Attack" numberValue:@(self.attack)];
        [fields ra_addFieldWithName:@"Magic Attack" numberValue:@(self.magicAttack)];
        [fields ra_addFieldWithName:@"Attack Range" numberValue:@(self.range)];
        [fields ra_addFieldWithName:@"Weapon Level" numberValue:@(self.weaponLevel)];
    }

    if (self.type == RA_IT_ARMOR) {
        [fields ra_addFieldWithName:@"Defense" numberValue:@(self.defense)];
        [fields ra_addFieldWithName:@"Armor Level" numberValue:@(self.armorLevel)];
    }

    [fields ra_addFieldWithName:@"Slots" numberValue:@(self.slots)];

    // TODO: Jobs & Classes

    [fields ra_addFieldWithName:@"Gender" stringValue:NSStringFromRASex(self.gender)];

    // TODO: Locations

    [fields ra_addFieldWithName:@"Minimum Level" numberValue:@(self.equipLevelMin)];
    [fields ra_addFieldWithName:@"Maximum Level" numberValue:@(self.equipLevelMax)];

    [fields ra_addFieldWithName:@"Refinable" numberValue:@(self.refineable)];
    [fields ra_addFieldWithName:@"Gradable" numberValue:@(self.gradable)];

    // TODO: View

    // TODO: Alias Name

    NSArray<RADatabaseRecord *> *jobs = [[RAJobDatabase sharedDatabase] allRecords];
    NSMutableArray<RADatabaseRecord *> *equippableJobs = [NSMutableArray arrayWithCapacity:jobs.count];
    for (RADatabaseRecord *job in jobs) {
        NSInteger jobID = job.recordID;
        if ([self canBeEquippedByJob:jobID]) {
            [equippableJobs addObject:job];
        }
    }
    [fields ra_addFieldWithName:@"Jobs" referenceArrayValue:equippableJobs];

    return [fields copy];
}

/// @discussion See function @c pc_job_can_use_item in pc.cpp
/// @discussion See function @c pc_isItemClass in pc.cpp
- (BOOL)canBeEquippedByJob:(NSInteger)jobID {
    uint64 clazz = pc_jobid2mapid(jobID);

    // Calculate the required bit to check
    uint64 job = 1ULL << ( clazz & MAPID_BASEMASK );

    size_t index;

    // 2-1
    if( ( clazz & JOBL_2_1 ) != 0 ){
        index = 1;
    // 2-2
    }else if( ( clazz & JOBL_2_2 ) != 0 ){
        index = 2;
    // Basejob
    }else{
        index = 0;
    }

    if (( self.jobs[index].unsignedIntegerValue & job ) == 0) {
        return NO;
    }

    if (self.classes&ITEMJ_NORMAL && !(clazz&(JOBL_UPPER|JOBL_BABY|JOBL_THIRD|JOBL_FOURTH)))    //normal classes (no upper, no baby, no third, no fourth)
        return YES;
#ifndef RENEWAL
    //allow third classes to use trans. class items
    if (self.classes&ITEMJ_UPPER && clazz&(JOBL_UPPER|JOBL_THIRD))    //trans. classes
        return YES;
    //third-baby classes can use same item too
    if (self.classes&ITEMJ_BABY && clazz&JOBL_BABY)    //baby classes
        return YES;
    //don't need to decide specific rules for third-classes?
    //items for third classes can be used for all third classes
    if (self.classes&(ITEMJ_THIRD|ITEMJ_THIRD_UPPER|ITEMJ_THIRD_BABY) && clazz&JOBL_THIRD)
        return YES;
#else
    //trans. classes (exl. third-trans.)
    if (self.classes&ITEMJ_UPPER && clazz&JOBL_UPPER && !(clazz&JOBL_THIRD))
        return YES;
    //baby classes (exl. third-baby)
    if (self.classes&ITEMJ_BABY && clazz&JOBL_BABY && !(clazz&JOBL_THIRD))
        return YES;
    //third classes (exl. third-trans. and baby-third and fourth)
    if (self.classes&ITEMJ_THIRD && clazz&JOBL_THIRD && !(clazz&(JOBL_UPPER|JOBL_BABY)) && !(clazz&JOBL_FOURTH))
        return YES;
    //trans-third classes (exl. fourth)
    if (self.classes&ITEMJ_THIRD_UPPER && clazz&JOBL_THIRD && clazz&JOBL_UPPER && !(clazz&JOBL_FOURTH))
        return YES;
    //third-baby classes (exl. fourth)
    if (self.classes&ITEMJ_THIRD_BABY && clazz&JOBL_THIRD && clazz&JOBL_BABY && !(clazz&JOBL_FOURTH))
        return YES;
    //fourth classes
    if (self.classes&ITEMJ_FOURTH && clazz&JOBL_FOURTH)
        return YES;
#endif

    return NO;
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
