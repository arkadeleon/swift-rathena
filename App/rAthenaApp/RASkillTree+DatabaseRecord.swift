//
//  RASkillTree+DatabaseRecord.swift
//  rAthenaApp
//
//  Created by Leon Li on 2024/1/4.
//

import rAthenaCommon
import rAthenaMap

extension RASkillTree: DatabaseRecord {
    var recordID: Int {
        job
    }

    var recordTitle: String {
        let job = RAJobDatabase.shared.record(withID: job)
        return job?.jobName ?? ""
    }

    var recordFields: [DatabaseRecordField] {
        var fields: [DatabaseRecordField] = []

        let inheritFields = inherit.compactMap { inheritJob -> DatabaseRecordField? in
            guard let job = RAJobDatabase.shared.record(withID: inheritJob.intValue),
                  let skillTree = RASkillTreeDatabase.shared.record(withID: inheritJob.intValue)
            else {
                return nil
            }
            return .reference(job.jobName, skillTree)
        }
        fields += [.array("Inherit", inheritFields)]

        for skill in tree {
            guard let reference = RASkillDatabase.shared.record(withID: skill.skillID) else {
                continue
            }

            var skillFields: [DatabaseRecordField] = []

            skillFields += [
                .string("Maximum Level", "\(skill.maxLevel)"),
                .string("Minimum Base Level Required", "\(skill.baseLevel)"),
                .string("Minimum Job Level Required", "\(skill.jobLevel)"),
                .reference("Reference", reference),
            ]

            let prerequisiteFields = skill.prerequisites.compactMap { prerequisiteSkill -> DatabaseRecordField? in
                guard let reference = RASkillDatabase.shared.record(withID: prerequisiteSkill.skillID) else {
                    return nil
                }
                return .reference("\(reference.skillDescription) (Level \(prerequisiteSkill.level)", reference)
            }
            skillFields += [.array("Prerequisites", prerequisiteFields)]

            fields += [.array(reference.skillDescription, skillFields)]
        }

        return fields
    }
}
