//
//  SkillTreeCache.swift
//  rAthena
//
//  Created by Leon Li on 2024/3/11.
//

actor SkillTreeCache {
    private(set) var skillTrees: [SkillTree] = []

    private var skillTreesByJobIDs: [Int : SkillTree] = [:]

    var isEmpty: Bool {
        skillTrees.isEmpty
    }

    func storeSkillTrees(_ skillTrees: [SkillTree]) {
        self.skillTrees = skillTrees
        skillTreesByJobIDs = Dictionary(skillTrees.map({ ($0.job.id, $0) }), uniquingKeysWith: { (first, _) in first })
    }

    func skillTree(forJobID jobID: Int) -> SkillTree? {
        skillTreesByJobIDs[jobID]
    }
}
