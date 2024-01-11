//
//  Race.swift
//  rAthena
//
//  Created by Leon Li on 2024/1/9.
//

public enum Race: String, CaseIterable, CodingKey, Decodable {

    /// Formless.
    case formless = "Formless"

    /// Undead.
    case undead = "Undead"

    /// Brute.
    case brute = "Brute"

    /// Plant.
    case plant = "Plant"

    /// Insect.
    case insect = "Insect"

    /// Fish.
    case fish = "Fish"

    /// Demon.
    case demon = "Demon"

    /// Demihuman.
    case demihuman = "Demihuman"

    /// Angel.
    case angel = "Angel"

    /// Dragon.
    case dragon = "Dragon"
}
