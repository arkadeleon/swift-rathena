//
//  Element.swift
//  rAthena
//
//  Created by Leon Li on 2024/1/9.
//

public enum Element: String, Decodable, CustomStringConvertible {

    /// Neutral.
    case neutral = "Neutral"

    /// Water.
    case water = "Water"

    /// Earth.
    case earth = "Earth"

    /// Fire.
    case fire = "Fire"

    /// Wind.
    case wind = "Wind"

    /// Poison.
    case poison = "Poison"

    /// Holy.
    case holy = "Holy"

    /// Dark.
    case dark = "Dark"

    /// Ghost.
    case ghost = "Ghost"

    /// Undead.
    case undead = "Undead"

    public var description: String {
        rawValue
    }
}
