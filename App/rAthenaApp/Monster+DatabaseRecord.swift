//
//  Monster+DatabaseRecord.swift
//  rAthenaApp
//
//  Created by Leon Li on 2024/1/4.
//

import rAthenaCommon
import rAthenaDatabase

extension Monster: DatabaseRecord {
    var recordID: Int {
        id
    }

    var recordTitle: String {
        name
    }

    var recordFields: [DatabaseRecordField] {
        var fields: [DatabaseRecordField] = []

        fields += [
            .string("ID", "#\(id)"),
            .string("Aegis Name", aegisName),
            .string("Name", name),
        ]

        fields += [
            .string("Level", "\(level)"),
            .string("HP", "\(hp)"),
            .string("SP", "\(sp)"),
        ]

        fields += [
            .string("Base Exp", "\(baseExp)"),
            .string("Job Exp", "\(jobExp)"),
            .string("MVP Exp", "\(mvpExp)"),
        ]

        if RA_RENEWAL.boolValue {
            let minAttack = 8 * attack / 10 + str + level
            let maxAttack = 12 * attack / 10 + str + level
            fields += [.string("Attack", "\(minAttack)-\(maxAttack)")]
        } else {
            let minAttack = attack
            let maxAttack = attack2
            fields += [.string("Attack", "\(minAttack)-\(maxAttack)")]
        }

        if RA_RENEWAL.boolValue {
            let minMagicAttack = 7 * attack2 / 10 + int + level
            let maxMagicAttack = 13 * attack2 / 10 + int + level
            fields += [.string("Magic Attack", "\(minMagicAttack)-\(maxMagicAttack)")]
        }

//        [fields ra_addFieldWithName:@"Defense" numberValue:@(self.defense)];
//        [fields ra_addFieldWithName:@"Magic Defense" numberValue:@(self.magicDefense)];
//
//        [fields ra_addFieldWithName:@"Resistance" numberValue:@(self.resistance)];
//        [fields ra_addFieldWithName:@"Magic Resistance" numberValue:@(self.magicResistance)];
//
//        [fields ra_addFieldWithName:@"Str" numberValue:@(self.strength)];
//        [fields ra_addFieldWithName:@"Agi" numberValue:@(self.agility)];
//        [fields ra_addFieldWithName:@"Vit" numberValue:@(self.vitality)];
//        [fields ra_addFieldWithName:@"Int" numberValue:@(self.intelligence)];
//        [fields ra_addFieldWithName:@"Dex" numberValue:@(self.dexterity)];
//        [fields ra_addFieldWithName:@"Luk" numberValue:@(self.luck)];
//
//        [fields ra_addFieldWithName:@"Attack Range" numberValue:@(self.attackRange)];
//        [fields ra_addFieldWithName:@"Skill Cast Range" numberValue:@(self.skillRange)];
//        [fields ra_addFieldWithName:@"Chase Range" numberValue:@(self.chaseRange)];
//
//        [fields ra_addFieldWithName:@"Size" stringValue:NSStringFromRASize(self.size)];
//
//        [fields ra_addFieldWithName:@"Race" stringValue:NSStringFromRARace(self.race)];
//
//        // TODO: Race Groups
//
//        [fields ra_addFieldWithName:@"Element" stringValue:[NSString stringWithFormat:@"%@ %ld", NSStringFromRAElement(self.element), self.elementLevel]];
//
//        [fields ra_addFieldWithName:@"Walk Speed" numberValue:@(self.walkSpeed)];
//        [fields ra_addFieldWithName:@"Attack Speed" numberValue:@(self.attackDelay)];
//        [fields ra_addFieldWithName:@"Attack Animation Speed" numberValue:@(self.attackMotion)];
//        [fields ra_addFieldWithName:@"Damage Animation Speed" numberValue:@(self.damageMotion)];
//
//        // TODO: Damage Taken
//
//        [fields ra_addFieldWithName:@"Class" stringValue:NSStringFromRAMonsterClass(self.monsterClass)];

        if let modes {
            let modeFields = modes.map { mode -> DatabaseRecordField in
                .string(mode.rawValue, "")
            }
            fields += [.array("Modes", modeFields)]
        }

//        NSMutableArray<RADatabaseRecordField *> *dropFields = [NSMutableArray arrayWithCapacity:self.drops.count];
//        for (RAMonsterDrop *drop in self.drops) {
//            RAItem *item = [[RAItemDatabase sharedDatabase] recordWithID:drop.itemID];
//            NSString *name = [NSString stringWithFormat:@"%@ (%@ %%)", item.name, @(drop.rate / 100.0)];
//            [dropFields ra_addFieldWithName:name referenceValue:item];
//        }
//        [fields ra_addFieldWithName:@"Drops" arrayValue:dropFields];
//
//        NSMutableArray<RADatabaseRecordField *> *mvpDropFields = [NSMutableArray arrayWithCapacity:self.mvpDrops.count];
//        for (RAMonsterDrop *drop in self.mvpDrops) {
//            RAItem *item = [[RAItemDatabase sharedDatabase] recordWithID:drop.itemID];
//            NSString *name = [NSString stringWithFormat:@"%@ (%@ %%)", item.name, @(drop.rate / 100.0)];
//            [mvpDropFields ra_addFieldWithName:name referenceValue:item];
//        }
//        [fields ra_addFieldWithName:@"MVP Drops" arrayValue:mvpDropFields];

        return fields
    }
}
