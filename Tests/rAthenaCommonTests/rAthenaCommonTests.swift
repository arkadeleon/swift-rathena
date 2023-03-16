//
//  rAthenaCommonTests.swift
//  rAthenaTests
//
//  Created by Leon Li on 2023/2/22.
//

import XCTest
@testable import rAthenaCommon

class rAthenaCommonTests: XCTestCase {

    func testItemDatabase() async {
        let db = RAItemDatabase()
        let items = await db.fetchItems(in: .renewal)
        XCTAssertEqual(items.count, 21812)

        let redPotion = items.first(where: { $0.itemID == 501 })!
        XCTAssert(redPotion.aegisName == "Red_Potion")
        XCTAssert(redPotion.name == "Red Potion")
        XCTAssert(redPotion.type == .healing)
        XCTAssert(redPotion.buy == 10)
        XCTAssert(redPotion.weight == 70)
        XCTAssert(redPotion.script == "itemheal rand(45,65),0;\n")

        let flyWing = items.first(where: { $0.itemID == 601 })!
        XCTAssert(flyWing.aegisName == "Wing_Of_Fly")
        XCTAssert(flyWing.name == "Fly Wing")
        XCTAssert(flyWing.type == .delayConsume)
        XCTAssert(flyWing.buy == 250)
        XCTAssert(flyWing.weight == 50)
        XCTAssert(flyWing.flags?.buyingStore == true)
        XCTAssert(flyWing.script == "itemskill \"AL_TELEPORT\",1;\n")

        let deadBranch = items.first(where: { $0.itemID == 604 })!
        XCTAssert(deadBranch.aegisName == "Branch_Of_Dead_Tree")
        XCTAssert(deadBranch.name == "Dead Branch")
        XCTAssert(deadBranch.type == .usable)
        XCTAssert(deadBranch.buy == 50)
        XCTAssert(deadBranch.weight == 50)
        XCTAssert(deadBranch.flags?.buyingStore == true)
        XCTAssert(deadBranch.flags?.deadBranch == true)
        XCTAssert(deadBranch.script == "monster \"this\",-1,-1,\"--ja--\",-1-MOBG_BRANCH_OF_DEAD_TREE,1,\"\";\n")

        let sword = items.first(where: { $0.itemID == 1101 })!
        XCTAssert(sword.aegisName == "Sword")
        XCTAssert(sword.name == "Sword")
        XCTAssert(sword.type == .weapon)
        XCTAssert(sword.subType?.asWeaponType() == .oneHandedSword)
        XCTAssert(sword.buy == 100)
        XCTAssert(sword.weight == 500)
        XCTAssert(sword.attack == 25)
        XCTAssert(sword.range == 1)
        XCTAssert(sword.slots == 3)
        XCTAssert(sword.jobs.contains(.alchemist))
        XCTAssert(sword.jobs.contains(.assassin))
        XCTAssert(sword.jobs.contains(.blacksmith))
        XCTAssert(sword.jobs.contains(.crusader))
        XCTAssert(sword.jobs.contains(.knight))
        XCTAssert(sword.jobs.contains(.merchant))
        XCTAssert(sword.jobs.contains(.novice))
        XCTAssert(sword.jobs.contains(.rogue))
        XCTAssert(sword.jobs.contains(.superNovice))
        XCTAssert(sword.jobs.contains(.swordman))
        XCTAssert(sword.jobs.contains(.thief))
        XCTAssert(sword.locations == .rightHand)
        XCTAssert(sword.weaponLevel == 1)
        XCTAssert(sword.equipLevelMin == 2)
        XCTAssert(sword.refineable == true)

        let sheild = items.first(where: { $0.itemID == 2105 })!
        XCTAssert(sheild.aegisName == "Shield")
        XCTAssert(sheild.name == "Shield")
        XCTAssert(sheild.type == .armor)
        XCTAssert(sheild.buy == 56000)
        XCTAssert(sheild.weight == 1300)
        XCTAssert(sheild.defense == 60)
        XCTAssert(sheild.jobs.contains(.crusader))
        XCTAssert(sheild.jobs.contains(.knight))
        XCTAssert(sheild.jobs.contains(.swordman))
        XCTAssert(sheild.locations == .leftHand)
        XCTAssert(sheild.armorLevel == 1)
        XCTAssert(sheild.refineable == true)

        let poringCard = items.first(where: { $0.itemID == 4001 })!
        XCTAssert(poringCard.aegisName == "Poring_Card")
        XCTAssert(poringCard.name == "Poring Card")
        XCTAssert(poringCard.type == .card)
        XCTAssert(poringCard.buy == 20)
        XCTAssert(poringCard.weight == 10)
        XCTAssert(poringCard.locations == .armor)
        XCTAssert(poringCard.flags?.buyingStore == true)
        XCTAssert(poringCard.flags?.dropEffect == "CLIENT")
        XCTAssert(poringCard.script == "bonus bLuk,2;\nbonus bFlee2,1;\n")
    }

