//
//  CardType.swift
//  rAthena
//
//  Created by Leon Li on 2024/1/10.
//

public enum CardType: String, Decodable, CustomStringConvertible {
    case normal = "Normal"
    case enchant = "Enchant"

    public var description: String {
        rawValue
    }
}
