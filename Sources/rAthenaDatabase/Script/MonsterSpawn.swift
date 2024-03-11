//
//  MonsterSpawn.swift
//  rAthena
//
//  Created by Leon Li on 2024/3/7.
//

/// Create a permanent monster spawn.
///
/// `<map name>{,<x>{,<y>{,<xs>{,<ys>}}}}%TAB%monster%TAB%<monster name>{,<monster level>}%TAB%<mob id>,<amount>{,<delay1>{,<delay2>{,<event>{,<mob size>{,<mob ai>}}}}}`
public struct MonsterSpawn {

    public var mapName: String

    public var x: Int?

    public var y: Int?

    public var xs: Int?

    public var ys: Int?

    public var monsterName: String

    public var monsterLevel: Int?

    public var monsterID: Int?

    public var monsterAegisName: String?

    public var amount: Int

    public var delay1: Int?

    public var delay2: Int?

    public var event: Int?

    public var monsterSize: Int?

    public var monsterAI: Int?

    init(_ w1: String, _ w2: String, _ w3: String, _ w4: String) {
        let column1 = w1.split(separator: ",")
        let column3 = w3.split(separator: ",")
        let column4 = w4.split(separator: ",")

        mapName = String(column1[0])
        x = column1.count > 1 ? Int(column1[1]) : nil
        y = column1.count > 2 ? Int(column1[2]) : nil
        xs = column1.count > 3 ? Int(column1[3]) : nil
        ys = column1.count > 4 ? Int(column1[4]) : nil

        monsterName = String(column3[0])
        monsterLevel = column3.count > 1 ? Int(column3[1]) : nil

        if let sprite = Int(column4[0]) {
            monsterID = sprite
        } else {
            monsterAegisName = String(column4[0])
        }
        amount = Int(column4[1])!
        delay1 = column4.count > 2 ? Int(column4[2]) : nil
        delay2 = column4.count > 3 ? Int(column4[3]) : nil
        event = column4.count > 4 ? Int(column4[4]) : nil
        monsterSize = column4.count > 5 ? Int(column4[5]) : nil
        monsterAI = column4.count > 6 ? Int(column4[6]) : nil
    }
}
