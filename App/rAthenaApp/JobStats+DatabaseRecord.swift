//
//  JobStats+DatabaseRecord.swift
//  rAthenaApp
//
//  Created by Leon Li on 2024/1/4.
//

import rAthenaDatabase

extension JobStats: DatabaseRecord {
    var recordID: Int {
        job.intValue
    }

    var recordTitle: String {
        job.description
    }

    var recordFields: [DatabaseRecordField] {
        var fields: [DatabaseRecordField] = []

        fields += [
            .string("Max Weight", "\(maxWeight)"),
            .string("HP Factor", "\(hpFactor)"),
            .string("HP Increase", "\(hpIncrease)"),
            .string("SP Increase", "\(spIncrease)"),
        ]

        let baseASPDFields = baseASPD.map { (weaponType, baseASPD) in
            DatabaseRecordField.string(weaponType.description, "\(baseASPD)")
        }
        fields += [.array("Base ASPD", baseASPDFields)]

        let bonusStatsFields = bonusStats.enumerated().map { (level, bonusStats) in
            let levelBonusStatsFields = Parameter.allCases.map { parameter in
                let levelBonusStats = bonusStats[parameter] ?? 0
                return DatabaseRecordField.string(parameter.description, "\(levelBonusStats)")
            }
            return DatabaseRecordField.array("Level \(level + 1)", levelBonusStatsFields)
        }
        fields += [.array("Bonus Stats", bonusStatsFields)]

//        let maxStatsFields = maxStats.enumerated().map { (parameter, maxStats) in
//            DatabaseRecordField.string(NSStringFromRAParameter(parameter), maxStats.stringValue)
//        }
//        fields += [.array("Max Stats", maxStatsFields)]

        fields += [.string("Max Base Level", "\(maxBaseLevel)")]

        let baseExpFields = baseExp.enumerated().map { (level, baseExp) in
            DatabaseRecordField.string("Level \(level + 1)", "\(baseExp)")
        }
        fields += [.array("Base Exp", baseExpFields)]

        fields += [.string("Max Job Level", "\(maxJobLevel)")]

        let jobExpFields = jobExp.enumerated().map { (level, jobExp) in
            DatabaseRecordField.string("Level \(level + 1)", "\(jobExp)")
        }
        fields += [.array("Job Exp", jobExpFields)]

        let baseHpFields = baseHp.enumerated().map { (level, baseHp) in
            DatabaseRecordField.string("Level \(level + 1)", "\(baseHp)")
        }
        fields += [.array("Base HP", baseHpFields)]

        let baseSpFields = baseSp.enumerated().map { (level, baseSp) in
            DatabaseRecordField.string("Level \(level + 1)", "\(baseSp)")
        }
        fields += [.array("Base SP", baseSpFields)]

//        let baseApFields = baseAp.enumerated().map { (level, baseAp) in
//            DatabaseRecordField.string("Level \(level + 1)", "\(baseAp)")
//        }
//        fields += [.array("Base AP", baseApFields)]

//        if let skillTree = RASkillTreeDatabase.shared.record(withID: jobID) {
//            fields += [.reference("Skill Tree", skillTree)]
//        }

        return fields
    }
}
