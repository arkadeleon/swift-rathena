//
//  JobStats+DatabaseRecord.swift
//  rAthenaApp
//
//  Created by Leon Li on 2024/1/4.
//

import rAthenaDatabase

extension JobStats: DatabaseRecord {
    var recordID: Int {
        job.id
    }

    var recordTitle: String {
        job.description
    }

    func recordFields(with database: Database) async throws -> DatabaseRecordFields {
        var fields = DatabaseRecordFields()

        fields.append("Max Weight", value: maxWeight)
        fields.append("HP Factor", value: hpFactor)
        fields.append("HP Increase", value: hpIncrease)
        fields.append("SP Increase", value: spIncrease)

        let baseASPDFields = baseASPD.map { (weaponType, baseASPD) in
            DatabaseRecordField.string(weaponType.description, "\(baseASPD)")
        }
        fields.append("Base ASPD", value: baseASPDFields)

        let bonusStatsFields = bonusStats.enumerated().map { (level, bonusStats) in
            let levelBonusStatsFields = Parameter.allCases.map { parameter in
                let levelBonusStats = bonusStats[parameter] ?? 0
                return DatabaseRecordField.string(parameter.description, "\(levelBonusStats)")
            }
            return DatabaseRecordField.array("Level \(level + 1)", levelBonusStatsFields)
        }
        fields.append("Bonus Stats", value: bonusStatsFields)

//        let maxStatsFields = maxStats.enumerated().map { (parameter, maxStats) in
//            DatabaseRecordField.string(NSStringFromRAParameter(parameter), maxStats.stringValue)
//        }
//        fields += [.array("Max Stats", maxStatsFields)]

        fields.append("Max Base Level", value: maxBaseLevel)

        let baseExpFields = baseExp.enumerated().map { (level, baseExp) in
            DatabaseRecordField.string("Level \(level + 1)", "\(baseExp)")
        }
        fields.append("Base Exp", value: baseExpFields)

        fields.append("Max Job Level", value: maxJobLevel)

        let jobExpFields = jobExp.enumerated().map { (level, jobExp) in
            DatabaseRecordField.string("Level \(level + 1)", "\(jobExp)")
        }
        fields.append("Job Exp", value: jobExpFields)

        let baseHpFields = baseHp.enumerated().map { (level, baseHp) in
            DatabaseRecordField.string("Level \(level + 1)", "\(baseHp)")
        }
        fields.append("Base HP", value: baseHpFields)

        let baseSpFields = baseSp.enumerated().map { (level, baseSp) in
            DatabaseRecordField.string("Level \(level + 1)", "\(baseSp)")
        }
        fields.append("Base SP", value: baseSpFields)

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
