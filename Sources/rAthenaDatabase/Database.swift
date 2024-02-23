//
//  Database.swift
//  rAthena
//
//  Created by Leon Li on 2023/1/20.
//

import Foundation
import rAthenaResource

public typealias AsyncDatabaseRecordPartitions<Record> = AsyncThrowingStream<Database.RecordPartition<Record>, Error>

public enum DatabaseError: Error {
    case recordNotFound
}

public class Database {

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

    public struct RecordPartition<Record> {
        public let records: [Record]

        public static func + (lhs: RecordPartition<Record>, rhs: RecordPartition<Record>) -> RecordPartition<Record> {
            RecordPartition<Record>(records: lhs.records + rhs.records)
        }
    }

    public static let prerenewal = Database(mode: .prerenewal)
    public static let renewal = Database(mode: .renewal)

    public let mode: Mode

    private let decoder = YAMLDecoder()

    private var itemCache: [String : Item] = [:]
    private var monsterCache: [String : Monster] = [:]
    private var jobStatsCache: [Int : JobStats] = [:]
    private var skillCache: [String : Skill] = [:]
    private var skillTreeCache: [Int : SkillTree] = [:]

    private init(mode: Mode) {
        self.mode = mode
    }

    // MARK: - Item

    public func items() -> AsyncDatabaseRecordPartitions<Item> {
        AsyncThrowingStream { continuation in
            Task {
                if itemCache.isEmpty {
                    let start = Date()
                    print("Begin loading item database")

                    let usableItemData = try ResourceManager.shared.data(forResource: mode.path + "item_db_usable.yml")
                    let usableItems = try decoder.decode(List<Item>.self, from: usableItemData).body
                    continuation.yield(RecordPartition(records: usableItems))

                    let equipItemData = try ResourceManager.shared.data(forResource: mode.path + "item_db_equip.yml")
                    let equipItems = try decoder.decode(List<Item>.self, from: equipItemData).body
                    continuation.yield(RecordPartition(records: equipItems))

                    let etcItemData = try ResourceManager.shared.data(forResource: mode.path + "item_db_etc.yml")
                    let etcItems = try decoder.decode(List<Item>.self, from: etcItemData).body
                    continuation.yield(RecordPartition(records: etcItems))

                    let items = usableItems + equipItems + etcItems

                    continuation.finish()

                    let end = Date()
                    print("End loading item database: \(end.timeIntervalSince(start))")

                    itemCache = Dictionary(uniqueKeysWithValues: items.map({ ($0.aegisName, $0) }))
                } else {
                    continuation.yield(RecordPartition(records: itemCache.values.sorted()))
                    continuation.finish()
                }
            }
        }
    }

    public func item(for aegisName: String) async throws -> Item {
        for try await _ in items() {}
        if let item = itemCache[aegisName] {
            return item
        } else {
            throw DatabaseError.recordNotFound
        }
    }

    // MARK: - Monster

    public func monsters() -> AsyncDatabaseRecordPartitions<Monster> {
        AsyncThrowingStream { continuation in
            Task {
                if monsterCache.isEmpty {
                    let mobData = try ResourceManager.shared.data(forResource: mode.path + "mob_db.yml")
                    let monsters = try decoder.decode(List<Monster>.self, from: mobData).body

                    continuation.yield(RecordPartition(records: monsters))
                    continuation.finish()

                    monsterCache = Dictionary(uniqueKeysWithValues: monsters.map({ ($0.aegisName, $0) }))
                } else {
                    continuation.yield(RecordPartition(records: monsterCache.values.sorted()))
                    continuation.finish()
                }
            }
        }
    }

    public func monster(for aegisName: String) async throws -> Monster {
        for try await _ in monsters() {}
        if let monster = monsterCache[aegisName] {
            return monster
        } else {
            throw DatabaseError.recordNotFound
        }
    }

    // MARK: - Job

