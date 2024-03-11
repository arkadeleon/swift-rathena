//
//  ScriptCache.swift
//  rAthena
//
//  Created by Leon Li on 2024/3/11.
//

actor ScriptCache {
    private(set) var monsterSpawns: [MonsterSpawn] = []

    var isEmpty: Bool {
        monsterSpawns.isEmpty
    }

    func store(monsterSpawns: [MonsterSpawn]) {
        self.monsterSpawns = monsterSpawns
    }
}
