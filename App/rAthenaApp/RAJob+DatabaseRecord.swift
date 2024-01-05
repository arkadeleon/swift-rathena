//
//  RAJob+DatabaseRecord.swift
//  rAthenaApp
//
//  Created by Leon Li on 2024/1/4.
//

import rAthenaCommon
import rAthenaMap

extension RAJob: DatabaseRecord {
    var recordID: Int {
        jobID
    }

    var recordTitle: String {
        jobName
    }

    var recordFields: [DatabaseRecordField] {
        var fields: [DatabaseRecordField] = []

        fields += [
            .string("Max Weight", "\(maxWeight)"),
            .string("HP Factor", "\(hpFactor)"),
            .string("HP Increase", "\(hpIncrease)"),
            .string("SP Increase", "\(spIncrease)"),
        ]

        let baseASPDFields = baseASPD.enumerated().map { (weaponType, baseASPD) in
            DatabaseRecordField.string(NSStringFromRAWeaponType(weaponType), baseASPD.stringValue)
        }
        fields += [.array("Base ASPD", baseASPDFields)]

        let bonusStatsFields = bonusStats.enumerated().map { (level, bonusStats) in
            let levelBonusStatsFields = bonusStats.enumerated().map { (parameter, levelBonusStats) in
                DatabaseRecordField.string(NSStringFromRAParameter(parameter), levelBonusStats.stringValue)
            }
            return DatabaseRecordField.array("Level \(level + 1)", levelBonusStatsFields)
        }
        fields += [.array("Bonus Stats", bonusStatsFields)]

        let maxStatsFields = maxStats.enumerated().map { (parameter, maxStats) in
            DatabaseRecordField.string(NSStringFromRAParameter(parameter), maxStats.stringValue)
        }
        fields += [.array("Max Stats", maxStatsFields)]

        fields += [.string("Max Base Level", "\(maxBaseLevel)")]

        let baseExpFields = baseExp[0..<(maxBaseLevel - 1)].enumerated().map { (level, baseExp) in
            DatabaseRecordField.string("Level \(level + 1)", baseExp.stringValue)
        }
        fields += [.array("Base Exp", baseExpFields)]

        fields += [.string("Max Job Level", "\(maxJobLevel)")]

        let jobExpFields = jobExp[0..<(maxJobLevel - 1)].enumerated().map { (level, jobExp) in
            DatabaseRecordField.string("Level \(level + 1)", jobExp.stringValue)
        }
        fields += [.array("Job Exp", jobExpFields)]

        let baseHpFields = baseHp.enumerated().map { (level, baseHp) in
            DatabaseRecordField.string("Level \(level + 1)", baseHp.stringValue)
        }
        fields += [.array("Base HP", baseHpFields)]

        let baseSpFields = baseSp.enumerated().map { (level, baseSp) in
            DatabaseRecordField.string("Level \(level + 1)", baseSp.stringValue)
        }
        fields += [.array("Base SP", baseSpFields)]

        let baseApFields = baseAp.enumerated().map { (level, baseAp) in
            DatabaseRecordField.string("Level \(level + 1)", baseAp.stringValue)
        }
        fields += [.array("Base AP", baseApFields)]

        if let skillTree = RASkillTreeDatabase.shared.record(withID: jobID) {
            fields += [.reference("Skill Tree", skillTree)]
        }

        return fields
    }
}
