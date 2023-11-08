//
//  rAthenaMapTests.swift
//  rAthenaTests
//
//  Created by Leon Li on 2023/2/14.
//

import XCTest
@testable import rAthenaCommon
@testable import rAthenaMap

class rAthenaMapTests: XCTestCase {
    let resourceManager = RAResourceManager.shared
    let mapServer = RAMapServer.shared

    override func setUp() async throws {
        resourceManager.copyResourcesToLibraryDirectory()
        await mapServer.start()
    }

    func testMapServer() {
        XCTAssertEqual(mapServer.name, "Map Server")
    }

    func testItemDatabase() {
        let items = RAItemDatabase.shared.allRecords() as! [RAItem]
        XCTAssertEqual(items.count, 24057)

        let uniqueItems = Dictionary(uniqueKeysWithValues: items.map({ ($0.itemID, $0) }))

        let redPotion = uniqueItems[501]!
        XCTAssertEqual(redPotion.aegisName, "Red_Potion")
        XCTAssertEqual(redPotion.name, "Red Potion")
        XCTAssertEqual(redPotion.type, RA_IT_HEALING)
        XCTAssertEqual(redPotion.buy, 10)
        XCTAssertEqual(redPotion.weight, 70)
//        XCTAssertEqual(redPotion.script, "itemheal rand(45,65),0;\n")

        let flyWing = uniqueItems[601]!
        XCTAssertEqual(flyWing.aegisName, "Wing_Of_Fly")
        XCTAssertEqual(flyWing.name, "Fly Wing")
        XCTAssertEqual(flyWing.type, RA_IT_USABLE)
        XCTAssertEqual(flyWing.buy, 250)
        XCTAssertEqual(flyWing.weight, 50)
        XCTAssertEqual(flyWing.flags.buyingStore, true)
//        XCTAssertEqual(flyWing.script, "itemskill \"AL_TELEPORT\",1;\n")

        let deadBranch = uniqueItems[604]!
        XCTAssertEqual(deadBranch.aegisName, "Branch_Of_Dead_Tree")
        XCTAssertEqual(deadBranch.name, "Dead Branch")
        XCTAssertEqual(deadBranch.type, RA_IT_USABLE)
        XCTAssertEqual(deadBranch.buy, 50)
        XCTAssertEqual(deadBranch.weight, 50)
        XCTAssertEqual(deadBranch.flags.buyingStore, true)
        XCTAssertEqual(deadBranch.flags.deadBranch, true)
//        XCTAssertEqual(deadBranch.script, "monster \"this\",-1,-1,\"--ja--\",-1-MOBG_BRANCH_OF_DEAD_TREE,1,\"\";\n")

        let sword = uniqueItems[1101]!
        XCTAssertEqual(sword.aegisName, "Sword")
        XCTAssertEqual(sword.name, "Sword")
        XCTAssertEqual(sword.type, RA_IT_WEAPON)
        XCTAssertEqual(sword.subType, RA_W_1HSWORD)
        XCTAssertEqual(sword.buy, 100)
        XCTAssertEqual(sword.weight, 500)
        XCTAssertEqual(sword.attack, 25)
        XCTAssertEqual(sword.range, 1)
        XCTAssertEqual(sword.slots, 3)
        XCTAssertEqual(sword.jobs[0] as! UInt, UInt(1 << RA_MAPID_NOVICE) | UInt(1 << RA_MAPID_SWORDMAN) | UInt(1 << RA_MAPID_MERCHANT) | UInt(1 << RA_MAPID_THIEF))
        XCTAssertEqual(sword.jobs[1] as! UInt, UInt(1 << (RA_MAPID_SUPER_NOVICE & RA_MAPID_BASEMASK)) | UInt(1 << (RA_MAPID_KNIGHT & RA_MAPID_BASEMASK)) | UInt(1 << (RA_MAPID_BLACKSMITH & RA_MAPID_BASEMASK)) | UInt(1 << (RA_MAPID_ASSASSIN & RA_MAPID_BASEMASK)))
        XCTAssertEqual(sword.jobs[2] as! UInt, UInt(1 << (RA_MAPID_CRUSADER & RA_MAPID_BASEMASK)) | UInt(1 << (RA_MAPID_ALCHEMIST & RA_MAPID_BASEMASK)) | UInt(1 << (RA_MAPID_ROGUE & RA_MAPID_BASEMASK)))
        XCTAssertEqual(sword.locations, UInt(RA_EQP_HAND_R))
        XCTAssertEqual(sword.weaponLevel, 1)
        XCTAssertEqual(sword.equipLevelMin, 2)
        XCTAssertEqual(sword.refineable, true)

        let eraser = uniqueItems[1637]!
        XCTAssertEqual(eraser.aegisName, "Eraser")
        XCTAssertEqual(eraser.name, "Eraser")
        XCTAssertEqual(eraser.type, RA_IT_WEAPON)
        XCTAssertEqual(eraser.subType, RA_W_STAFF)
        XCTAssertEqual(eraser.buy, 20)
        XCTAssertEqual(eraser.weight, 500)
        XCTAssertEqual(eraser.attack, 80)
        XCTAssertEqual(eraser.magicAttack, 170)
        XCTAssertEqual(eraser.range, 1)
        XCTAssertEqual(eraser.jobs[0] as! UInt, UInt(1 << RA_MAPID_MAGE) | UInt(1 << RA_MAPID_ACOLYTE))
        XCTAssertEqual(eraser.jobs[1] as! UInt, UInt(1 << (RA_MAPID_WIZARD & RA_MAPID_BASEMASK)) | UInt(1 << (RA_MAPID_PRIEST & RA_MAPID_BASEMASK)))
        XCTAssertEqual(eraser.jobs[2] as! UInt, UInt(1 << (RA_MAPID_SAGE & RA_MAPID_BASEMASK)) | UInt(1 << (RA_MAPID_MONK & RA_MAPID_BASEMASK)))
        XCTAssertEqual(eraser.classes, UInt(RA_ITEMJ_ALL_UPPER))
        XCTAssertEqual(eraser.weaponLevel, 4)
        XCTAssertEqual(eraser.equipLevelMin, 70)
        XCTAssertEqual(eraser.refineable, true)

        let sheild = uniqueItems[2105]!
        XCTAssertEqual(sheild.aegisName, "Shield")
        XCTAssertEqual(sheild.name, "Shield")
        XCTAssertEqual(sheild.type, RA_IT_ARMOR)
        XCTAssertEqual(sheild.buy, 56000)
        XCTAssertEqual(sheild.weight, 1300)
        XCTAssertEqual(sheild.defense, 60)
        XCTAssertEqual(sheild.jobs[0] as! UInt, UInt(1 << RA_MAPID_SWORDMAN))
        XCTAssertEqual(sheild.jobs[1] as! UInt, UInt(1 << (RA_MAPID_KNIGHT & RA_MAPID_BASEMASK)))
        XCTAssertEqual(sheild.jobs[2] as! UInt, UInt(1 << (RA_MAPID_CRUSADER & RA_MAPID_BASEMASK)))
        XCTAssertEqual(sheild.locations, UInt(RA_EQP_HAND_L))
        XCTAssertEqual(sheild.armorLevel, 1)
        XCTAssertEqual(sheild.refineable, true)

        let turban = uniqueItems[2222]!
        XCTAssertEqual(turban.aegisName, "Turban")
        XCTAssertEqual(turban.name, "Turban")
        XCTAssertEqual(turban.type, RA_IT_ARMOR)
        XCTAssertEqual(turban.buy, 4500)
        XCTAssertEqual(turban.weight, 300)
        XCTAssertEqual(turban.defense, 5)
        XCTAssertEqual(turban.jobs[0] as! UInt, UInt.max & ~UInt(1 << RA_MAPID_NOVICE))
        XCTAssertEqual(turban.jobs[1] as! UInt, UInt.max & ~UInt(1 << (RA_MAPID_SUPER_NOVICE & RA_MAPID_BASEMASK)))
        XCTAssertEqual(turban.jobs[2] as! UInt, UInt.max)
        XCTAssertEqual(turban.locations, UInt(RA_EQP_HEAD_TOP))
        XCTAssertEqual(turban.armorLevel, 1)
        XCTAssertEqual(turban.refineable, true)
        XCTAssertEqual(turban.view, 7)

        let poringCard = uniqueItems[4001]!
        XCTAssertEqual(poringCard.aegisName, "Poring_Card")
        XCTAssertEqual(poringCard.name, "Poring Card")
        XCTAssertEqual(poringCard.type, RA_IT_CARD)
        XCTAssertEqual(poringCard.buy, 20)
        XCTAssertEqual(poringCard.weight, 10)
        XCTAssertEqual(poringCard.locations, UInt(RA_EQP_ARMOR))
        XCTAssertEqual(poringCard.flags.buyingStore, true)
        XCTAssertEqual(poringCard.flags.dropEffect, RA_DROPEFFECT_CLIENT)
//        XCTAssertEqual(poringCard.script, "bonus bLuk,2;\nbonus bFlee2,1;\n")
    }