    public func jobs() -> AsyncDatabaseRecordPartitions<JobStats> {
        AsyncThrowingStream { continuation in
            Task {
                if jobStatsCache.isEmpty {
                    let basicStatsData = try ResourceManager.shared.data(forResource: mode.path + "job_stats.yml")
                    let basicStatsList = try decoder.decode(List<JobBasicStats>.self, from: basicStatsData)

                    let aspdStatsData = try ResourceManager.shared.data(forResource: mode.path + "job_aspd.yml")
                    let aspdStatsList = try decoder.decode(List<JobASPDStats>.self, from: aspdStatsData)

                    let expStatsData = try ResourceManager.shared.data(forResource: mode.path + "job_exp.yml")
                    let expStatsList = try decoder.decode(List<JobExpStats>.self, from: expStatsData)

                    let basePointsStatsData = try ResourceManager.shared.data(forResource: mode.path + "job_basepoints.yml")
                    let basePointsStatsList = try decoder.decode(List<JobBasePointsStats>.self, from: basePointsStatsData)

                    let jobs = Job.allCases.compactMap { job in
                        JobStats(
                            job: job,
                            basicStatsList: basicStatsList.body,
                            aspdStatsList: aspdStatsList.body,
                            expStatsList: expStatsList.body,
                            basePointsStatsList: basePointsStatsList.body
                        )
                    }

                    continuation.yield(RecordPartition(records: jobs))
                    continuation.finish()

                    jobStatsCache = Dictionary(uniqueKeysWithValues: jobs.map({ ($0.job.id, $0) }))
                } else {
                    continuation.yield(RecordPartition(records: jobStatsCache.values.sorted()))
                    continuation.finish()
                }
            }
        }
    }

    // MARK: - Skill

    public func skills() -> AsyncDatabaseRecordPartitions<Skill> {
        AsyncThrowingStream { continuation in
            Task {
                if skillCache.isEmpty {
                    let skillData = try ResourceManager.shared.data(forResource: mode.path + "skill_db.yml")
                    let skills = try decoder.decode(List<Skill>.self, from: skillData).body

                    continuation.yield(RecordPartition(records: skills))
                    continuation.finish()

                    skillCache = Dictionary(uniqueKeysWithValues: skills.map({ ($0.aegisName, $0) }))
                } else {
                    continuation.yield(RecordPartition(records: skillCache.values.sorted()))
                    continuation.finish()
                }
            }
        }
    }

    public func skill(for aegisName: String) async throws -> Skill {
        for try await _ in skills() {}
        if let skill = skillCache[aegisName] {
            return skill
        } else {
            throw DatabaseError.recordNotFound
        }
    }

    public func skillTrees() -> AsyncDatabaseRecordPartitions<SkillTree> {
        AsyncThrowingStream { continuation in
            Task {
                if skillTreeCache.isEmpty {
                    let skillTreeData = try ResourceManager.shared.data(forResource: mode.path + "skill_tree.yml")
                    let skillTrees = try decoder.decode(List<SkillTree>.self, from: skillTreeData).body

                    continuation.yield(RecordPartition(records: skillTrees))
                    continuation.finish()

                    skillTreeCache = Dictionary(uniqueKeysWithValues: skillTrees.map({ ($0.id, $0) }))
                } else {
                    continuation.yield(RecordPartition(records: skillTreeCache.values.sorted()))
                    continuation.finish()
                }
            }
        }
    }

    public func skillTree(for jobID: Int) async throws -> SkillTree {
        for try await _ in skillTrees() {}
        if let skillTree = skillTreeCache[jobID] {
            return skillTree
        } else {
            throw DatabaseError.recordNotFound
        }
    }
}

extension AsyncThrowingStream where Element == Database.RecordPartition<Item> {
    public func joined() async throws -> [Item] {
        let initial = Database.RecordPartition<Item>(records: [])
        return try await reduce(initial, +).records
    }
}

extension AsyncThrowingStream where Element == Database.RecordPartition<Monster> {
    public func joined() async throws -> [Monster] {
        let initial = Database.RecordPartition<Monster>(records: [])
        return try await reduce(initial, +).records
    }
}

extension AsyncThrowingStream where Element == Database.RecordPartition<JobStats> {
    public func joined() async throws -> [JobStats] {
        let initial = Database.RecordPartition<JobStats>(records: [])
        return try await reduce(initial, +).records
    }
}

extension AsyncThrowingStream where Element == Database.RecordPartition<Skill> {
    public func joined() async throws -> [Skill] {
        let initial = Database.RecordPartition<Skill>(records: [])
        return try await reduce(initial, +).records
    }
}

extension AsyncThrowingStream where Element == Database.RecordPartition<SkillTree> {
    public func joined() async throws -> [SkillTree] {
        let initial = Database.RecordPartition<SkillTree>(records: [])
        return try await reduce(initial, +).records
    }
}
