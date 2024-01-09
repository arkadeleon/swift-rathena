//
//  Item.swift
//  rAthena
//
//  Created by Leon Li on 2023/1/18.
//

public struct Item: Decodable {

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case aegisName = "AegisName"
        case name = "Name"
        case type = "Type"
        case subType = "SubType"
        case buy = "Buy"
        case sell = "Sell"
        case weight = "Weight"
        case attack = "Attack"
        case magicAttack = "MagicAttack"
        case defense = "Defense"
        case range = "Range"
        case slots = "Slots"
        case jobs = "Jobs"
        case classes = "Classes"
        case gender = "Gender"
        case locations = "Locations"
        case weaponLevel = "WeaponLevel"
        case equipLevelMin = "EquipLevelMin"
        case equipLevelMax = "EquipLevelMax"
        case refineable = "Refineable"
        case gradable = "Gradable"
        case view = "View"
        case aliasName = "AliasName"
        case flags = "Flags"
        case delay = "Delay"
        case stack = "Stack"
        case noUse = "NoUse"
        case trade = "Trade"
        case script = "Script"
        case equipScript = "EquipScript"
        case unEquipScript = "UnEquipScript"
    }

    /// Item ID.
    public var id: Int

    /// Server name to reference the item in scripts and lookups, should use no spaces.
    public var aegisName: String

    /// Name in English for displaying as output for atcommands and script commands.
    public var name: String

    /// Item's type.
    public var type: ItemType?

    /// Indicates the weapon-class of the item.
    public var subType: ItemSubType?

    /// Default buying price. When not specified, becomes double the sell price.
    public var buy: Int?

    /// Default selling price. When not specified, becomes half the buy price.
    public var sell: Int?

    /// Item's weight. Each 10 is 1 weight.
    public var weight: Int?

    /// Weapon's attack.
    public var attack: Int?

    /// Weapon's magic attack. (Renewal only)
    public var magicAttack: Int?

    /// Armor's defense.
    public var defense: Int?

    /// Weapon's attack range.
    public var range: Int?

    /// Amount of slots the item possesses.
    public var slots: Int?

    /// Equippable jobs.
    public var jobs: Jobs?

    /// Equippable upper-types.
    public var classes: Classes?

    /// Gender restriction.
    public var gender: Gender?

    /// Equipment's placement.
    public var locations: Locations?

    /// Weapon level. Used for refinement.
    public var weaponLevel: Int?

    /// Base level required to be able to equip.
    public var equipLevelMin: Int?

    /// Only able to equip if base level is lower than this.
    public var equipLevelMax: Int?

    /// Defines if the item can be refined.
    public var refineable: Bool?

    /// Defines if the item can be graded.
    public var gradable: Bool?

    /// For normal items, defines a replacement view-sprite for the item.
    public var view: Int?

    /// Use the AegisName of another item which will be sent to the client instead of this item.
    /// This makes items visually appear as another without having to change the client data.
    public var aliasName: String?

    /// Different types of flags for an item.
    public var flags: Flags?

    /// Item use delay.
    public var delay: Delay?

    /// Item stack amount.
    public var stack: Stack?

    /// Conditions when the item is unusable.
    public var noUse: NoUse?

    /// Trade restrictions.
    public var trade: Trade?

    /// Script to execute when the item is used/equipped.
    public var script: String?

    /// Script to execute when the item is equipped.
    /// Warning, not all item bonuses will work here as expected.
    public var equipScript: String?

    /// Script to execute when the item is unequipped or when a rental item expires.
    /// Warning, not all item bonuses will work here as expected.
    public var unEquipScript: String?
}

extension Item {

    /// Item's type.
    public enum ItemType: String, CaseIterable, Decodable, CustomStringConvertible {

        /// Healing item.
        case healing = "Healing"

        /// Usable item.
        case usable = "Usable"

        /// Etc item.
        case etc = "Etc"

        /// Armor/Garment/Boots/Headgear/Accessory item.
        case armor = "Armor"

        /// Weapon item.
        case weapon = "Weapon"

        /// Card item.
        case card = "Card"

        /// Pet egg item.
        case petEgg = "PetEgg"

        /// Pet equipment item.
        case petArmor = "PetArmor"

        /// Ammo (Arrows/Bullets/etc) item.
        case ammo = "Ammo"

        /// Usable with delayed consumption (intended for 'itemskill').
        /// Items using the 'itemskill' script command are consumed after selecting a target. Any other command will NOT consume the item.
        case delayConsume = "DelayConsume"

        /// Shadow Equipment item.
        case shadowGear = "ShadowGear"

        /// Another delayed consume that requires user confirmation before using the item.
        case cash = "Cash"