    func testMonsterDatabase() {
        let monsters = RAMonsterDatabase.shared.allRecords() as! [RAMonster]
        XCTAssertEqual(monsters.count, 2445)

        let uniqueMonsters = Dictionary(uniqueKeysWithValues: monsters.map({ ($0.monsterID, $0) }))

        let poring = uniqueMonsters[1002]!
        XCTAssertEqual(poring.aegisName, "PORING")
        XCTAssertEqual(poring.name, "Poring")
        XCTAssertEqual(poring.level, 1)
        XCTAssertEqual(poring.hp, 60)
        XCTAssertEqual(poring.baseExp, 150)
        XCTAssertEqual(poring.jobExp, 40)
        XCTAssertEqual(poring.attack, 6)
        XCTAssertEqual(poring.attack2, 1)
        XCTAssertEqual(poring.defense, 2)
        XCTAssertEqual(poring.magicDefense, 5)
        XCTAssertEqual(poring.strength, 6)
        XCTAssertEqual(poring.agility, 1)
        XCTAssertEqual(poring.vitality, 1)
        XCTAssertEqual(poring.intelligence, 1)
        XCTAssertEqual(poring.dexterity, 6)
        XCTAssertEqual(poring.luck, 5)
        XCTAssertEqual(poring.attackRange, 1)
        XCTAssertEqual(poring.skillRange, 10)
        XCTAssertEqual(poring.chaseRange, 12)
        XCTAssertEqual(poring.size, RA_SZ_MEDIUM)
        XCTAssertEqual(poring.race, RA_RC_PLANT)
        XCTAssertEqual(poring.element, RA_ELE_WATER)
        XCTAssertEqual(poring.elementLevel, 1)
        XCTAssertEqual(poring.walkSpeed, 400)
        XCTAssertEqual(poring.attackDelay, 1872)
        XCTAssertEqual(poring.attackMotion, 672)
        XCTAssertEqual(poring.damageMotion, 480)
        XCTAssertEqual(poring.monsterClass, RA_CLASS_NORMAL)
        XCTAssertEqual(poring.modes, UInt(RA_MONSTER_TYPE_02))
        XCTAssertEqual(poring.drops.count, 8)

        let archerSkeleton = uniqueMonsters[1016]!
        XCTAssertEqual(archerSkeleton.aegisName, "ARCHER_SKELETON")
        XCTAssertEqual(archerSkeleton.name, "Archer Skeleton")
        XCTAssertEqual(archerSkeleton.level, 50)
        XCTAssertEqual(archerSkeleton.hp, 1646)
        XCTAssertEqual(archerSkeleton.baseExp, 436)
        XCTAssertEqual(archerSkeleton.jobExp, 327)
        XCTAssertEqual(archerSkeleton.attack, 76)
        XCTAssertEqual(archerSkeleton.attack2, 23)
        XCTAssertEqual(archerSkeleton.defense, 47)
        XCTAssertEqual(archerSkeleton.magicDefense, 10)
        XCTAssertEqual(archerSkeleton.strength, 30)
        XCTAssertEqual(archerSkeleton.agility, 29)
        XCTAssertEqual(archerSkeleton.vitality, 20)
        XCTAssertEqual(archerSkeleton.intelligence, 10)
        XCTAssertEqual(archerSkeleton.dexterity, 35)
        XCTAssertEqual(archerSkeleton.luck, 5)
        XCTAssertEqual(archerSkeleton.attackRange, 9)
        XCTAssertEqual(archerSkeleton.skillRange, 10)
        XCTAssertEqual(archerSkeleton.chaseRange, 12)
        XCTAssertEqual(archerSkeleton.size, RA_SZ_MEDIUM)
        XCTAssertEqual(archerSkeleton.race, RA_RC_UNDEAD)
        XCTAssertEqual(archerSkeleton.raceGroups as! [Int], [RA_RC2_CLOCKTOWER])
        XCTAssertEqual(archerSkeleton.element, RA_ELE_UNDEAD)
        XCTAssertEqual(archerSkeleton.elementLevel, 1)
        XCTAssertEqual(archerSkeleton.walkSpeed, 300)
        XCTAssertEqual(archerSkeleton.attackDelay, 2864)
        XCTAssertEqual(archerSkeleton.attackMotion, 864)
        XCTAssertEqual(archerSkeleton.damageMotion, 576)
        XCTAssertEqual(archerSkeleton.monsterClass, RA_CLASS_NORMAL)
        XCTAssertEqual(archerSkeleton.drops.count, 8)
        XCTAssertEqual(archerSkeleton.modes, UInt(RA_MONSTER_TYPE_05))

        let osiris = uniqueMonsters[1038]!
        XCTAssertEqual(osiris.monsterClass, RA_CLASS_BOSS)
//        XCTAssertEqual(osiris.modes, UInt(RA_MONSTER_TYPE_21) | UInt(RA_MD_MVP))
        XCTAssertEqual(osiris.mvpDrops.count, 3)
    }

