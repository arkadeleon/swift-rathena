//
//  CardType.swift
//  rAthena
//
//  Created by Leon Li on 2024/1/10.
//

import rAthenaCommon

public enum CardType: String, CaseIterable, CodingKey, Decodable, Identifiable {

    case normal = "Normal"
    case enchant = "Enchant"

    public var id: Int {
        switch self {
        case .normal: RA_CARD_NORMAL
        case .enchant: RA_CARD_ENCHANT
        }
    }

    public var description: String {
        stringValue
    }
}
