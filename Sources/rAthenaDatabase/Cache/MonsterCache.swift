//
//  MonsterCache.swift
//  rAthena
//
//  Created by Leon Li on 2024/3/11.
//

actor MonsterCache {
    private(set) var monsters: [Monster] = []

    private var monstersByIDs: [Int : Monster] = [:]
    private var monstersByAegisNames: [String : Monster] = [:]

    var isEmpty: Bool {
        monsters.isEmpty
    }

    func storeMonsters(_ monsters: [Monster]) {
        self.monsters = monsters
        monstersByIDs = Dictionary(uniqueKeysWithValues: monsters.map({ ($0.id, $0) }))
        monstersByAegisNames = Dictionary(uniqueKeysWithValues: monsters.map({ ($0.aegisName, $0) }))
    }

    func monster(forID id: Int) -> Monster? {
        monstersByIDs[id]
    }

    func monster(forAegisName aegisName: String) -> Monster? {
        monstersByAegisNames[aegisName]
    }
}