    func testSkillTreeDatabase() {
        let skillTrees = RASkillTreeDatabase.shared.allRecords() as! [RASkillTree]
        XCTAssertEqual(skillTrees.count, 167)

        let uniqueSkillTrees = Dictionary(uniqueKeysWithValues: skillTrees.map({ ($0.job, $0) }))

        let acolyte = uniqueSkillTrees[RA_JOB_ACOLYTE]!
        XCTAssertEqual(acolyte.job, RA_JOB_ACOLYTE)
        XCTAssertEqual(acolyte.inherit as! [Int], [RA_JOB_NOVICE])
        XCTAssertEqual(acolyte.tree.count, 18)

        let archBishop = uniqueSkillTrees[RA_JOB_ARCH_BISHOP]!
        XCTAssertEqual(archBishop.job, RA_JOB_ARCH_BISHOP)
        XCTAssertEqual(archBishop.inherit as! [Int], [RA_JOB_NOVICE, RA_JOB_ACOLYTE, RA_JOB_PRIEST])
        XCTAssertEqual(archBishop.tree.count, 59)
    }

    func testSkillDatabase() {
        let skills = RASkillDatabase.shared.allRecords() as! [RASkill]
        XCTAssertEqual(skills.count, 1501)

        let uniqueSkills = Dictionary(uniqueKeysWithValues: skills.map({ ($0.skillName, $0) }))

        let napalmBeat = uniqueSkills["MG_NAPALMBEAT"]!
        XCTAssertEqual(napalmBeat.skillID, 11)
        XCTAssertEqual(napalmBeat.skillName, "MG_NAPALMBEAT")
        XCTAssertEqual(napalmBeat.skillDescription, "Napalm Beat")
        XCTAssertEqual(napalmBeat.maxLevel, 10)
        XCTAssertEqual(napalmBeat.type, RA_BF_MAGIC)
        XCTAssertEqual(napalmBeat.targetType, RA_INF_ATTACK_SKILL)
        XCTAssertEqual(napalmBeat.damageFlags, UInt(1 << RA_NK_SPLASH) | UInt(1 << RA_NK_SPLASHSPLIT))
        XCTAssertEqual(napalmBeat.flags, UInt(1 << RA_INF2_ISAUTOSHADOWSPELL) | UInt(1 << RA_INF2_TARGETTRAP))
        XCTAssertEqual(napalmBeat.range[0], 9)

        let spearBoomerang = uniqueSkills["KN_SPEARBOOMERANG"]!
        XCTAssertEqual(spearBoomerang.skillID, 59)
        XCTAssertEqual(spearBoomerang.skillName, "KN_SPEARBOOMERANG")
        XCTAssertEqual(spearBoomerang.skillDescription, "Spear Boomerang")
        XCTAssertEqual(spearBoomerang.maxLevel, 5)
        XCTAssertEqual(spearBoomerang.type, RA_BF_WEAPON)
        XCTAssertEqual(spearBoomerang.targetType, RA_INF_ATTACK_SKILL)
        XCTAssertEqual(spearBoomerang.range[0], 3)
        XCTAssertEqual(spearBoomerang.range[1], 5)
        XCTAssertEqual(spearBoomerang.range[2], 7)
        XCTAssertEqual(spearBoomerang.range[3], 9)
        XCTAssertEqual(spearBoomerang.range[4], 11)
    }

    static var allTests = [
        ("testMapServer", testMapServer),
        ("testItemDatabase", testItemDatabase),
        ("testMonsterDatabase", testMonsterDatabase),
        ("testSkillTreeDatabase", testSkillTreeDatabase),
        ("testSkillDatabase", testSkillDatabase),
    ]
}
