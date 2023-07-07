//
//  RAMonsterDatabase.m
//  rAthena
//
//  Created by Leon Li on 2023/6/27.
//

#import "RAMonsterDatabase.h"
#import "RAItemDatabase.h"
#include "map/mob.hpp"

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

- (void)recoverCache:(NSMutableDictionary<NSNumber *, RADatabaseRecord *> *)cache {
    for (auto entry = mob_db.begin(); entry != mob_db.end(); ++entry) {
        RAMonster *monster = [[RAMonster alloc] initWithMob:entry->second];
        cache[@(monster.monsterID)] = monster;
    }
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

- (NSArray<RADatabaseRecordField *> *)recordFields {
    NSMutableArray<RADatabaseRecordField *> *fields = [NSMutableArray array];

    [fields ra_addFieldWithName:@"ID" stringValue:[NSString stringWithFormat:@"#%ld", (long)self.monsterID]];
    [fields ra_addFieldWithName:@"Aegis Name" stringValue:self.aegisName];
    [fields ra_addFieldWithName:@"Name" stringValue:self.name];
    [fields ra_addFieldWithName:@"Level" numberValue:@(self.level)];
    [fields ra_addFieldWithName:@"HP" numberValue:@(self.hp)];
    [fields ra_addFieldWithName:@"SP" numberValue:@(self.sp)];

    [fields ra_addFieldWithName:@"Base Exp" numberValue:@(self.baseExp)];
    [fields ra_addFieldWithName:@"Job Exp" numberValue:@(self.jobExp)];
    [fields ra_addFieldWithName:@"MVP Exp" numberValue:@(self.mvpExp)];

#ifdef RENEWAL
    NSInteger minAttack = 8 * self.attack / 10 + self.strength + self.level;
    NSInteger maxAttack = 12 * self.attack / 10 + self.strength + self.level;
#else
    NSInteger minAttack = self.attack;
    NSInteger maxAttack = self.attack2;
#endif
    [fields ra_addFieldWithName:@"Attack" stringValue:[NSString stringWithFormat:@"%ld-%ld", minAttack, maxAttack]];

#ifdef RENEWAL
    NSInteger minMagicAttack = 7 * self.attack2 / 10 + self.intelligence + self.level;
    NSInteger maxMagicAttack = 13 * self.attack2 / 10 + self.intelligence + self.level;
    [fields ra_addFieldWithName:@"Magic Attack" stringValue:[NSString stringWithFormat:@"%ld-%ld", minMagicAttack, maxMagicAttack]];
#endif

    [fields ra_addFieldWithName:@"Defense" numberValue:@(self.defense)];
    [fields ra_addFieldWithName:@"Magic Defense" numberValue:@(self.magicDefense)];

    [fields ra_addFieldWithName:@"Resistance" numberValue:@(self.resistance)];
    [fields ra_addFieldWithName:@"Magic Resistance" numberValue:@(self.magicResistance)];

    [fields ra_addFieldWithName:@"Str" numberValue:@(self.strength)];
    [fields ra_addFieldWithName:@"Agi" numberValue:@(self.agility)];
    [fields ra_addFieldWithName:@"Vit" numberValue:@(self.vitality)];
    [fields ra_addFieldWithName:@"Int" numberValue:@(self.intelligence)];
    [fields ra_addFieldWithName:@"Dex" numberValue:@(self.dexterity)];
    [fields ra_addFieldWithName:@"Luk" numberValue:@(self.luck)];

    [fields ra_addFieldWithName:@"Attack Range" numberValue:@(self.attackRange)];
    [fields ra_addFieldWithName:@"Skill Cast Range" numberValue:@(self.skillRange)];
    [fields ra_addFieldWithName:@"Chase Range" numberValue:@(self.chaseRange)];

    [fields ra_addFieldWithName:@"Size" stringValue:NSStringFromRASize(self.size)];

    [fields ra_addFieldWithName:@"Race" stringValue:NSStringFromRARace(self.race)];

    // TODO: Race Groups

    [fields ra_addFieldWithName:@"Element" stringValue:[NSString stringWithFormat:@"%@ %ld", NSStringFromRAElement(self.element), self.elementLevel]];

    [fields ra_addFieldWithName:@"Walk Speed" numberValue:@(self.walkSpeed)];
    [fields ra_addFieldWithName:@"Attack Speed" numberValue:@(self.attackDelay)];
    [fields ra_addFieldWithName:@"Attack Animation Speed" numberValue:@(self.attackMotion)];
    [fields ra_addFieldWithName:@"Damage Animation Speed" numberValue:@(self.damageMotion)];

    // TODO: Damage Taken

    [fields ra_addFieldWithName:@"Class" stringValue:NSStringFromRAMonsterClass(self.monsterClass)];

    // TODO: Modes

    [fields ra_addFieldWithName:@"Drops" referenceArrayValue:self.drops];
    [fields ra_addFieldWithName:@"MVP Drops" referenceArrayValue:self.mvpDrops];

    return [fields copy];
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

- (NSInteger)recordID {
    return self.itemID;
}

- (NSString *)recordTitle {
    RADatabaseRecord *item = [[RAItemDatabase sharedDatabase] recordWithID:self.itemID];
    return item.recordTitle;
}

- (NSString *)recordSubtitle {
    return [NSString stringWithFormat:@"%@ %%", @(self.rate / 100.0)];
}

- (NSArray<RADatabaseRecordField *> *)recordFields {
    RADatabaseRecord *item = [[RAItemDatabase sharedDatabase] recordWithID:self.itemID];
    return item.recordFields;
}

@end
