//
//  MonsterClass.swift
//  rAthena
//
//  Created by Leon Li on 2024/1/9.
//

public enum MonsterClass: String, Decodable {
    case normal = "Normal"
    case boss = "Boss"
    case guardian = "Guardian"
    case battlefield = "Battlefield"
    case event = "Event"
}
