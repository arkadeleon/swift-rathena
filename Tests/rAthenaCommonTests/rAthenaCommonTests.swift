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
        let items = await db.fetchAllItems()
        XCTAssert(items.count == 21404)

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
        XCTAssert(sword.subType == .oneHandedSword)
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
        let monsters = await db.fetchAllMonsters()
        XCTAssert(monsters.count == 2262)

        let poring = monsters.first(where: { $0.monsterID == 1002 })!
        XCTAssert(poring.aegisName == "PORING")
        XCTAssert(poring.name == "Poring")
        XCTAssert(poring.level == 1)
        XCTAssert(poring.hp == 60)
        XCTAssert(poring.baseExp == 150)
        XCTAssert(poring.jobExp == 40)
        XCTAssert(poring.attack == 8)
        XCTAssert(poring.attack2 == 1)
        XCTAssert(poring.defense == 2)
        XCTAssert(poring.magicDefense == 5)
        XCTAssert(poring.strength == 6)
        XCTAssert(poring.agility == 1)
        XCTAssert(poring.vitality == 1)
        XCTAssert(poring.intelligence == 1)
        XCTAssert(poring.dexterity == 6)
        XCTAssert(poring.luck == 5)
        XCTAssert(poring.attackRange == 1)
        XCTAssert(poring.skillRange == 10)
        XCTAssert(poring.chaseRange == 12)
        XCTAssert(poring.size == .medium)
        XCTAssert(poring.race == .plant)
        XCTAssert(poring.element == .water)
        XCTAssert(poring.elementLevel == 1)
        XCTAssert(poring.walkSpeed == 400)
        XCTAssert(poring.attackDelay == 1872)
        XCTAssert(poring.attackMotion == 672)
        XCTAssert(poring.damageMotion == 480)
//        XCTAssert(poring.ai == .AI02)
        XCTAssert(poring.drops?.count == 8)
    }

    static var allTests = [
        ("testItemDatabase", testItemDatabase),
        ("testMonsterDatabase", testMonsterDatabase),
    ]
}
