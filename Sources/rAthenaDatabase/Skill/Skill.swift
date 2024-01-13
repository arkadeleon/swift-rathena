//
//  Skill.swift
//  rAthena
//
//  Created by Leon Li on 2024/1/11.
//

public struct Skill: Decodable {

    /// Unique skill ID.
    public var id: Int

    /// Skill Aegis name.
    public var aegisName: String

    /// Skill description.
    public var name: String

    /// Max skill level.
    public var maxLevel: Int

    /// Skill type. (Default: None)
    public var type: SkillType

    /// Skill target type. (Default: Passive)
    public var targetType: SkillTargetType

    /// Skill damage properties.
    public var damageFlags: [SkillDamageFlag]

    /// Skill information flags.
    public var flags: [SkillFlag]

    /// Skill range. (Default: 0)
    public var range: Either<Int, [Int?]>

    /// Skill hit type. (Default: Normal)
    public var hitType: SkillHitType

    /// Skill hit count. (Default: 0)
    public var hitCount: Either<Int, [Int?]>

    /// Skill element. (Default: Neutral)
    public var element: Either<Element, [Element?]>

    /// Skill splash area of effect. (Default: 0)
    public var splashArea: Either<Int, [Int?]>

    /// Maximum amount of active skill instances that can be on the ground. (Default: 0)
    public var activeInstance: Either<Int, [Int?]>

    /// Amount of tiles the skill knockbacks. (Default: 0)
    public var knockback: Either<Int, [Int?]>

    /// Gives AP on successful skill cast. (Default: 0)
    public var giveAp: Either<Int, [Int?]>

    /// Determines if the skill is copyable. (Optional)
//    public var copyFlags: CopyFlags?

    /// Determines if the skill can be used near a NPC. (Optional)
//    public var noNearNPC: NoNearNPC?

    /// Cancel cast when hit. (Default: false)
    public var castCancel: Bool

    /// Defense reduction rate during skill cast. (Default: 0)
    public var castDefenseReduction: Int

    /// Time to cast the skill in milliseconds. (Default: 0)
    public var castTime: Either<Int, [Int?]>

    /// Time the character cannot use skills in milliseconds. (Default: 0)
    public var afterCastActDelay: Either<Int, [Int?]>

    /// Time before the character can move again in milliseconds. (Default: 0)
    public var afterCastWalkDelay: Either<Int, [Int?]>

    /// Duration of the skill in milliseconds. (Default: 0)
    public var duration1: Either<Int, [Int?]>

    /// Duration of the skill in milliseconds. (Default: 0)
    public var duration2: Either<Int, [Int?]>

    /// Time before the character can use the same skill again in milliseconds. (Default: 0)
    public var cooldown: Either<Int, [Int?]>

    /// Time that is fixed during cast of the skill in milliseconds. (Default: 0)
    public var fixedCastTime: Either<Int, [Int?]>

    /// Effects of the skill's cast time. (Optional)
//    public var castTimeFlags: CastTimeFlags?

    /// Effects of the skill's delay. (Optional)
//    public var castDelayFlags: CastDelayFlags?

    /// List of requirements to cast the skill. (Optional)
//    public var requires: Requires?

    /// Skill unit values. (Optional)
//    public var unit: Unit?

