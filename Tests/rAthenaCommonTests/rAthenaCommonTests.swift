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
        XCTAssertEqual(redPotion.aegisName, "Red_Potion")
        XCTAssertEqual(redPotion.name, "Red Potion")
        XCTAssertEqual(redPotion.type, .healing)
        XCTAssertEqual(redPotion.buy, 10)
        XCTAssertEqual(redPotion.weight, 70)
        XCTAssertEqual(redPotion.script, "itemheal rand(45,65),0;\n")

        let flyWing = items.first(where: { $0.itemID == 601 })!
        XCTAssertEqual(flyWing.aegisName, "Wing_Of_Fly")
        XCTAssertEqual(flyWing.name, "Fly Wing")
        XCTAssertEqual(flyWing.type, .delayConsume)
        XCTAssertEqual(flyWing.buy, 250)
        XCTAssertEqual(flyWing.weight, 50)
        XCTAssertEqual(flyWing.flags?.buyingStore, true)
        XCTAssertEqual(flyWing.script, "itemskill \"AL_TELEPORT\",1;\n")

        let deadBranch = items.first(where: { $0.itemID == 604 })!
        XCTAssertEqual(deadBranch.aegisName, "Branch_Of_Dead_Tree")
        XCTAssertEqual(deadBranch.name, "Dead Branch")
        XCTAssertEqual(deadBranch.type, .usable)
        XCTAssertEqual(deadBranch.buy, 50)
        XCTAssertEqual(deadBranch.weight, 50)
        XCTAssertEqual(deadBranch.flags?.buyingStore, true)
        XCTAssertEqual(deadBranch.flags?.deadBranch, true)
        XCTAssertEqual(deadBranch.script, "monster \"this\",-1,-1,\"--ja--\",-1-MOBG_BRANCH_OF_DEAD_TREE,1,\"\";\n")

        let sword = items.first(where: { $0.itemID == 1101 })!
        XCTAssertEqual(sword.aegisName, "Sword")
        XCTAssertEqual(sword.name, "Sword")
        XCTAssertEqual(sword.type, .weapon)
        XCTAssertEqual(sword.subType?.asWeaponType(), .oneHandedSword)
        XCTAssertEqual(sword.buy, 100)
        XCTAssertEqual(sword.weight, 500)
        XCTAssertEqual(sword.attack, 25)
        XCTAssertEqual(sword.range, 1)
        XCTAssertEqual(sword.slots, 3)
        XCTAssertEqual(sword.jobs, [.alchemist, .assassin, .blacksmith, .crusader, .knight, .merchant, .novice, .rogue, .superNovice, .swordman, .thief])
        XCTAssertEqual(sword.locations, [.rightHand])
        XCTAssertEqual(sword.weaponLevel, 1)
        XCTAssertEqual(sword.equipLevelMin, 2)
        XCTAssertEqual(sword.refineable, true)

        let eraser = items.first(where: { $0.itemID == 1637 })!
        XCTAssertEqual(eraser.aegisName, "Eraser")
        XCTAssertEqual(eraser.name, "Eraser")
        XCTAssertEqual(eraser.type, .weapon)
        XCTAssertEqual(eraser.subType?.asWeaponType(), .staff)
        XCTAssertEqual(eraser.buy, 20)
        XCTAssertEqual(eraser.weight, 500)
        XCTAssertEqual(eraser.attack, 80)
        XCTAssertEqual(eraser.magicAttack, 170)
        XCTAssertEqual(eraser.range, 1)
        XCTAssertEqual(eraser.jobs, [.acolyte, .mage, .monk, .priest, .sage, .wizard])
        XCTAssertEqual(eraser.classes, Set(RAItemClass.allUpper))
        XCTAssertEqual(eraser.weaponLevel, 4)
        XCTAssertEqual(eraser.equipLevelMin, 70)
        XCTAssertEqual(eraser.refineable, true)

        let sheild = items.first(where: { $0.itemID == 2105 })!
        XCTAssertEqual(sheild.aegisName, "Shield")
        XCTAssertEqual(sheild.name, "Shield")
        XCTAssertEqual(sheild.type, .armor)
        XCTAssertEqual(sheild.buy, 56000)
        XCTAssertEqual(sheild.weight, 1300)
        XCTAssertEqual(sheild.defense, 60)
        XCTAssertEqual(sheild.jobs, [.crusader, .knight, .swordman])
        XCTAssertEqual(sheild.locations, [.leftHand])
        XCTAssertEqual(sheild.armorLevel, 1)
        XCTAssertEqual(sheild.refineable, true)

        let turban = items.first(where: { $0.itemID == 2222 })!
        XCTAssertEqual(turban.aegisName, "Turban")
        XCTAssertEqual(turban.name, "Turban")
        XCTAssertEqual(turban.type, .armor)
        XCTAssertEqual(turban.buy, 4500)
        XCTAssertEqual(turban.weight, 300)
        XCTAssertEqual(turban.defense, 5)
        XCTAssertEqual(turban.jobs, Set(RAItemJob.allCases).subtracting([.novice, .superNovice]))
        XCTAssertEqual(turban.locations, [.headTop])
        XCTAssertEqual(turban.armorLevel, 1)
        XCTAssertEqual(turban.refineable, true)
        XCTAssertEqual(turban.view, 7)

        let poringCard = items.first(where: { $0.itemID == 4001 })!
        XCTAssertEqual(poringCard.aegisName, "Poring_Card")
        XCTAssertEqual(poringCard.name, "Poring Card")
        XCTAssertEqual(poringCard.type, .card)
        XCTAssertEqual(poringCard.buy, 20)
        XCTAssertEqual(poringCard.weight, 10)
        XCTAssertEqual(poringCard.locations, [.armor])
        XCTAssertEqual(poringCard.flags?.buyingStore, true)
        XCTAssertEqual(poringCard.flags?.dropEffect, "CLIENT")
        XCTAssertEqual(poringCard.script, "bonus bLuk,2;\nbonus bFlee2,1;\n")
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
        XCTAssertEqual(poring.monsterClass, .normal)
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
        XCTAssertEqual(archerSkeleton.monsterClass, .normal)
        XCTAssertEqual(archerSkeleton.drops?.count, 8)

        let osiris = monsters.first(where: { $0.monsterID == 1038 })!
        XCTAssertEqual(osiris.monsterClass, .boss)
        XCTAssertEqual(osiris.modes, [.mvp])
        XCTAssertEqual(osiris.mvpDrops?.count, 3)
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
