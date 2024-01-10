//
//  ItemJob.swift
//  rAthena
//
//  Created by Leon Li on 2024/1/10.
//

/// Equippable jobs.
public struct ItemJobs: Decodable {

    public var all: Bool?
    public var acolyte: Bool?
    public var alchemist: Bool?
    public var archer: Bool?
    public var assassin: Bool?
    public var bardDancer: Bool?
    public var blacksmith: Bool?
    public var crusader: Bool?
    public var gunslinger: Bool?
    public var hunter: Bool?
    public var kagerouOboro: Bool?
    public var knight: Bool?
    public var mage: Bool?
    public var merchant: Bool?
    public var monk: Bool?
    public var ninja: Bool?
    public var novice: Bool?
    public var priest: Bool?
    public var rebellion: Bool?
    public var rogue: Bool?
    public var sage: Bool?
    public var soulLinker: Bool?
    public var starGladiator: Bool?
    public var summoner: Bool?
    public var superNovice: Bool?
    public var swordman: Bool?
    public var taekwon: Bool?
    public var thief: Bool?
    public var wizard: Bool?

    enum CodingKeys: String, CodingKey {
        case all = "All"
        case acolyte = "Acolyte"
        case alchemist = "Alchemist"
        case archer = "Archer"
        case assassin = "Assassin"
        case bardDancer = "BardDancer"
        case blacksmith = "Blacksmith"
        case crusader = "Crusader"
        case gunslinger = "Gunslinger"
        case hunter = "Hunter"
        case kagerouOboro = "KagerouOboro"
        case knight = "Knight"
        case mage = "Mage"
        case merchant = "Merchant"
        case monk = "Monk"
        case ninja = "Ninja"
        case novice = "Novice"
        case priest = "Priest"
        case rebellion = "Rebellion"
        case rogue = "Rogue"
        case sage = "Sage"
        case soulLinker = "SoulLinker"
        case starGladiator = "StarGladiator"
        case summoner = "Summoner"
        case superNovice = "SuperNovice"
        case swordman = "Swordman"
        case taekwon = "Taekwon"
        case thief = "Thief"
        case wizard = "Wizard"
    }
}
