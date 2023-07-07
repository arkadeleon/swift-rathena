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

- (void)buildRecordFieldsWithBuilder:(RADatabaseRecordFieldsBuilder *)builder {
    [builder addFieldWithName:@"ID" stringValue:[NSString stringWithFormat:@"#%ld", (long)self.monsterID]];
    [builder addFieldWithName:@"Aegis Name" stringValue:self.aegisName];
    [builder addFieldWithName:@"Name" stringValue:self.name];
    [builder addFieldWithName:@"Level" numberValue:@(self.level)];
    [builder addFieldWithName:@"HP" numberValue:@(self.hp)];
    [builder addFieldWithName:@"SP" numberValue:@(self.sp)];

    [builder addFieldWithName:@"Base Exp" numberValue:@(self.baseExp)];
    [builder addFieldWithName:@"Job Exp" numberValue:@(self.jobExp)];
    [builder addFieldWithName:@"MVP Exp" numberValue:@(self.mvpExp)];

#ifdef RENEWAL
    NSInteger minAttack = 8 * self.attack / 10 + self.strength + self.level;
    NSInteger maxAttack = 12 * self.attack / 10 + self.strength + self.level;
#else
    NSInteger minAttack = self.attack;
    NSInteger maxAttack = self.attack2;
#endif
    [builder addFieldWithName:@"Attack" stringValue:[NSString stringWithFormat:@"%ld-%ld", minAttack, maxAttack]];

#ifdef RENEWAL
    NSInteger minMagicAttack = 7 * self.attack2 / 10 + self.intelligence + self.level;
    NSInteger maxMagicAttack = 13 * self.attack2 / 10 + self.intelligence + self.level;
    [builder addFieldWithName:@"Magic Attack" stringValue:[NSString stringWithFormat:@"%ld-%ld", minMagicAttack, maxMagicAttack]];
#endif

    [builder addFieldWithName:@"Defense" numberValue:@(self.defense)];
    [builder addFieldWithName:@"Magic Defense" numberValue:@(self.magicDefense)];

    [builder addFieldWithName:@"Resistance" numberValue:@(self.resistance)];
    [builder addFieldWithName:@"Magic Resistance" numberValue:@(self.magicResistance)];

    [builder addFieldWithName:@"Str" numberValue:@(self.strength)];
    [builder addFieldWithName:@"Agi" numberValue:@(self.agility)];
    [builder addFieldWithName:@"Vit" numberValue:@(self.vitality)];
    [builder addFieldWithName:@"Int" numberValue:@(self.intelligence)];
    [builder addFieldWithName:@"Dex" numberValue:@(self.dexterity)];
    [builder addFieldWithName:@"Luk" numberValue:@(self.luck)];

    [builder addFieldWithName:@"Attack Range" numberValue:@(self.attackRange)];
    [builder addFieldWithName:@"Skill Cast Range" numberValue:@(self.skillRange)];
    [builder addFieldWithName:@"Chase Range" numberValue:@(self.chaseRange)];

    [builder addFieldWithName:@"Size" stringValue:NSStringFromRASize(self.size)];

    [builder addFieldWithName:@"Race" stringValue:NSStringFromRARace(self.race)];

    // TODO: Race Groups

    [builder addFieldWithName:@"Element" stringValue:[NSString stringWithFormat:@"%@ %ld", NSStringFromRAElement(self.element), self.elementLevel]];

    [builder addFieldWithName:@"Walk Speed" numberValue:@(self.walkSpeed)];
    [builder addFieldWithName:@"Attack Speed" numberValue:@(self.attackDelay)];
    [builder addFieldWithName:@"Attack Animation Speed" numberValue:@(self.attackMotion)];
    [builder addFieldWithName:@"Damage Animation Speed" numberValue:@(self.damageMotion)];

    // TODO: Damage Taken

    [builder addFieldWithName:@"Class" stringValue:NSStringFromRAMonsterClass(self.monsterClass)];

    // TODO: Modes

    [builder addFieldWithName:@"Drops" referenceArrayValue:self.drops];
    [builder addFieldWithName:@"MVP Drops" referenceArrayValue:self.mvpDrops];
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

- (void)buildRecordFieldsWithBuilder:(RADatabaseRecordFieldsBuilder *)builder {
    RADatabaseRecord *item = [[RAItemDatabase sharedDatabase] recordWithID:self.itemID];
    [item buildRecordFieldsWithBuilder:builder];
}

@end