    func testMonsterDatabase() async {
        let db = RAMonsterDatabase()
        let monsters = await db.fetchMonsters(in: .renewal)
        XCTAssertEqual(monsters.count, 2286)

        let poring = monsters.first(where: { $0.monsterID == 1002 })!
        XCTAssertEqual(poring.aegisName, "PORING")
        XCTAssertEqual(poring.name, "Poring")
        XCTAssertEqual(poring.level, 1)
        XCTAssertEqual(poring.hp, 60)
        XCTAssertEqual(poring.baseExp, 150)
        XCTAssertEqual(poring.jobExp, 40)
        XCTAssertEqual(poring.attack, 8)
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
        XCTAssertEqual(poring.size, .medium)
        XCTAssertEqual(poring.race, .plant)
        XCTAssertEqual(poring.element, .water)
        XCTAssertEqual(poring.elementLevel, 1)
        XCTAssertEqual(poring.walkSpeed, 400)
        XCTAssertEqual(poring.attackDelay, 1872)
        XCTAssertEqual(poring.attackMotion, 672)
        XCTAssertEqual(poring.damageMotion, 480)
        XCTAssertEqual(poring.ai, .ai02)
        XCTAssertEqual(poring.drops?.count, 8)

        let archerSkeleton = monsters.first(where: { $0.monsterID == 1016 })!
        XCTAssertEqual(archerSkeleton.aegisName, "ARCHER_SKELETON")
        XCTAssertEqual(archerSkeleton.name, "Archer Skeleton")
        XCTAssertEqual(archerSkeleton.level, 50)
        XCTAssertEqual(archerSkeleton.hp, 1646)
        XCTAssertEqual(archerSkeleton.baseExp, 436)
        XCTAssertEqual(archerSkeleton.jobExp, 327)
        XCTAssertEqual(archerSkeleton.attack, 95)
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
        XCTAssertEqual(archerSkeleton.size, .medium)
        XCTAssertEqual(archerSkeleton.race, .undead)
        XCTAssertEqual(archerSkeleton.raceGroups, [.clocktower])
        XCTAssertEqual(archerSkeleton.element, .undead)
        XCTAssertEqual(archerSkeleton.elementLevel, 1)
        XCTAssertEqual(archerSkeleton.walkSpeed, 300)
        XCTAssertEqual(archerSkeleton.attackDelay, 2864)
        XCTAssertEqual(archerSkeleton.attackMotion, 864)
        XCTAssertEqual(archerSkeleton.damageMotion, 576)
        XCTAssertEqual(archerSkeleton.ai, .ai05)
        XCTAssertEqual(archerSkeleton.drops?.count, 8)
    }

    func testSkillTreeDatabase() async {
        let db = RASkillDatabase()
        let skillTrees = await db.fetchSkillTrees(in: .renewal)
        XCTAssertEqual(skillTrees.count, 167)
    }

    static var allTests = [
        ("testItemDatabase", testItemDatabase),
        ("testMonsterDatabase", testMonsterDatabase),
        ("testSkillTreeDatabase", testSkillTreeDatabase),
    ]
}
