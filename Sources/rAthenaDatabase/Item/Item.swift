//
//  Item.swift
//  rAthena
//
//  Created by Leon Li on 2023/1/18.
//

public struct Item: Decodable {

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
    public var jobs: ItemJobs?

    /// Equippable upper-types.
    public var classes: ItemClasses?

    /// Gender restriction.
    public var gender: Gender?

    /// Equipment's placement.
    public var locations: ItemLocations?

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
}

extension Item {

    /// Different types of flags for an item.
    public struct Flags: Decodable {

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
    }
}

extension Item {

    /// Item use delay.
    public struct Delay: Decodable {

        /// Duration of delay in seconds.
        public var duration: Int

        /// Status Change used to keep track of the delay.
        public var status: String?

        enum CodingKeys: String, CodingKey {
            case duration = "Duration"
            case status = "Status"
        }
    }
}

extension Item {

    /// Item stack amount.
    public struct Stack: Decodable {

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

        enum CodingKeys: String, CodingKey {
            case amount = "Amount"
            case inventory = "Inventory"
            case cart = "Cart"
            case storage = "Storage"
            case guildStorage = "GuildStorage"
        }
    }
}

extension Item {

    /// Conditions when the item is unusable.
    public struct NoUse: Decodable {

        /// Group level to override these conditions.
        public var override: Int?

        /// If the item can not be used while sitting.
        public var sitting: Bool

        enum CodingKeys: String, CodingKey {
            case override = "Override"
            case sitting = "Sitting"
        }
    }
}

extension Item {

    /// Trade restrictions.
    public struct Trade: Decodable {

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
    }
}
