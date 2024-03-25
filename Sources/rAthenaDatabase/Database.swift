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

public actor Database {

    public enum Mode {
        case prerenewal
        case renewal

        var path: String {
            switch self {
            case .prerenewal: "pre-re"
            case .renewal: "re"
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

    private let itemCache = ItemCache()
    private let monsterCache = MonsterCache()
    private let jobCache = JobCache()
    private let skillCache = SkillCache()
    private let skillTreeCache = SkillTreeCache()
    private let mapCache = MapCache()
    private let scriptCache = ScriptCache()

    private init(mode: Mode) {
        self.mode = mode
    }

    // MARK: - Item

    public func items() -> AsyncDatabaseRecordPartitions<Item> {
        AsyncThrowingStream { continuation in
            Task {
                if await itemCache.isEmpty {
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

                    await itemCache.storeItems(items)
                } else {
                    continuation.yield(RecordPartition(records: await itemCache.items))
                    continuation.finish()
                }
            }
        }
    }

    public func item(forAegisName aegisName: String) async throws -> Item {
        _ = try await items().joined()
        if let item = await itemCache.item(forAegisName: aegisName) {
            return item
        } else {
            throw DatabaseError.recordNotFound
        }
    }

    // MARK: - Monster

    public func monsters() -> AsyncDatabaseRecordPartitions<Monster> {
        AsyncThrowingStream { continuation in
            Task {
                if await monsterCache.isEmpty {
                    let monsters: [Monster] = try decodeFile(atPath: "mob_db.yml")

                    continuation.yield(RecordPartition(records: monsters))
                    continuation.finish()

                    await monsterCache.storeMonsters(monsters)
                } else {
                    continuation.yield(RecordPartition(records: await monsterCache.monsters))
                    continuation.finish()
                }
            }
        }
    }

    public func monster(forID id: Int) async throws -> Monster {
        _ = try await monsters().joined()
        if let monster = await monsterCache.monster(forID: id) {
            return monster
        } else {
            throw DatabaseError.recordNotFound
        }
    }

    public func monster(forAegisName aegisName: String) async throws -> Monster {
        _ = try await monsters().joined()
        if let monster = await monsterCache.monster(forAegisName: aegisName) {
            return monster
        } else {
            throw DatabaseError.recordNotFound
        }
    }

    // MARK: - Job

    public func jobs() -> AsyncDatabaseRecordPartitions<JobStats> {
        AsyncThrowingStream { continuation in
            Task {
                if await jobCache.isEmpty {
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

                    await jobCache.storeJobs(jobs)
                } else {
                    continuation.yield(RecordPartition(records: await jobCache.jobs))
                    continuation.finish()
                }
            }
        }
    }

    // MARK: - Skill

    public func skills() -> AsyncDatabaseRecordPartitions<Skill> {
        AsyncThrowingStream { continuation in
            Task {
                if await skillCache.isEmpty {
                    let skills: [Skill] = try decodeFile(atPath: "skill_db.yml")

                    continuation.yield(RecordPartition(records: skills))
                    continuation.finish()

                    await skillCache.storeSkills(skills)
                } else {
                    continuation.yield(RecordPartition(records: await skillCache.skills))
                    continuation.finish()
                }
            }
        }
    }

    public func skill(forAegisName aegisName: String) async throws -> Skill {
        _ = try await skills().joined()
        if let skill = await skillCache.skill(forAegisName: aegisName) {
            return skill
        } else {
            throw DatabaseError.recordNotFound
        }
    }

    public func skillTrees() -> AsyncDatabaseRecordPartitions<SkillTree> {
        AsyncThrowingStream { continuation in
            Task {
                if await skillTreeCache.isEmpty {
                    let skillTrees: [SkillTree] = try decodeFile(atPath: "skill_tree.yml")

                    continuation.yield(RecordPartition(records: skillTrees))
                    continuation.finish()

                    await skillTreeCache.storeSkillTrees(skillTrees)
                } else {
                    continuation.yield(RecordPartition(records: await skillTreeCache.skillTrees))
                    continuation.finish()
                }
            }
        }
    }

    public func skillTree(forJobID jobID: Int) async throws -> SkillTree {
        _ = try await skillTrees().joined()
        if let skillTree = await skillTreeCache.skillTree(forJobID: jobID) {
            return skillTree
        } else {
            throw DatabaseError.recordNotFound
        }
    }

    // MARK: - Map

    public func maps() -> AsyncDatabaseRecordPartitions<Map> {
        AsyncThrowingStream { continuation in
            Task {
                if await mapCache.isEmpty {
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

                    await mapCache.storeMaps(maps)
                } else {
                    continuation.yield(RecordPartition(records: await mapCache.maps))
                    continuation.finish()
                }
            }
        }
    }

    public func map(forName name: String) async throws -> Map {
        _ = try await maps().joined()
        if let map = await mapCache.map(forName: name) {
            return map
        } else {
            throw DatabaseError.recordNotFound
        }
    }

    // MARK: - Script

    public func monsterSpawns() -> AsyncDatabaseRecordPartitions<MonsterSpawn> {
        AsyncThrowingStream { continuation in
            Task {
                if await scriptCache.isEmpty {
                    let parser = ScriptParser(mode: mode)

                    do {
                        try parser.parse()

                        await scriptCache.store(monsterSpawns: parser.monsterSpawns)

                        continuation.yield(RecordPartition(records: parser.monsterSpawns))
                        continuation.finish()
                    } catch {
                        continuation.finish(throwing: error)
                    }
                } else {
                    continuation.yield(RecordPartition(records: await scriptCache.monsterSpawns))
                    continuation.finish()
                }
            }
        }
    }

    // MARK: - Decoding

    private func decodeFile<T>(atPath path: String) throws -> [T] where T : Decodable {
        let url = ResourceBundle.shared.dbURL
            .appendingPathComponent(mode.path)
            .appendingPathComponent(path)
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

extension AsyncThrowingStream where Element == Database.RecordPartition<MonsterSpawn> {
    public func joined() async throws -> [MonsterSpawn] {
        let initial = Database.RecordPartition<MonsterSpawn>(records: [])
        return try await reduce(initial, +).records
    }
}
