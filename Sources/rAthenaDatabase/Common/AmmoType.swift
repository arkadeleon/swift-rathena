//
//  AmmoType.swift
//  rAthena
//
//  Created by Leon Li on 2024/1/10.
//

public enum AmmoType: String, CaseIterable, CodingKey, Decodable {
    case arrow = "Arrow"
    case dagger = "Dagger"
    case bullet = "Bullet"
    case shell = "Shell"
    case grenade = "Grenade"
    case shuriken = "Shuriken"
    case kunai = "Kunai"
    case cannonBall = "Cannonball"
    case throwWeapon = "Throwweapon"

    public var stringValue: String {
        switch self {
        case .arrow: "Arrow"
        case .dagger: "Dagger"
        case .bullet: "Bullet"
        case .shell: "Shell"
        case .grenade: "Grenade"
        case .shuriken: "Shuriken"
        case .kunai: "Kunai"
        case .cannonBall: "Cannon Ball"
        case .throwWeapon: "Throw Weapon"
        }
    }
}