    /// Status Change that is associated to the skill. (Optional)
//    public var status: Status?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case aegisName = "Name"
        case name = "Description"
        case maxLevel = "MaxLevel"
        case type = "Type"
        case targetType = "TargetType"
        case damageFlags = "DamageFlags"
        case flags = "Flags"
        case range = "Range"
        case hitType = "Hit"
        case hitCount = "HitCount"
        case element = "Element"
        case splashArea = "SplashArea"
        case activeInstance = "ActiveInstance"
        case knockback = "Knockback"
        case giveAp = "GiveAp"
        case castCancel = "CastCancel"
        case castDefenseReduction = "CastDefenseReduction"
        case castTime = "CastTime"
        case afterCastActDelay = "AfterCastActDelay"
        case afterCastWalkDelay = "AfterCastWalkDelay"
        case duration1 = "Duration1"
        case duration2 = "Duration2"
        case cooldown = "Cooldown"
        case fixedCastTime = "FixedCastTime"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.aegisName = try container.decode(String.self, forKey: .aegisName)
        self.name = try container.decode(String.self, forKey: .name)
        self.maxLevel = try container.decode(Int.self, forKey: .maxLevel)
        self.type = try container.decodeIfPresent(SkillType.self, forKey: .type) ?? .none
        self.targetType = try container.decodeIfPresent(SkillTargetType.self, forKey: .targetType) ?? .passive
        self.damageFlags = try container.decodeIfPresent(Node<SkillDamageFlag, Bool>.self, forKey: .damageFlags)?.keys ?? []
        self.flags = try container.decodeIfPresent(Node<SkillFlag, Bool>.self, forKey: .flags)?.keys ?? []
        self.range = try container.decodeIfPresent(Either<Int, [LevelRange]>.self, forKey: .range)?.mapRight { $0.map { $0.range } } ?? .left(0)
        self.hitType = try container.decodeIfPresent(SkillHitType.self, forKey: .hitType) ?? .normal
        self.hitCount = try container.decodeIfPresent(Either<Int, [LevelHitCount]>.self, forKey: .hitCount)?.mapRight { $0.map { $0.hitCount } } ?? .left(0)
        self.element = try container.decodeIfPresent(Either<Element, [LevelElement]>.self, forKey: .element)?.mapRight { $0.map { $0.element } } ?? .left(.neutral)
        self.splashArea = try container.decodeIfPresent(Either<Int, [LevelSplashArea]>.self, forKey: .splashArea)?.mapRight { $0.map { $0.splashArea } } ?? .left(0)
        self.activeInstance = try container.decodeIfPresent(Either<Int, [LevelActiveInstance]>.self, forKey: .activeInstance)?.mapRight { $0.map { $0.activeInstance } } ?? .left(0)
        self.knockback = try container.decodeIfPresent(Either<Int, [LevelKnockback]>.self, forKey: .knockback)?.mapRight { $0.map { $0.knockback } } ?? .left(0)
        self.giveAp = try container.decodeIfPresent(Either<Int, [LevelGiveAp]>.self, forKey: .giveAp)?.mapRight { $0.map { $0.giveAp } } ?? .left(0)
        self.castCancel = try container.decodeIfPresent(Bool.self, forKey: .castCancel) ?? false
        self.castDefenseReduction = try container.decodeIfPresent(Int.self, forKey: .castDefenseReduction) ?? 0
        self.castTime = try container.decodeIfPresent(Either<Int, [LevelCastTime]>.self, forKey: .castTime)?.mapRight { $0.map { $0.caseTime } } ?? .left(0)
        self.afterCastActDelay = try container.decodeIfPresent(Either<Int, [LevelAfterCastActDelay]>.self, forKey: .afterCastActDelay)?.mapRight { $0.map { $0.afterCastActDelay } } ?? .left(0)
        self.afterCastWalkDelay = try container.decodeIfPresent(Either<Int, [LevelAfterCastWalkDelay]>.self, forKey: .afterCastWalkDelay)?.mapRight { $0.map { $0.afterCastWalkDelay } } ?? .left(0)
        self.duration1 = try container.decodeIfPresent(Either<Int, [LevelDuration]>.self, forKey: .duration1)?.mapRight { $0.map { $0.duration } } ?? .left(0)
        self.duration2 = try container.decodeIfPresent(Either<Int, [LevelDuration]>.self, forKey: .duration2)?.mapRight { $0.map { $0.duration } } ?? .left(0)
        self.cooldown = try container.decodeIfPresent(Either<Int, [LevelCooldown]>.self, forKey: .cooldown)?.mapRight { $0.map { $0.cooldown } } ?? .left(0)
        self.fixedCastTime = try container.decodeIfPresent(Either<Int, [LevelFixedCastTime]>.self, forKey: .fixedCastTime)?.mapRight { $0.map { $0.fixedCastTime } } ?? .left(0)
    }
}

extension Skill {

    struct LevelRange: Decodable {

        /// Skill level.
        var level: Int

        /// Range at specific skill level.
        var range: Int

        enum CodingKeys: String, CodingKey {
            case level = "Level"
            case range = "Size"
        }
    }

    struct LevelHitCount: Decodable {

        /// Skill level.
        var level: Int

        /// Number of hits at specific skill level.
        var hitCount: Int

        enum CodingKeys: String, CodingKey {
            case level = "Level"
            case hitCount = "Count"
        }
    }

    struct LevelElement: Decodable {

        /// Skill level.
        var level: Int

        /// Element at specific skill level.
        var element: Element

        enum CodingKeys: String, CodingKey {
            case level = "Level"
            case element = "Element"
        }
    }

    struct LevelSplashArea: Decodable {

        /// Skill level.
        var level: Int

        /// Splash area at specific skill level.
        var splashArea: Int

        enum CodingKeys: String, CodingKey {
            case level = "Level"
            case splashArea = "Area"
        }
    }

    struct LevelActiveInstance: Decodable {

        /// Skill level.
        var level: Int

        /// Active instances at specific skill level.
        var activeInstance: Int

        enum CodingKeys: String, CodingKey {
            case level = "Level"
            case activeInstance = "Max"
        }
    }

    struct LevelKnockback: Decodable {

        /// Skill level.
        var level: Int

        /// Knockback count at specific skill level.
        var knockback: Int

        enum CodingKeys: String, CodingKey {
            case level = "Level"
            case knockback = "Amount"
        }
    }

    struct LevelGiveAp: Decodable {

        /// Skill level.
        var level: Int

        /// AP gained at specific skill level.
        var giveAp: Int

        enum CodingKeys: String, CodingKey {
            case level = "Level"
            case giveAp = "Amount"
        }
    }

    struct LevelCastTime: Decodable {

        /// Skill level.
        var level: Int

        /// Cast time at specific skill level in milliseconds.
        var caseTime: Int

        enum CodingKeys: String, CodingKey {
            case level = "Level"
            case caseTime = "Time"
        }
    }

    struct LevelAfterCastActDelay: Decodable {