        public var description: String {
            switch self {
            case .healing: "Healing"
            case .usable: "Usable"
            case .etc: "Etc"
            case .armor: "Armor"
            case .weapon: "Weapon"
            case .card: "Card"
            case .petEgg: "Pet Egg"
            case .petArmor: "Pet Armor"
            case .ammo: "Ammo"
            case .delayConsume: "Delay Consume"
            case .shadowGear: "Shadow Gear"
            case .cash: "Cash"
            }
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let rawValue = try container.decode(String.self)
            self = ItemType.allCases.first(where: { $0.rawValue.caseInsensitiveCompare(rawValue) == .orderedSame }) ?? .etc
        }
    }
}

extension Item {

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
}

extension Item {

    /// Equippable jobs.
    public struct Jobs: Decodable {

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
    }
}

extension Item {

    /// Equippable upper-types.
    public struct Classes: Decodable {

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
    }
}

extension Item {

    /// Gender restriction.
    public enum Gender: String, Decodable {

        /// Female
        case female = "Female"

        /// Male
        case male = "Male"

        /// Both
        case both = "Both"
    }
}

extension Item {

    /// Equipment's placement.
    public struct Locations: Decodable {

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
    }
}

extension Item {

    /// Different types of flags for an item.
    public struct Flags: Decodable {

        enum CodingKeys: String, CodingKey {
            case buyingStore = "BuyingStore"
            case deadBranch = "DeadBranch"
            case container = "Container"
            case uniqueId = "UniqueId"
            case bindOnEquip = "BindOnEquip"
            case dropAnnounce = "DropAnnounce"
            case noConsume = "NoConsume"
            case dropEffect = "DropEffect"
        }

        /// If the item is available to Buying Stores.
        public var buyingStore: Bool?

        /// If the item is a Dead Branch type.
        public var deadBranch: Bool?

        /// If the item is part of a Container.
        public var container: Bool?

        /// If the item is a unique stack.
        public var uniqueId: Bool?

        /// If the item is bound to the character upon equipping.
        public var bindOnEquip: Bool?

        /// If the item has a special announcement to self on drop.
        public var dropAnnounce: Bool?

        /// If the item is consumed on use.
        public var noConsume: Bool?

        /// If the item has a special effect on the ground when dropped by a monster.
        public var dropEffect: String?
    }
}

extension Item {

    /// Item use delay.
    public struct Delay: Decodable {

        enum CodingKeys: String, CodingKey {
            case duration = "Duration"
            case status = "Status"
        }

        /// Duration of delay in seconds.
        public var duration: Int

        /// Status Change used to keep track of the delay.
        public var status: String?
    }
}

extension Item {

    /// Item stack amount.
    public struct Stack: Decodable {

        enum CodingKeys: String, CodingKey {
            case amount = "Amount"
            case inventory = "Inventory"
            case cart = "Cart"
            case storage = "Storage"
            case guildStorage = "GuildStorage"
        }

        /// Maximum amount that can be stacked.
        public var amount: Int

        /// If the stack is applied to player's inventory.
        public var inventory: Bool?

        /// If the stack is applied to the player's cart.
        public var cart: Bool?

        /// If the stack is applied to the player's storage.
        public var storage: Bool?

        /// If the stack is applied to the player's guild storage.
        public var guildStorage: Bool?
    }
}

extension Item {

    /// Conditions when the item is unusable.
    public struct NoUse: Decodable {

        enum CodingKeys: String, CodingKey {
            case override = "Override"
            case sitting = "Sitting"
        }

        /// Group level to override these conditions.
        public var override: Int?

        /// If the item can not be used while sitting.
        public var sitting: Bool
    }
}

extension Item {

    /// Trade restrictions.
    public struct Trade: Decodable {

        enum CodingKeys: String, CodingKey {
            case override = "Override"
            case noDrop = "NoDrop"
            case noTrade = "NoTrade"
            case tradePartner = "TradePartner"
            case noSell = "NoSell"
            case noCart = "NoCart"
            case noStorage = "NoStorage"
            case noGuildStorage = "NoGuildStorage"
            case noMail = "NoMail"
            case noAuction = "NoAuction"
        }

        /// Group level to override these conditions.
        public var override: Int?

        /// If the item can not be dropped.
        public var noDrop: Bool?

        /// If the item can not be traded.
        public var noTrade: Bool?

        /// If the item can not be traded to the player's partner.
        public var tradePartner: Bool?

        /// If the item can not be sold.
        public var noSell: Bool?

        /// If the item can not be put in a cart.
        public var noCart: Bool?

        /// If the item can not be put in a storage.
        public var noStorage: Bool?

        /// If the item can not be put in a guild storage.
        public var noGuildStorage: Bool?

        /// If the item can not be put in a mail.
        public var noMail: Bool?

        /// If the item can not be put in an auction.
        public var noAuction: Bool?
    }
}
