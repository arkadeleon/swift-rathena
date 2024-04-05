//
//  SkillTreeCache.swift
//  rAthena
//
//  Created by Leon Li on 2024/3/11.
//

import Foundation
import rAthenaResource

actor SkillTreeCache {
    let mode: Database.Mode

    private(set) var skillTrees: [SkillTree] = []
    private(set) var skillTreesByJobIDs: [Int : SkillTree] = [:]

    init(mode: Database.Mode) {
        self.mode = mode
    }

    func restoreSkillTrees() throws {
        guard skillTrees.isEmpty else {
            return
        }

        let decoder = YAMLDecoder()

        let url = ResourceBundle.shared.dbURL
            .appendingPathComponent(mode.path)
            .appendingPathComponent("skill_tree.yml")
        let data = try Data(contentsOf: url)
        skillTrees = try decoder.decode(ListNode<SkillTree>.self, from: data).body

        skillTreesByJobIDs = Dictionary(skillTrees.map({ ($0.job.id, $0) }), uniquingKeysWith: { (first, _) in first })
    }
}