        /// Skill level.
        var level: Int

        /// After cast action delay at specific skill level in milliseconds.
        var afterCastActDelay: Int

        enum CodingKeys: String, CodingKey {
            case level = "Level"
            case afterCastActDelay = "Time"
        }
    }

    struct LevelAfterCastWalkDelay: Decodable {

        /// Skill level.
        var level: Int

        /// After cast walk delay at specific skill level in milliseconds.
        var afterCastWalkDelay: Int

        enum CodingKeys: String, CodingKey {
            case level = "Level"
            case afterCastWalkDelay = "Time"
        }
    }

    struct LevelDuration: Decodable {

        /// Skill level.
        var level: Int

        /// Skill duration at specific skill level in milliseconds.
        var duration: Int

        enum CodingKeys: String, CodingKey {
            case level = "Level"
            case duration = "Time"
        }
    }

    struct LevelCooldown: Decodable {

        /// Skill level.
        var level: Int

        /// Cooldown at specific skill level in milliseconds.
        var cooldown: Int

        enum CodingKeys: String, CodingKey {
            case level = "Level"
            case cooldown = "Time"
        }
    }

    struct LevelFixedCastTime: Decodable {

        /// Skill level.
        var level: Int

        /// After cast action delay at specific skill level in milliseconds.
        var fixedCastTime: Int

        enum CodingKeys: String, CodingKey {
            case level = "Level"
            case fixedCastTime = "Time"
        }
    }

    struct LevelHpCost: Decodable {

        /// Skill level.
        var level: Int

        /// HP required at specific skill level.
        var hpCost: Int

        enum CodingKeys: String, CodingKey {
            case level = "Level"
            case hpCost = "Amount"
        }
    }

    struct LevelSpCost: Decodable {

        /// Skill level.
        var level: Int

        /// SP required at specific skill level.
        var spCost: Int

        enum CodingKeys: String, CodingKey {
            case level = "Level"
            case spCost = "Amount"
        }
    }

    struct LevelApCost: Decodable {

        /// Skill level.
        var level: Int

        /// AP required at specific skill level.
        var apCost: Int

        enum CodingKeys: String, CodingKey {
            case level = "Level"
            case apCost = "Amount"
        }
    }

    struct LevelHpRateCost: Decodable {

        /// Skill level.
        var level: Int

        /// HP rate required at specific skill level.
        var hpRateCost: Int

        enum CodingKeys: String, CodingKey {
            case level = "Level"
            case hpRateCost = "Amount"
        }
    }

    struct LevelSpRateCost: Decodable {

        /// Skill level.
        var level: Int

        /// SP rate required at specific skill level.
        var spRateCost: Int

        enum CodingKeys: String, CodingKey {
            case level = "Level"
            case spRateCost = "Amount"
        }
    }

    struct LevelApRateCost: Decodable {

        /// Skill level.
        var level: Int

        /// AP rate required at specific skill level.
        var apRateCost: Int

        enum CodingKeys: String, CodingKey {
            case level = "Level"
            case apRateCost = "Amount"
        }
    }

    struct LevelMaxHpTrigger: Decodable {

        /// Skill level.
        var level: Int

        /// Maximum HP trigger required at specific skill level.
        var maxHpTrigger: Int

        enum CodingKeys: String, CodingKey {
            case level = "Level"
            case maxHpTrigger = "Amount"
        }
    }

    struct LevelZenyCost: Decodable {

        /// Skill level.
        var level: Int

        /// Zeny required at specific skill level.
        var zenyCost: Int

        enum CodingKeys: String, CodingKey {
            case level = "Level"
            case zenyCost = "Amount"
        }
    }

    struct LevelAmmoAmount: Decodable {

        /// Skill level.
        var level: Int

        /// Ammo amount required at specific skill level.
        var ammoAmount: Int

        enum CodingKeys: String, CodingKey {
            case level = "Level"
            case ammoAmount = "Amount"
        }
    }

    struct LevelSpiritSphereCost: Decodable {

        /// Skill level.
        var level: Int

        /// Spirit sphere required at specific skill level.
        var spiritSphereCost: Int

        enum CodingKeys: String, CodingKey {
            case level = "Level"
            case spiritSphereCost = "Amount"
        }
    }

    struct LevelItemCost: Decodable {

        /// Item name.
        var item: String

        /// Item amount.
        var amount: Int

        /// Skill level. Makes the skill item check become level dependent if supplied. (Default: applies to all levels)
        var level: Int

        enum CodingKeys: String, CodingKey {
            case item = "Item"
            case amount = "Amount"
            case level = "Level"
        }
    }

    struct LevelUnitLayout: Decodable {

        /// Skill level.
        var level: Int

        /// Unit layout at specific skill level.
        var unitLayout: Int

        enum CodingKeys: String, CodingKey {
            case level = "Level"
            case unitLayout = "Size"
        }
    }

    struct LevelUnitRange: Decodable {

        /// Skill level.
        var level: Int

        /// Unit range at specific skill level.
        var unitRange: Int

        enum CodingKeys: String, CodingKey {
            case level = "Level"
            case unitRange = "Size"
        }
    }
}
