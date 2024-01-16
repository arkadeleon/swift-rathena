//
//  SkillTree+DatabaseRecord.swift
//  rAthenaApp
//
//  Created by Leon Li on 2024/1/4.
//

import rAthenaDatabase

extension SkillTree: DatabaseRecord {
    var recordID: Int {
        job.id
    }

    var recordTitle: String {
        job.description
    }

    func recordFields() async throws -> [DatabaseRecordField] {
        var fields: [DatabaseRecordField] = []

        if let inherit {
            var inheritFields: [DatabaseRecordField] = []
            for job in inherit {
                if let skillTree = try await Database.renewal.fetchSkillTree(withJobID: job.id) {
                    inheritFields.append(.reference(job.description, skillTree))
                }
            }
            fields += [.array("Inherit", inheritFields)]
        }

        if let tree {
            for skill in tree {
                guard let reference = try await Database.renewal.fetchSkill(withAegisName: skill.name) else {
                    continue
                }

                var skillFields: [DatabaseRecordField] = []

                skillFields += [
                    .string("Maximum Level", "\(skill.maxLevel)"),
                    .string("Minimum Base Level Required", "\(skill.baseLevel)"),
                    .string("Minimum Job Level Required", "\(skill.jobLevel)"),
                    .reference("Reference", reference),
                ]

                if let requires = skill.requires {
                    var prerequisiteFields: [DatabaseRecordField] = []
                    for skill in requires {
                        if let reference = try await Database.renewal.fetchSkill(withAegisName: skill.name) {
                            prerequisiteFields.append(.reference("\(reference.name) (Level \(skill.level)", reference))
                        }
                    }
                    skillFields += [.array("Prerequisites", prerequisiteFields)]
                }

                fields += [.array(reference.name, skillFields)]
            }
        }

        return fields
    }
}
