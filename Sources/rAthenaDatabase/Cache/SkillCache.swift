//
//  SkillCache.swift
//  rAthena
//
//  Created by Leon Li on 2024/3/11.
//

import Foundation
import rAthenaResource

actor SkillCache {
    let mode: Database.Mode

    private(set) var skills: [Skill] = []
    private(set) var skillsByIDs: [Int : Skill] = [:]
    private(set) var skillsByAegisNames: [String : Skill] = [:]

    init(mode: Database.Mode) {
        self.mode = mode
    }

    func restoreSkills() throws {
        guard skills.isEmpty else {
            return
        }

        let decoder = YAMLDecoder()

        let url = ResourceBundle.shared.dbURL
            .appendingPathComponent(mode.path)
            .appendingPathComponent("skill_db.yml")
        let data = try Data(contentsOf: url)
        skills = try decoder.decode(ListNode<Skill>.self, from: data).body

        skillsByIDs = Dictionary(skills.map({ ($0.id, $0) }), uniquingKeysWith: { (first, _) in first })
        skillsByAegisNames = Dictionary(skills.map({ ($0.aegisName, $0) }), uniquingKeysWith: { (first, _) in first })
    }
}
