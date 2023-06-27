//
//  RAMonsterDatabase.m
//  rAthena
//
//  Created by Leon Li on 2023/6/27.
//

#import "RAMonsterDatabase.h"
#import "RAMonster2.h"
#include "map/mob.hpp"

@implementation RAMonsterDatabase

- (void)fetchMonstersWithCompletionHandler:(void (^)(NSArray<RAMonster2 *> *))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSMutableArray<RAMonster2 *> *monsters = [NSMutableArray arrayWithCapacity:mob_db.size()];

        for (auto entry = mob_db.begin(); entry != mob_db.end(); ++entry) {
            auto mob = entry->second;

            RAMonster2 *monster = [[RAMonster2 alloc] init];
            monster.monsterID = mob->id;
            monster.aegisName = [NSString stringWithUTF8String:mob->sprite.c_str()];
            monster.name = [NSString stringWithUTF8String:mob->name.c_str()];
            monster.japaneseName = [NSString stringWithUTF8String:mob->jname.c_str()];
            monster.level = mob->lv;
            monster.hp = mob->status.max_hp;
            monster.sp = mob->status.max_sp;
            monster.baseExp = mob->base_exp;
            monster.jobExp = mob->job_exp;
            monster.mvpExp = mob->mexp;
            monster.attack = mob->status.rhw.atk;
#ifdef RENEWAL
            monster.attack2 = mob->status.rhw.matk;
#else
            monster.attack2 = mob->status.rhw.atk2;
#endif
            monster.defense = mob->status.def;
            monster.magicDefense = mob->status.mdef;
            monster.resistance = mob->status.res;
            monster.magicResistance = mob->status.mres;
            monster.strength = mob->status.str;
            monster.agility = mob->status.agi;
            monster.vitality = mob->status.vit;
            monster.intelligence = mob->status.int_;
            monster.dexterity = mob->status.dex;
            monster.luck = mob->status.luk;
            monster.attackRange = mob->status.rhw.range;
            monster.skillRange = mob->range2;
            monster.chaseRange = mob->range3;
            monster.size = mob->status.size;
            monster.race = mob->status.race;
//            monster.raceGroups = mob->race2;
            monster.element = mob->status.def_ele;
            monster.elementLevel = mob->status.ele_lv;
            monster.walkSpeed = mob->status.speed;
            monster.attackDelay = mob->status.adelay;
            monster.attackMotion = mob->status.amotion;
            monster.damageMotion = mob->status.dmotion;
            monster.damageTaken = mob->damagetaken;
            monster.monsterClass = mob->status.class_;
            monster.modes = mob->status.mode;

            NSMutableArray<RAMonsterDrop2 *> *mvpDrops = [NSMutableArray arrayWithCapacity:MAX_MVP_DROP_TOTAL];
            for (int i = 0; i < MAX_MVP_DROP_TOTAL; i++) {
                auto it = mob->mvpitem[i];
                if (it.nameid == 0) {
                    continue;
                }
                RAMonsterDrop2 *drop = [[RAMonsterDrop2 alloc] init];
                drop.itemID = it.nameid;
                drop.rate = it.rate;
                drop.stealProtected = it.steal_protected;
                drop.randomOptionGroup = it.randomopt_group;
                [mvpDrops addObject:drop];
            }
            monster.mvpDrops = mvpDrops;

            NSMutableArray<RAMonsterDrop2 *> *drops = [NSMutableArray arrayWithCapacity:MAX_MOB_DROP_TOTAL];
            for (int i = 0; i < MAX_MOB_DROP_TOTAL; i++) {
                auto it = mob->dropitem[i];
                if (it.nameid == 0) {
                    continue;
                }
                RAMonsterDrop2 *drop = [[RAMonsterDrop2 alloc] init];
                drop.itemID = it.nameid;
                drop.rate = it.rate;
                drop.stealProtected = it.steal_protected;
                drop.randomOptionGroup = it.randomopt_group;
                [drops addObject:drop];
            }
            monster.drops = drops;

            [monsters addObject:monster];
        }

        completionHandler([monsters copy]);
    });
}

@end
