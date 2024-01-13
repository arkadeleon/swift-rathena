//
//  ItemLocation.swift
//  rAthena
//
//  Created by Leon Li on 2024/1/10.
//

public struct ItemLocations: Decodable {

    /// Upper Headgear
    public var headTop: Bool?

    /// Middle Headgear
    public var headMid: Bool?

    /// Lower Headgear
    public var headLow: Bool?

    /// Armor
    public var armor: Bool?

    /// Weapon
    public var rightHand: Bool?

    /// Shield
    public var leftHand: Bool?

    /// Garment/Robe
    public var garment: Bool?

    /// Shoes
    public var shoes: Bool?

    /// Accessory Right
    public var rightAccessory: Bool?

    /// Accessory Left
    public var leftAccessory: Bool?

    /// Costume Top Headgear
    public var costumeHeadTop: Bool?

    /// Costume Mid Headgear
    public var costumeHeadMid: Bool?

    /// Costume Low Headgear
    public var costumeHeadLow: Bool?

    /// Costume Garment/Robe
    public var costumeGarment: Bool?

    /// Ammo
    public var ammo: Bool?

    /// Shadow Armor
    public var shadowArmor: Bool?

    /// Shadow Weapon
    public var shadowWeapon: Bool?

    /// Shadow Shield
    public var shadowShield: Bool?

    /// Shadow Shoes
    public var shadowShoes: Bool?

    /// Shadow Accessory Right (Earring)
    public var shadowRightAccessory: Bool?

    /// Shadow Accessory Left (Pendant)
    public var shadowLeftAccessory: Bool?

    /// Right_Hand + Left_Hand
    public var bothHand: Bool?

    /// Right_Accessory + Left_Accessory
    public var bothAccessory: Bool?

    enum CodingKeys: String, CodingKey {
        case headTop = "Head_Top"
        case headMid = "Head_Mid"
        case headLow = "Head_Low"
        case armor = "Armor"
        case rightHand = "Right_Hand"
        case leftHand = "Left_Hand"
        case garment = "Garment"
        case shoes = "Shoes"
        case rightAccessory = "Right_Accessory"
        case leftAccessory = "Left_Accessory"
        case costumeHeadTop = "Costume_Head_Top"
        case costumeHeadMid = "Costume_Head_Mid"
        case costumeHeadLow = "Costume_Head_Low"
        case costumeGarment = "Costume_Garment"
        case ammo = "Ammo"
        case shadowArmor = "Shadow_Armor"
        case shadowWeapon = "Shadow_Weapon"
        case shadowShield = "Shadow_Shield"
        case shadowShoes = "Shadow_Shoes"
        case shadowRightAccessory = "Shadow_Right_Accessory"
        case shadowLeftAccessory = "Shadow_Left_Accessory"
        case bothHand = "Both_Hand"
        case bothAccessory = "Both_Accessory"
    }
}
