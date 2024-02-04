//
//  SkillCastFlag.swift
//  rAthena
//
//  Created by Leon Li on 2024/2/4.
//

import rAthenaCommon

public enum SkillCastFlag: String, CaseIterable, CodingKey, Decodable, Identifiable {

    case ignoreDex = "IgnoreDex"
    case ignoreStatus = "IgnoreStatus"
    case ignoreItemBonus = "IgnoreItemBonus"

    public var id: Int {
        switch self {
        case .ignoreDex: RA_SKILL_CAST_IGNOREDEX
        case .ignoreStatus: RA_SKILL_CAST_IGNORESTATUS
        case .ignoreItemBonus: RA_SKILL_CAST_IGNOREITEMBONUS
        }
    }

    public var description: String {
        switch self {
        case .ignoreDex: "Ignore Dex"
        case .ignoreStatus: "Ignore Status"
        case .ignoreItemBonus: "Ignore Item Bonus"
        }
    }
}
