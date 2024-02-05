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

    func recordFields(with database: Database) async throws -> DatabaseRecordFields {
        var fields = DatabaseRecordFields()

        fields.append("ID", value: "#\(id)")
        fields.append("Aegis Name", value: aegisName)
        fields.append("Name", value: name)

        fields.append("Level", value: level)
        fields.append("HP", value: hp)
        fields.append("SP", value: sp)

        fields.append("Base Exp", value: baseExp)
        fields.append("Job Exp", value: jobExp)
        fields.append("MVP Exp", value: mvpExp)

        switch database.mode {
        case .prerenewal:
            let minAttack = attack
            let maxAttack = attack2
            fields.append("Attack", value: "\(minAttack)-\(maxAttack)")
        case .renewal:
            let minAttack = 8 * attack / 10 + str + level
            let maxAttack = 12 * attack / 10 + str + level
            fields.append("Attack", value: "\(minAttack)-\(maxAttack)")

            let minMagicAttack = 7 * attack2 / 10 + int + level
            let maxMagicAttack = 13 * attack2 / 10 + int + level
            fields.append("Magic Attack", value: "\(minMagicAttack)-\(maxMagicAttack)")
        }

        fields.append("Defense", value: defense)
        fields.append("Magic Defense", value: magicDefense)

        fields.append("Resistance", value: resistance)
        fields.append("Magic Resistance", value: magicResistance)

        fields.append("Str", value: str)
        fields.append("Agi", value: agi)
        fields.append("Vit", value: vit)
        fields.append("Int", value: int)
        fields.append("Dex", value: dex)
        fields.append("Luk", value: luk)

        fields.append("Attack Range", value: attackRange)
        fields.append("Skill Cast Range", value: skillRange)
        fields.append("Chase Range", value: chaseRange)

        fields.append("Size", value: size.description)

        fields.append("Race", value: race.description)

        // TODO: Race Groups

        fields.append("Element", value: "\(element.description) \(elementLevel)")

        fields.append("Walk Speed", value: walkSpeed.rawValue)
        fields.append("Attack Speed", value: attackDelay)
        fields.append("Attack Animation Speed", value: attackMotion)
        fields.append("Damage Animation Speed", value: damageMotion)

        // TODO: Damage Taken

        fields.append("Class", value: self.class.description)

        if let modes {
            let modeFields = modes.map { mode -> DatabaseRecordField in
                .string(mode.description, "")
            }
            fields.append("Modes", value: modeFields)
        }

        if let drops {
            var dropFields: [DatabaseRecordField] = []
            for drop in drops {
                let item = try await database.item(for: drop.item)
                let rate = Double(drop.rate) / 100
                dropFields.append(.reference("\(item.name) (\(rate) %)", item))
            }
            if !dropFields.isEmpty {
                fields.append("Drops", value: dropFields)
            }
        }

        if let mvpDrops {
            var mvpDropFields: [DatabaseRecordField] = []
            for mvpDrop in mvpDrops {
                let item = try await database.item(for: mvpDrop.item)
                let rate = Double(mvpDrop.rate) / 100
                mvpDropFields.append(.reference("\(item.name) (\(rate) %)", item))
            }
            if !mvpDropFields.isEmpty {
                fields.append("MVP Drops", value: mvpDropFields)
            }
        }

        return fields
    }
}
