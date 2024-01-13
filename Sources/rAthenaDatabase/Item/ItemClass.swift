//
//  ItemClass.swift
//  rAthena
//
//  Created by Leon Li on 2024/1/10.
//

public struct ItemClasses: Decodable {

    /// Applies to all classes.
    public var all: Bool?

    /// Normal classes (no Baby/Transcendent/Third classes).
    public var normal: Bool?

    /// Transcedent classes (no Transcedent-Third classes).
    public var upper: Bool?

    /// Baby classes (no Third-Baby classes).
    public var baby: Bool?

    /// Third classes (no Transcedent-Third or Third-Baby classes).
    public var third: Bool?

    /// Transcedent-Third classes.
    public var thirdUpper: Bool?

    /// Third-Baby classes.
    public var thirdBaby: Bool?

    /// Fourth classes.
    public var fourth: Bool?

    /// All Transcedent classes
    public var allUpper: Bool?

    /// All baby classes
    public var allBaby: Bool?

    /// Applies to all Third classes.
    public var allThird: Bool?

    enum CodingKeys: String, CodingKey {
        case all = "All"
        case normal = "Normal"
        case upper = "Upper"
        case baby = "Baby"
        case third = "Third"
        case thirdUpper = "Third_Upper"
        case thirdBaby = "Third_Baby"
        case fourth = "Fourth"
        case allUpper = "All_Upper"
        case allBaby = "All_Baby"
        case allThird = "All_Third"
    }
}
