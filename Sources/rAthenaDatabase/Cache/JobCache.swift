//
//  JobCache.swift
//  rAthena
//
//  Created by Leon Li on 2024/3/11.
//

import Foundation
import rAthenaResource

actor JobCache {
    let mode: Database.Mode

    private(set) var jobs: [JobStats] = []

    init(mode: Database.Mode) {
        self.mode = mode
    }

    func restoreJobs() throws {
        guard jobs.isEmpty else {
            return
        }

        let decoder = YAMLDecoder()

        let basicStatsURL = ResourceBundle.shared.dbURL
            .appendingPathComponent(mode.path)
            .appendingPathComponent("job_stats.yml")
        let basicStatsData = try Data(contentsOf: basicStatsURL)
        let basicStatsList = try decoder.decode(ListNode<JobBasicStats>.self, from: basicStatsData).body

        let aspdStatsURL = ResourceBundle.shared.dbURL
            .appendingPathComponent(mode.path)
            .appendingPathComponent("job_aspd.yml")
        let aspdStatsData = try Data(contentsOf: aspdStatsURL)
        let aspdStatsList = try decoder.decode(ListNode<JobASPDStats>.self, from: aspdStatsData).body

        let expStatsURL = ResourceBundle.shared.dbURL
            .appendingPathComponent(mode.path)
            .appendingPathComponent("job_exp.yml")
        let expStatsData = try Data(contentsOf: expStatsURL)
        let expStatsList = try decoder.decode(ListNode<JobExpStats>.self, from: expStatsData).body

        let basePointsStatsURL = ResourceBundle.shared.dbURL
            .appendingPathComponent(mode.path)
            .appendingPathComponent("job_basepoints.yml")
        let basePointsStatsData = try Data(contentsOf: basePointsStatsURL)
        let basePointsStatsList = try decoder.decode(ListNode<JobBasePointsStats>.self, from: basePointsStatsData).body

        jobs = Job.allCases.compactMap { job in
            JobStats(
                job: job,
                basicStatsList: basicStatsList,
                aspdStatsList: aspdStatsList,
                expStatsList: expStatsList,
                basePointsStatsList: basePointsStatsList
            )
        }
    }
}
