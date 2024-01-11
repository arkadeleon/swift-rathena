//
//  MonsterMode.swift
//  rAthena
//
//  Created by Leon Li on 2024/1/9.
//

public enum MonsterMode: String, CaseIterable, CodingKey, Decodable {
    case canMove = "CanMove"
    case looter = "Looter"
    case aggressive = "Aggressive"
    case assist = "Assist"
    case castSensorIdle = "CastSensorIdle"
    case noRandomWalk = "NoRandomWalk"
    case noCast = "NoCast"
    case canAttack = "CanAttack"
    case castSensorChase = "CastSensorChase"
    case changeChase = "ChangeChase"
    case angry = "Angry"
    case changeTargetMelee = "ChangeTargetMelee"
    case changeTargetChase = "ChangeTargetChase"
    case targetWeak = "TargetWeak"
    case randomTarget = "RandomTarget"
    case ignoreMelee = "IgnoreMelee"
    case ignoreMagic = "IgnoreMagic"
    case ignoreRanged = "IgnoreRanged"
    case mvp = "Mvp"
    case ignoreMisc = "IgnoreMisc"
    case knockBackImmune = "KnockBackImmune"
    case teleportBlock = "TeleportBlock"
    case fixedItemDrop = "FixedItemDrop"
    case detector = "Detector"
    case statusImmune = "StatusImmune"
    case skillImmune = "SkillImmune"
}
