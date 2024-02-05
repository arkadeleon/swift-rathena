//
//  Database.swift
//  rAthena
//
//  Created by Leon Li on 2023/1/20.
//

import Foundation
import rAthenaResource
import Yams

public enum DatabaseError: Error {
    case recordNotFound
}

public class Database {

    public static let prerenewal = Database(mode: .prerenewal)
    public static let renewal = Database(mode: .renewal)

    public let mode: Mode

    private let decoder = YAMLDecoder()

    private var itemCache: [String : Item] = [:]
    private var monsterCache: [String : Monster] = [:]
    private var jobStatsCache: [Int : JobStats] = [:]
    private var skillCache: [String : Skill] = [:]
    private var skillTreeCache: [Int : SkillTree] = [:]

    public enum Mode {
        case prerenewal
        case renewal

        var path: String {
            switch self {
            case .prerenewal: "db/pre-re/"
            case .renewal: "db/re/"
            }
        }
    }

    private init(mode: Mode) {
        self.mode = mode
    }

    // MARK: - Item

    public func fetchItems() async throws -> [Item] {
        if itemCache.isEmpty {
            let usableItemList = Task {
                let usableItemData = try ResourceManager.shared.data(forResource: mode.path + "item_db_usable.yml")
                let usableItemList = try decoder.decode(List<Item>.self, from: usableItemData)
                return usableItemList
            }

            let equipItemList = Task {
                let equipItemData = try ResourceManager.shared.data(forResource: mode.path + "item_db_equip.yml")
                let equipItemList = try decoder.decode(List<Item>.self, from: equipItemData)
                return equipItemList
            }

            let etcItemList = Task {
                let etcItemData = try ResourceManager.shared.data(forResource: mode.path + "item_db_etc.yml")
                let etcItemList = try decoder.decode(List<Item>.self, from: etcItemData)
                return etcItemList
            }

            let items = try await usableItemList.value.body + equipItemList.value.body + etcItemList.value.body

            itemCache = Dictionary(uniqueKeysWithValues: items.map({ ($0.aegisName, $0) }))
        }

        return itemCache.values.sorted()
    }

    public func item(for aegisName: String) async throws -> Item {
        _ = try await fetchItems()
        if let item = itemCache[aegisName] {
            return item
        } else {
            throw DatabaseError.recordNotFound
        }
    }

    // MARK: - Monster

    public func fetchMonsters() async throws -> [Monster] {
        if monsterCache.isEmpty {
            let mobData = try ResourceManager.shared.data(forResource: mode.path + "mob_db.yml")
            let mobList = try decoder.decode(List<Monster>.self, from: mobData)

            monsterCache = Dictionary(uniqueKeysWithValues: mobList.body.map({ ($0.aegisName, $0) }))
        }

        return monsterCache.values.sorted()
    }

    public func monster(for aegisName: String) async throws -> Monster {
        _ = try await fetchMonsters()
        if let monster = monsterCache[aegisName] {
            return monster
        } else {
            throw DatabaseError.recordNotFound
        }
    }

    // MARK: - Job

    public func fetchJobs() async throws -> [JobStats] {
        if jobStatsCache.isEmpty {
            let basicStatsData = try ResourceManager.shared.data(forResource: mode.path + "job_stats.yml")
            let basicStatsList = try decoder.decode(List<JobBasicStats>.self, from: basicStatsData)

            let aspdStatsData = try ResourceManager.shared.data(forResource: mode.path + "job_aspd.yml")
            let aspdStatsList = try decoder.decode(List<JobASPDStats>.self, from: aspdStatsData)

            let expStatsData = try ResourceManager.shared.data(forResource: mode.path + "job_exp.yml")
            let expStatsList = try decoder.decode(List<JobExpStats>.self, from: expStatsData)

            let basePointsStatsData = try ResourceManager.shared.data(forResource: mode.path + "job_basepoints.yml")
            let basePointsStatsList = try decoder.decode(List<JobBasePointsStats>.self, from: basePointsStatsData)

            let jobStatsList = Job.allCases.compactMap { job in
                JobStats(
                    job: job,
                    basicStatsList: basicStatsList.body,
                    aspdStatsList: aspdStatsList.body,
                    expStatsList: expStatsList.body,
                    basePointsStatsList: basePointsStatsList.body
                )
            }

            jobStatsCache = Dictionary(uniqueKeysWithValues: jobStatsList.map({ ($0.job.id, $0) }))
        }

        return jobStatsCache.values.sorted()
    }

    // MARK: - Skill

    public func fetchSkills() async throws -> [Skill] {
        if skillCache.isEmpty {
            let skillData = try ResourceManager.shared.data(forResource: mode.path + "skill_db.yml")
            let skillList = try decoder.decode(List<Skill>.self, from: skillData)

            skillCache = Dictionary(uniqueKeysWithValues: skillList.body.map({ ($0.aegisName, $0) }))
        }

        return skillCache.values.sorted()
    }

    public func skill(for aegisName: String) async throws -> Skill {
        _ = try await fetchSkills()
        if let skill = skillCache[aegisName] {
            return skill
        } else {
            throw DatabaseError.recordNotFound
        }
    }

    public func fetchSkillTrees() async throws -> [SkillTree] {
        if skillTreeCache.isEmpty {
            let skillTreeData = try ResourceManager.shared.data(forResource: mode.path + "skill_tree.yml")
            let skillTreeList = try decoder.decode(List<SkillTree>.self, from: skillTreeData)

            skillTreeCache = Dictionary(uniqueKeysWithValues: skillTreeList.body.map({ ($0.id, $0) }))
        }

        return skillTreeCache.values.sorted()
    }

    public func skillTree(for jobID: Int) async throws -> SkillTree {
        _ = try await fetchSkillTrees()
        if let skillTree = skillTreeCache[jobID] {
            return skillTree
        } else {
            throw DatabaseError.recordNotFound
        }
    }
}
