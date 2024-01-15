//
//  Database.swift
//  rAthena
//
//  Created by Leon Li on 2023/1/20.
//

import rAthenaResource
import Yams

public class Database {

    private let renewal: Bool
    private let decoder: YAMLDecoder

    public static let renewal = Database(renewal: true)
    public static let prerenewal = Database(renewal: false)

    private init(renewal: Bool) {
        self.renewal = renewal
        self.decoder = YAMLDecoder()
    }

    public func fetchItems() async throws -> [Item] {
        let path = renewal ? "db/re/" : "db/pre-re/"

        let usableItemList = Task {
            let usableItemData = try ResourceManager.shared.data(forResource: path + "item_db_usable.yml")
            let usableItemList = try decoder.decode(List<Item>.self, from: usableItemData)
            return usableItemList
        }

        let equipItemList = Task {
            let equipItemData = try ResourceManager.shared.data(forResource: path + "item_db_equip.yml")
            let equipItemList = try decoder.decode(List<Item>.self, from: equipItemData)
            return equipItemList
        }

        let etcItemList = Task {
            let etcItemData = try ResourceManager.shared.data(forResource: path + "item_db_etc.yml")
            let etcItemList = try decoder.decode(List<Item>.self, from: etcItemData)
            return etcItemList
        }

        let items = try await usableItemList.value.body + equipItemList.value.body + etcItemList.value.body
        return items
    }

    public func fetchMonsters() async throws -> [Monster] {
        let path = renewal ? "db/re/" : "db/pre-re/"

        let mobData = try ResourceManager.shared.data(forResource: path + "mob_db.yml")
        let mobList = try decoder.decode(List<Monster>.self, from: mobData)

        return mobList.body
    }

    public func fetchJobs() async throws -> [JobStats] {
        let path = renewal ? "db/re/" : "db/pre-re/"

        let basicStatsData = try ResourceManager.shared.data(forResource: path + "job_stats.yml")
        let basicStatsList = try decoder.decode(List<JobBasicStats>.self, from: basicStatsData)

        let aspdStatsData = try ResourceManager.shared.data(forResource: path + "job_aspd.yml")
        let aspdStatsList = try decoder.decode(List<JobASPDStats>.self, from: aspdStatsData)

        let expStatsData = try ResourceManager.shared.data(forResource: path + "job_exp.yml")
        let expStatsList = try decoder.decode(List<JobExpStats>.self, from: expStatsData)

        let basePointsStatsData = try ResourceManager.shared.data(forResource: path + "job_basepoints.yml")
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
        return jobStatsList
    }

    public func fetchSkills() async throws -> [Skill] {
        let path = renewal ? "db/re/" : "db/pre-re/"

        let skillData = try ResourceManager.shared.data(forResource: path + "skill_db.yml")
        let skillList = try decoder.decode(List<Skill>.self, from: skillData)

        return skillList.body
    }
}
