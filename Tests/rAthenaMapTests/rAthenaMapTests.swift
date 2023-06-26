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

    func testItemDatabase() async {
        let database = RAItemDatabase()
        let items = await database.fetchItems()
        XCTAssertEqual(items.count, 22425)

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
        XCTAssertEqual(sword.jobs11, UInt(1 << RA_MAPID_NOVICE) | UInt(1 << RA_MAPID_SWORDMAN) | UInt(1 << RA_MAPID_MERCHANT) | UInt(1 << RA_MAPID_THIEF))
        XCTAssertEqual(sword.jobs21, UInt(1 << (RA_MAPID_SUPER_NOVICE & RA_MAPID_BASEMASK)) | UInt(1 << (RA_MAPID_KNIGHT & RA_MAPID_BASEMASK)) | UInt(1 << (RA_MAPID_BLACKSMITH & RA_MAPID_BASEMASK)) | UInt(1 << (RA_MAPID_ASSASSIN & RA_MAPID_BASEMASK)))
        XCTAssertEqual(sword.jobs22, UInt(1 << (RA_MAPID_CRUSADER & RA_MAPID_BASEMASK)) | UInt(1 << (RA_MAPID_ALCHEMIST & RA_MAPID_BASEMASK)) | UInt(1 << (RA_MAPID_ROGUE & RA_MAPID_BASEMASK)))
        XCTAssertEqual(sword.locations, RA_EQP_HAND_R)
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
        XCTAssertEqual(eraser.jobs11, UInt(1 << RA_MAPID_MAGE) | UInt(1 << RA_MAPID_ACOLYTE))
        XCTAssertEqual(eraser.jobs21, UInt(1 << (RA_MAPID_WIZARD & RA_MAPID_BASEMASK)) | UInt(1 << (RA_MAPID_PRIEST & RA_MAPID_BASEMASK)))
        XCTAssertEqual(eraser.jobs22, UInt(1 << (RA_MAPID_SAGE & RA_MAPID_BASEMASK)) | UInt(1 << (RA_MAPID_MONK & RA_MAPID_BASEMASK)))
        XCTAssertEqual(eraser.classes, RA_ITEMJ_ALL_UPPER)
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
        XCTAssertEqual(sheild.jobs11, UInt(1 << RA_MAPID_SWORDMAN))
        XCTAssertEqual(sheild.jobs21, UInt(1 << (RA_MAPID_KNIGHT & RA_MAPID_BASEMASK)))
        XCTAssertEqual(sheild.jobs22, UInt(1 << (RA_MAPID_CRUSADER & RA_MAPID_BASEMASK)))
        XCTAssertEqual(sheild.locations, RA_EQP_HAND_L)
        XCTAssertEqual(sheild.armorLevel, 1)
        XCTAssertEqual(sheild.refineable, true)

        let turban = uniqueItems[2222]!
        XCTAssertEqual(turban.aegisName, "Turban")
        XCTAssertEqual(turban.name, "Turban")
        XCTAssertEqual(turban.type, RA_IT_ARMOR)
        XCTAssertEqual(turban.buy, 4500)
        XCTAssertEqual(turban.weight, 300)
        XCTAssertEqual(turban.defense, 5)
        XCTAssertEqual(turban.jobs11, UInt.max & ~UInt(1 << RA_MAPID_NOVICE))
        XCTAssertEqual(turban.jobs21, UInt.max & ~UInt(1 << (RA_MAPID_SUPER_NOVICE & RA_MAPID_BASEMASK)))
        XCTAssertEqual(turban.jobs22, UInt.max)
        XCTAssertEqual(turban.locations, RA_EQP_HEAD_TOP)
        XCTAssertEqual(turban.armorLevel, 1)
        XCTAssertEqual(turban.refineable, true)
        XCTAssertEqual(turban.view, 7)

        let poringCard = uniqueItems[4001]!
        XCTAssertEqual(poringCard.aegisName, "Poring_Card")
        XCTAssertEqual(poringCard.name, "Poring Card")
        XCTAssertEqual(poringCard.type, RA_IT_CARD)
        XCTAssertEqual(poringCard.buy, 20)
        XCTAssertEqual(poringCard.weight, 10)
        XCTAssertEqual(poringCard.locations, RA_EQP_ARMOR)
        XCTAssertEqual(poringCard.flags.buyingStore, true)
        XCTAssertEqual(poringCard.flags.dropEffect, RA_DROPEFFECT_CLIENT)
//        XCTAssertEqual(poringCard.script, "bonus bLuk,2;\nbonus bFlee2,1;\n")
    }

    static var allTests = [
        ("testMapServer", testMapServer),
        ("testItemDatabase", testItemDatabase),
    ]
}
