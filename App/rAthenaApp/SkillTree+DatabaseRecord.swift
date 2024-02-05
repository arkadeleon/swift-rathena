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

    func recordFields(with database: Database) async throws -> DatabaseRecordFields {
        var fields = DatabaseRecordFields()

        if let inherit {
            var inheritFields: [DatabaseRecordField] = []
            for job in inherit {
                let skillTree = try await database.skillTree(for: job.id)
                inheritFields.append(.reference(job.description, skillTree))
            }
            fields.append("Inherit", value: inheritFields)
        }

        if let tree {
            for skill in tree {
                let reference = try await database.skill(for: skill.name)

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
                        let reference = try await database.skill(for: skill.name)
                        prerequisiteFields.append(.reference("\(reference.name) (Level \(skill.level)", reference))
                    }
                    skillFields += [.array("Prerequisites", prerequisiteFields)]
                }

                fields.append(reference.name, value: skillFields)
            }
        }

        return fields
    }
}
