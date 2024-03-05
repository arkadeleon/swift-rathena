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
            case .prerenewal: "pre-re/"
            case .renewal: "re/"
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
    private var mapCache: [String : Map] = [:]

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

                    let usableItems: [Item] = try decodeFile(atPath: "item_db_usable.yml")
                    continuation.yield(RecordPartition(records: usableItems))

                    let equipItems: [Item] = try decodeFile(atPath: "item_db_equip.yml")
                    continuation.yield(RecordPartition(records: equipItems))

                    let etcItems: [Item] = try decodeFile(atPath: "item_db_etc.yml")
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
                    let monsters: [Monster] = try decodeFile(atPath: "mob_db.yml")

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
                    let basicStatsList: [JobBasicStats] = try decodeFile(atPath: "job_stats.yml")
                    let aspdStatsList: [JobASPDStats] = try decodeFile(atPath: "job_aspd.yml")
                    let expStatsList: [JobExpStats] = try decodeFile(atPath: "job_exp.yml")
                    let basePointsStatsList: [JobBasePointsStats] = try decodeFile(atPath: "job_basepoints.yml")

                    let jobs = Job.allCases.compactMap { job in
                        JobStats(
                            job: job,
                            basicStatsList: basicStatsList,
                            aspdStatsList: aspdStatsList,
                            expStatsList: expStatsList,
                            basePointsStatsList: basePointsStatsList
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
                    let skills: [Skill] = try decodeFile(atPath: "skill_db.yml")

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
                    let skillTrees: [SkillTree] = try decodeFile(atPath: "skill_tree.yml")

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

    // MARK: - Map

    public func maps() -> AsyncDatabaseRecordPartitions<Map> {
        AsyncThrowingStream { continuation in
            Task {
                if mapCache.isEmpty {
                    let url = ResourceBundle.shared.dbURL.appendingPathComponent("map_index.txt")
                    let string = try String(contentsOf: url)

                    var index = 0
                    var maps: [Map] = []

                    for line in string.split(separator: "\n") {
                        if line.trimmingCharacters(in: .whitespacesAndNewlines).starts(with: "//") {
                            continue
                        }
                        let columns = line.split(separator: " ")
                        if columns.count == 2 {
                            let name = String(columns[0])
                            index = Int(columns[1]) ?? 1
                            let map = Map(name: name, index: index)
                            maps.append(map)
                        } else if columns.count == 1 {
                            let name = String(columns[0])
                            index += 1
                            let map = Map(name: name, index: index)
                            maps.append(map)
                        }
                    }

                    continuation.yield(RecordPartition(records: maps))
                    continuation.finish()

                    mapCache = Dictionary(uniqueKeysWithValues: maps.map({ ($0.name, $0) }))
                } else {
                    continuation.yield(RecordPartition(records: mapCache.values.sorted()))
                    continuation.finish()
                }
            }
        }
    }

    // MARK: - Decoding

    private func decodeFile<T>(atPath path: String) throws -> [T] where T : Decodable {
        let url = ResourceBundle.shared.dbURL.appendingPathComponent(mode.path + path)
        let data = try Data(contentsOf: url)
        let records = try decoder.decode(ListNode<T>.self, from: data).body
        return records
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

extension AsyncThrowingStream where Element == Database.RecordPartition<Map> {
    public func joined() async throws -> [Map] {
        let initial = Database.RecordPartition<Map>(records: [])
        return try await reduce(initial, +).records
    }
}
