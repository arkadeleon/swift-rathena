//
//  SkillCopyableOption.swift
//  rAthena
//
//  Created by Leon Li on 2024/2/4.
//

import rAthenaCommon

public enum SkillCopyableOption: String, CaseIterable, CodingKey, Decodable, Identifiable {

    case plagiarism = "Plagiarism"
    case reproduce = "Reproduce"

    public var id: Int {
        switch self {
        case .plagiarism: 0x1
        case .reproduce: 0x2
        }
    }

    public var description: String {
        stringValue
    }
}
