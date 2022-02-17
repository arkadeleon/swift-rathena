//
//  DatabaseManager.swift
//  rAthena
//
//  Created by Leon Li on 2022/2/17.
//

import SQLite

public class DatabaseManager {

    private func create(_ filename: String) throws {
        let db = try Connection(filename)

        try create_acc_reg_num(db)
        try create_acc_reg_str(db)
        try create_achievement(db)
        try create_auction(db)
    }

    private func create_acc_reg_num(_ db: Connection) throws {
        let acc_reg_num = Table("acc_reg_num")
        let account_id = Expression<Int64>("account_id")
        let key = Expression<String>("key")
        let index = Expression<Int64>("index")
        let value = Expression<Int64>("value")

        try db.run(acc_reg_num.create(ifNotExists: true) { t in
            t.column(account_id, primaryKey: true, defaultValue: 0)
            t.column(key, primaryKey: true, defaultValue: "")
            t.column(index, primaryKey: true, defaultValue: 0)
            t.column(value, defaultValue: 0)
        })

        try db.run(acc_reg_num.createIndex(account_id, ifNotExists: true))
    }

    private func create_acc_reg_str(_ db: Connection) throws {
        let acc_reg_str = Table("acc_reg_str")
        let account_id = Expression<Int64>("account_id")
        let key = Expression<String>("key")
        let index = Expression<Int64>("index")
        let value = Expression<String>("value")

        try db.run(acc_reg_str.create(ifNotExists: true) { t in
            t.column(account_id, primaryKey: true, defaultValue: 0)
            t.column(key, primaryKey: true, defaultValue: "")
            t.column(index, primaryKey: true, defaultValue: 0)
            t.column(value, defaultValue: "0")
        })

        try db.run(acc_reg_str.createIndex(account_id, ifNotExists: true))
    }

    private func create_achievement(_ db: Connection) throws {
        let achievement = Table("achievement")
        let char_id = Expression<Int64>("char_id")
        let id = Expression<Int64>("id")
        let count1 = Expression<Int64>("count1")
        let count2 = Expression<Int64>("count2")
        let count3 = Expression<Int64>("count3")
        let count4 = Expression<Int64>("count4")
        let count5 = Expression<Int64>("count5")
        let count6 = Expression<Int64>("count6")
        let count7 = Expression<Int64>("count7")
        let count8 = Expression<Int64>("count8")
        let count9 = Expression<Int64>("count9")
        let count10 = Expression<Int64>("count10")
        let completed = Expression<String?>("completed")
        let rewarded = Expression<String?>("rewarded")

        try db.run(achievement.create(ifNotExists: true) { t in
            t.column(char_id, primaryKey: true, defaultValue: 0)
            t.column(id, primaryKey: true)
            t.column(count1, defaultValue: 0)
            t.column(count2, defaultValue: 0)
            t.column(count3, defaultValue: 0)
            t.column(count4, defaultValue: 0)
            t.column(count5, defaultValue: 0)
            t.column(count6, defaultValue: 0)
            t.column(count7, defaultValue: 0)
            t.column(count8, defaultValue: 0)
            t.column(count9, defaultValue: 0)
            t.column(count10, defaultValue: 0)
            t.column(completed)
            t.column(rewarded)
        })

        try db.run(achievement.createIndex(char_id, ifNotExists: true))
    }

    private func create_auction(_ db: Connection) throws {
        let auction = Table("auction")
        let auction_id = Expression<Int64>("auction_id")
        let seller_id = Expression<Int64>("seller_id")
        let seller_name = Expression<String>("seller_name")
        let buyer_id = Expression<Int64>("buyer_id")
        let buyer_name = Expression<String>("buyer_name")
        let price = Expression<Int64>("price")
        let buynow = Expression<Int64>("buynow")
        let hours = Expression<Int64>("hours")
        let timestamp = Expression<Int64>("timestamp")
        let nameid = Expression<Int64>("nameid")
        let item_name = Expression<String>("item_name")
        let type = Expression<Int64>("type")
        let refine = Expression<Int64>("refine")
        let attribute = Expression<Int64>("attribute")
        let card0 = Expression<Int64>("card0")
        let card1 = Expression<Int64>("card1")
        let card2 = Expression<Int64>("card2")
        let card3 = Expression<Int64>("card3")
        let option_id0 = Expression<Int64>("option_id0")
        let option_val0 = Expression<Int64>("option_val0")
        let option_parm0 = Expression<Int64>("option_parm0")
        let option_id1 = Expression<Int64>("option_id1")
        let option_val1 = Expression<Int64>("option_val1")
        let option_parm1 = Expression<Int64>("option_parm1")
        let option_id2 = Expression<Int64>("option_id2")
        let option_val2 = Expression<Int64>("option_val2")
        let option_parm2 = Expression<Int64>("option_parm2")
        let option_id3 = Expression<Int64>("option_id3")
        let option_val3 = Expression<Int64>("option_val3")
        let option_parm3 = Expression<Int64>("option_parm3")
        let option_id4 = Expression<Int64>("option_id4")
        let option_val4 = Expression<Int64>("option_val4")
        let option_parm4 = Expression<Int64>("option_parm4")
        let unique_id = Expression<Int64>("unique_id")
        let enchantgrade = Expression<Int64>("enchantgrade")

        try db.run(auction.create(ifNotExists: true) { t in
            t.column(auction_id, primaryKey: .autoincrement)
            t.column(seller_id, defaultValue: 0)
            t.column(seller_name, defaultValue: "")
            t.column(buyer_id, defaultValue: 0)
            t.column(buyer_name, defaultValue: "")
            t.column(price, defaultValue: 0)
            t.column(buynow, defaultValue: 0)
            t.column(hours, defaultValue: 0)
            t.column(timestamp, defaultValue: 0)
            t.column(nameid, defaultValue: 0)
            t.column(item_name, defaultValue: "")
            t.column(type, defaultValue: 0)
            t.column(refine, defaultValue: 0)
            t.column(attribute, defaultValue: 0)
            t.column(card0, defaultValue: 0)
            t.column(card1, defaultValue: 0)
            t.column(card2, defaultValue: 0)
            t.column(card3, defaultValue: 0)
            t.column(option_id0, defaultValue: 0)
            t.column(option_val0, defaultValue: 0)
            t.column(option_parm0, defaultValue: 0)
            t.column(option_id1, defaultValue: 0)
            t.column(option_val1, defaultValue: 0)
            t.column(option_parm1, defaultValue: 0)
            t.column(option_id2, defaultValue: 0)
            t.column(option_val2, defaultValue: 0)
            t.column(option_parm2, defaultValue: 0)
            t.column(option_id3, defaultValue: 0)
            t.column(option_val3, defaultValue: 0)
            t.column(option_parm3, defaultValue: 0)
            t.column(option_id4, defaultValue: 0)
            t.column(option_val4, defaultValue: 0)
            t.column(option_parm4, defaultValue: 0)
            t.column(unique_id, defaultValue: 0)
            t.column(enchantgrade, defaultValue: 0)
        })
    }
}

extension TableBuilder {

    func column<V: Value>(_ name: Expression<V>, primaryKey: Bool, defaultValue: V) {
        column(name, primaryKey: primaryKey, defaultValue: Expression(value: defaultValue))
    }
}
