//
//  JobASPDStats.swift
//  rAthena
//
//  Created by Leon Li on 2024/1/10.
//

struct JobASPDStats: Decodable {

    /// List of jobs associated to group.
    var jobs: [Job]

    /// Base ASPD for each weapon type. (Default: 2000)
    var baseASPD: Node<WeaponType, Int>

    enum CodingKeys: String, CodingKey {
        case jobs = "Jobs"
        case baseASPD = "BaseASPD"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.jobs = try container.decode(Node<Job, Bool>.self, forKey: .jobs).keys
        self.baseASPD = try container.decode(Node<WeaponType, Int>.self, forKey: .baseASPD)
    }
}
