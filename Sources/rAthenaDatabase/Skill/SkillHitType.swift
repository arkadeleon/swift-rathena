//
//  SkillHitType.swift
//  rAthena
//
//  Created by Leon Li on 2024/1/11.
//

import rAthenaCommon

public enum SkillHitType: String, CaseIterable, CodingKey, Decodable {

    case normal = "Normal"
    case single = "Single"
    case multiple = "Multi_Hit"

    public var intValue: Int {
        switch self {
        case .normal: 0
        case .single: RA_DMG_SINGLE
        case .multiple: RA_DMG_MULTI_HIT
        }
    }

    public var description: String {
        switch self {
        case .normal: "Normal"
        case .single: "Single Hit"
        case .multiple: "Multiple Hit"
        }
    }
}
