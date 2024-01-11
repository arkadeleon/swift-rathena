//
//  WeaponType.swift
//  rAthena
//
//  Created by Leon Li on 2024/1/10.
//

public enum WeaponType: String, CaseIterable, CodingKey, Decodable {
    case fist = "Fist"
    case dagger = "Dagger"
    case oneHandedSword = "1hSword"
    case twoHandedSword = "2hSword"
    case oneHandedSpear = "1hSpear"
    case twoHandedSpear = "2hSpear"
    case oneHandedAxe = "1hAxe"
    case twoHandedAxe = "2hAxe"
    case mace = "Mace"
    case twoHandedMace = "2hMace"
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

    public var stringValue: String {
        switch self {
        case .fist: "Fist"
        case .dagger: "Dagger"
        case .oneHandedSword: "One-Handed Sword"
        case .twoHandedSword: "Two-Handed Sword"
        case .oneHandedSpear: "One-Handed Spear"
        case .twoHandedSpear: "Two-Handed Spear"
        case .oneHandedAxe: "One-Handed Axe"
        case .twoHandedAxe: "Two-Handed Axe"
        case .mace: "Mace"
        case .twoHandedMace: "Two-Handed Mace"
        case .staff: "Staff"
        case .bow: "Bow"
        case .knuckle: "Knuckle"
        case .musical: "Musical"
        case .whip: "Whip"
        case .book: "Book"
        case .katar: "Katar"
        case .revolver: "Revolver"
        case .rifle: "Rifle"
        case .gatling: "Gatling"
        case .shotgun: "Shotgun"
        case .grenade: "Grenade"
        case .Huuma: "Huuma"
        case .twoHandedStaff: "Two-Handed Staff"
        }
    }
}
