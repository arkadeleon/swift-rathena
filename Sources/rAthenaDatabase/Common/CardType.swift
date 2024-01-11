//
//  CardType.swift
//  rAthena
//
//  Created by Leon Li on 2024/1/10.
//

public enum CardType: String, CaseIterable, CodingKey, Decodable {
    case normal = "Normal"
    case enchant = "Enchant"
}
