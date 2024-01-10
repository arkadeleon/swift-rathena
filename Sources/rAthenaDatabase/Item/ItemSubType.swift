//
//  ItemSubType.swift
//  rAthena
//
//  Created by Leon Li on 2024/1/10.
//

/// Indicates the weapon-class of the item.
public enum ItemSubType: String, Decodable {

    /// For weapons, the types are:
    case fist = "Fist"
    case dagger = "Dagger"
    case oneHandedSword = "1hSword"
    case twoHandedSword = "2hSword"
    case oneHandedSpear = "1hSpear"
    case twoHandedSpear = "2hSpear"
    case oneHandedAxe = "1hAxe"
    case twoHandedAxe = "2hAxe"
    case mace = "Mace"
    case staff = "Staff"
    case bow = "Bow"
    case knuckle = "Knuckle"
    case musical = "Musical"
    case whip = "Whip"
    case book = "Book"
    case katar = "Katar"
    case revolver = "Revolver"
    case rifle = "Rifle"
    case gatling = "Gatling"
    case shotgun = "Shotgun"
    case grenade = "Grenade"
    case Huuma = "Huuma"
    case twoHandedStaff = "2hStaff"

    /// For ammo, the types are:
    case arrow = "Arrow"
//        case dagger = "Dagger"
    case bullet = "Bullet"
    case shell = "Shell"
//        case grenade = "Grenade"
    case shuriken = "Shuriken"
    case kunai = "Kunai"
    case cannonball = "Cannonball"
    case throwweapon = "Throwweapon"

    /// For cards, the types are:
    case normal = "Normal"
    case enchant = "Enchant"
}
