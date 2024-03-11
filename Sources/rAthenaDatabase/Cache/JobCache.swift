//
//  JobCache.swift
//  rAthena
//
//  Created by Leon Li on 2024/3/11.
//

actor JobCache {
    private(set) var jobs: [JobStats] = []

    var isEmpty: Bool {
        jobs.isEmpty
    }

    func storeJobs(_ jobs: [JobStats]) {
        self.jobs = jobs
    }
}
