//
//  Skill+DatabaseRecord.swift
//  rAthenaApp
//
//  Created by Leon Li on 2024/1/4.
//

import rAthenaDatabase

extension Skill: DatabaseRecord {
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
            .string("Maximum Level", "\(maxLevel)"),
            .string("Type", type.description),
            .string("Target Type", targetType.description),
        ]

        // TODO: Damage Flags

        // TODO: Flags

//        [fields ra_addFieldWithName:@"Range" arrayValue:[self fieldsWithNumbers:self.range]];
//
//        // TODO: Hit
//
//        [fields ra_addFieldWithName:@"Hit Count" arrayValue:[self fieldsWithNumbers:self.hitCount]];
//
//        [fields ra_addFieldWithName:@"Element" arrayValue:[self fieldsWithNumbers:self.element transform:^NSString *(NSNumber *element) {
//            return NSStringFromRAElement(element.integerValue);
//        }]];
//
//        [fields ra_addFieldWithName:@"Splash Area" arrayValue:[self fieldsWithNumbers:self.splashArea]];
//
//        [fields ra_addFieldWithName:@"Maximum Active Instances" arrayValue:[self fieldsWithNumbers:self.activeInstance]];
//
//        [fields ra_addFieldWithName:@"Knockback" arrayValue:[self fieldsWithNumbers:self.knockback]];
//
//        [fields ra_addFieldWithName:@"Give AP" arrayValue:[self fieldsWithNumbers:self.giveAp]];
//
//        // TODO: Copy Flags
//
//        // TODO: No Near NPC
//
//        [fields ra_addFieldWithName:@"Cancel Cast When Hit" numberValue:@(self.castCancel)];
//        [fields ra_addFieldWithName:@"Defense Reducation Rate During Cast" numberValue:@(self.castDefenseReduction)];
//
//        [fields ra_addFieldWithName:@"Cast Time" arrayValue:[self fieldsWithNumbers:self.castTime]];
//        [fields ra_addFieldWithName:@"Action Delay After Cast" arrayValue:[self fieldsWithNumbers:self.afterCastActDelay]];
//        [fields ra_addFieldWithName:@"Walk Delay After Cast" arrayValue:[self fieldsWithNumbers:self.afterCastWalkDelay]];
//        [fields ra_addFieldWithName:@"Duration 1" arrayValue:[self fieldsWithNumbers:self.duration1]];
//        [fields ra_addFieldWithName:@"Duration 2" arrayValue:[self fieldsWithNumbers:self.duration2]];
//        [fields ra_addFieldWithName:@"Cooldown" arrayValue:[self fieldsWithNumbers:self.cooldown]];
//        [fields ra_addFieldWithName:@"Fixed Cast Time" arrayValue:[self fieldsWithNumbers:self.fixedCastTime]];
//
//        // TODO: Cast Time Flags
//
//        // TODO: Cast Delay Flags
//
//        NSMutableArray<RADatabaseRecordField *> *requirementFields = [NSMutableArray array];
//        [requirementFields ra_addFieldWithName:@"HP" arrayValue:[self fieldsWithNumbers:self.requirement.hpCost]];
//        [requirementFields ra_addFieldWithName:@"SP" arrayValue:[self fieldsWithNumbers:self.requirement.spCost]];
//        [requirementFields ra_addFieldWithName:@"AP" arrayValue:[self fieldsWithNumbers:self.requirement.apCost]];
//        [requirementFields ra_addFieldWithName:@"HP Rate" arrayValue:[self fieldsWithNumbers:self.requirement.hpRateCost]];
//        [requirementFields ra_addFieldWithName:@"SP Rate" arrayValue:[self fieldsWithNumbers:self.requirement.spRateCost]];
//        [requirementFields ra_addFieldWithName:@"AP Rate" arrayValue:[self fieldsWithNumbers:self.requirement.apRateCost]];
//        [requirementFields ra_addFieldWithName:@"Maximum HP" arrayValue:[self fieldsWithNumbers:self.requirement.maxHpTrigger]];
//        [requirementFields ra_addFieldWithName:@"Zeny" arrayValue:[self fieldsWithNumbers:self.requirement.zenyCost]];
//        // TODO: Weapon
//        // TODO: Ammo
//        [requirementFields ra_addFieldWithName:@"Ammo Amount" arrayValue:[self fieldsWithNumbers:self.requirement.ammoAmount]];
//        // TODO: State
//        // TODO: Status
//        [requirementFields ra_addFieldWithName:@"Spirit Sphere" arrayValue:[self fieldsWithNumbers:self.requirement.spiritSphereCost]];
//        // TODO: Item
//        // TODO: Equipment
//        [fields ra_addFieldWithName:@"Requirements" arrayValue:requirementFields];
//
//        // TODO: Unit
//
//        // TODO: Status

        return fields
    }

//    - (NSArray<RADatabaseRecordField *> *)fieldsWithNumbers:(NSArray<NSNumber *> *)numbers {
//        NSMutableArray<RADatabaseRecordField *> *fields = [NSMutableArray arrayWithCapacity:numbers.count];
//        for (NSInteger level = 0; level < numbers.count; level++) {
//            [fields ra_addFieldWithName:[NSString stringWithFormat:@"Level %ld", level + 1] numberValue:numbers[level]];
//        }
//        return [fields copy];
//    }

//    - (NSArray<RADatabaseRecordField *> *)fieldsWithNumbers:(NSArray<NSNumber *> *)numbers transform:(NSString *(^)(NSNumber *))transform {
//        NSMutableArray<RADatabaseRecordField *> *fields = [NSMutableArray arrayWithCapacity:numbers.count];
//        for (NSInteger level = 0; level < numbers.count; level++) {
//            [fields ra_addFieldWithName:[NSString stringWithFormat:@"Level %ld", level + 1] stringValue:transform(numbers[level])];
//        }
//        return [fields copy];
//    }
}
