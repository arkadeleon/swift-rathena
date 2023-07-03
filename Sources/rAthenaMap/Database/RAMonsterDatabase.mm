//
//  RAMonsterDatabase.m
//  rAthena
//
//  Created by Leon Li on 2023/6/27.
//

#import "RAMonsterDatabase.h"
#include "map/mob.hpp"

@interface RAMonsterDatabase ()

@property (nonatomic, copy) NSArray<RAMonster *> *cachedMonsters;

@end

@interface RAMonster ()

- (instancetype)initWithMob:(std::shared_ptr<s_mob_db>)mob;

@end

@interface RAMonsterDrop ()

- (instancetype)initWithDrop:(s_mob_drop)drop;

@end

@implementation RAMonsterDatabase

+ (RAMonsterDatabase *)sharedDatabase {
    static RAMonsterDatabase *sharedDatabase = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDatabase = [[RAMonsterDatabase alloc] init];
    });
    return sharedDatabase;
}

- (NSString *)name {
    return @"Monster Database";
}

- (void)loadWithCompletionHandler:(void (^)(NSArray<RAMonster *> *))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (self.cachedMonsters.count > 0) {
            completionHandler(self.cachedMonsters);
            return;
        }

        auto db = mob_db;
        NSMutableArray<RAMonster *> *monsters = [NSMutableArray arrayWithCapacity:db.size()];
        for (auto entry = db.begin(); entry != db.end(); ++entry) {
            RAMonster *monster = [[RAMonster alloc] initWithMob:entry->second];
            [monsters addObject:monster];
        }
        [monsters sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"monsterID" ascending:YES]]];

        self.cachedMonsters = monsters;

        completionHandler(self.cachedMonsters);
    });
}

@end

@implementation RAMonster

- (instancetype)initWithMob:(std::shared_ptr<s_mob_db>)mob {
    self = [super init];
    if (self) {
        _monsterID = mob->id;
        _aegisName = [NSString stringWithUTF8String:mob->sprite.c_str()];
        _name = [NSString stringWithUTF8String:mob->name.c_str()];
        _japaneseName = [NSString stringWithUTF8String:mob->jname.c_str()];
        _level = mob->lv;
        _hp = mob->status.max_hp;
        _sp = mob->status.max_sp;
        _baseExp = mob->base_exp;
        _jobExp = mob->job_exp;
        _mvpExp = mob->mexp;
        _attack = mob->status.rhw.atk;
#ifdef RENEWAL
        _attack2 = mob->status.rhw.matk;
#else
        _attack2 = mob->status.rhw.atk2;
#endif
        _defense = mob->status.def;
        _magicDefense = mob->status.mdef;
        _resistance = mob->status.res;
        _magicResistance = mob->status.mres;
        _strength = mob->status.str;
        _agility = mob->status.agi;
        _vitality = mob->status.vit;
        _intelligence = mob->status.int_;
        _dexterity = mob->status.dex;
        _luck = mob->status.luk;
        _attackRange = mob->status.rhw.range;
        _skillRange = mob->range2;
        _chaseRange = mob->range3;
        _size = mob->status.size;
        _race = mob->status.race;

        NSMutableArray<NSNumber *> *raceGroups = [NSMutableArray arrayWithCapacity:mob->race2.size()];
        for (auto race2 : mob->race2) {
            [raceGroups addObject:@(race2)];
        }
        _raceGroups = [raceGroups copy];

        _element = mob->status.def_ele;
        _elementLevel = mob->status.ele_lv;
        _walkSpeed = mob->status.speed;
        _attackDelay = mob->status.adelay;
        _attackMotion = mob->status.amotion;
        _damageMotion = mob->status.dmotion;
        _damageTaken = mob->damagetaken;
        _monsterClass = mob->status.class_;
        _modes = mob->status.mode;

        NSMutableArray<RAMonsterDrop *> *mvpDrops = [NSMutableArray arrayWithCapacity:MAX_MVP_DROP_TOTAL];
        for (int i = 0; i < MAX_MVP_DROP_TOTAL; i++) {
            auto it = mob->mvpitem[i];
            if (it.nameid == 0) {
                continue;
            }
            RAMonsterDrop *drop = [[RAMonsterDrop alloc] initWithDrop:it];
            [mvpDrops addObject:drop];
        }
        _mvpDrops = [mvpDrops copy];

        NSMutableArray<RAMonsterDrop *> *drops = [NSMutableArray arrayWithCapacity:MAX_MOB_DROP_TOTAL];
        for (int i = 0; i < MAX_MOB_DROP_TOTAL; i++) {
            auto it = mob->dropitem[i];
            if (it.nameid == 0) {
                continue;
            }
            RAMonsterDrop *drop = [[RAMonsterDrop alloc] initWithDrop:it];
            [drops addObject:drop];
        }
        _drops = [drops copy];
    }
    return self;
}

- (NSInteger)recordID {
    return self.monsterID;
}

- (NSString *)recordTitle {
    return self.name;
}

- (RADatabaseRecordFieldCollection *)recordFieldCollection {
    RADatabaseRecordFieldCollection *recordFieldCollection = [[RADatabaseRecordFieldCollection alloc] init];

    [recordFieldCollection addRecordFieldWithName:@"Level" stringValue:@(self.level).stringValue];
    [recordFieldCollection addRecordFieldWithName:@"HP" stringValue:@(self.hp).stringValue];
    [recordFieldCollection addRecordFieldWithName:@"SP" stringValue:@(self.hp).stringValue];

    return recordFieldCollection;
}

@end

@implementation RAMonsterDrop

- (instancetype)initWithDrop:(s_mob_drop)drop {
    self = [super init];
    if (self) {
        _itemID = drop.nameid;
        _rate = drop.rate;
        _stealProtected = drop.steal_protected;
        _randomOptionGroupID = drop.randomopt_group;
    }
    return self;
}

@end
