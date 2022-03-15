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
        try create_db_roulette(db)
        try create_bonus_script(db)
        try create_buyingstore_items(db)
        try create_buyingstores(db)
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

    private func create_db_roulette(_ db: Connection) throws {
        let db_roulette = Table("db_roulette")
        let index = Expression<Int64>("index");
        let level = Expression<Int64>("level")
        let item_id = Expression<Int64>("item_id")
        let amount = Expression<Int64>("amount")
        let flag = Expression<Int64>("flag")

        try db.run(db_roulette.create(ifNotExists: true) { t in
            t.column(index, primaryKey: true, defaultValue: 0)
            t.column(level)
            t.column(item_id)
            t.column(amount, defaultValue: 1)
            t.column(flag, defaultValue: 1)
        })

        try db.run(db_roulette.insert(index <- 0, level <- 1, item_id <- 675, amount <- 1, flag <- 1 ))     // Silver_Coin
        try db.run(db_roulette.insert(index <- 1, level <- 1, item_id <- 671, amount <- 1, flag <- 0 ))     // Gold_Coin
        try db.run(db_roulette.insert(index <- 2, level <- 1, item_id <- 678, amount <- 1, flag <- 0 ))     // Poison_Bottle
        try db.run(db_roulette.insert(index <- 3, level <- 1, item_id <- 604, amount <- 1, flag <- 0 ))     // Branch_Of_Dead_Tree
        try db.run(db_roulette.insert(index <- 4, level <- 1, item_id <- 522, amount <- 1, flag <- 0 ))     // Fruit_Of_Mastela
        try db.run(db_roulette.insert(index <- 5, level <- 1, item_id <- 12609, amount <- 1, flag <- 0 ))   // Old_Ore_Box
        try db.run(db_roulette.insert(index <- 6, level <- 1, item_id <- 12523, amount <- 1, flag <- 0 ))   // E_Inc_Agi_10_Scroll
        try db.run(db_roulette.insert(index <- 7, level <- 1, item_id <- 985, amount <- 1, flag <- 0 ))     // Elunium
        try db.run(db_roulette.insert(index <- 8, level <- 1, item_id <- 984, amount <- 1, flag <- 0 ))     // Oridecon

        try db.run(db_roulette.insert(index <- 9, level <- 2, item_id <- 675, amount <- 1, flag <- 1 ))     // Silver_Coin
        try db.run(db_roulette.insert(index <- 10, level <- 2, item_id <- 671, amount <- 1, flag <- 0 ))    // Gold_Coin
        try db.run(db_roulette.insert(index <- 11, level <- 2, item_id <- 603, amount <- 1, flag <- 0 ))    // Old_Blue_Box
        try db.run(db_roulette.insert(index <- 12, level <- 2, item_id <- 608, amount <- 1, flag <- 0 ))    // Seed_Of_Yggdrasil
        try db.run(db_roulette.insert(index <- 13, level <- 2, item_id <- 607, amount <- 1, flag <- 0 ))    // Yggdrasilberry
        try db.run(db_roulette.insert(index <- 14, level <- 2, item_id <- 12522, amount <- 1, flag <- 0 ))  // E_Blessing_10_Scroll
        try db.run(db_roulette.insert(index <- 15, level <- 2, item_id <- 6223, amount <- 1, flag <- 0 ))   // Carnium
        try db.run(db_roulette.insert(index <- 16, level <- 2, item_id <- 6224, amount <- 1, flag <- 0 ))   // Bradium

        try db.run(db_roulette.insert(index <- 17, level <- 3, item_id <- 675, amount <- 1, flag <- 1 ))    // Silver_Coin
        try db.run(db_roulette.insert(index <- 18, level <- 3, item_id <- 671, amount <- 1, flag <- 0 ))    // Gold_Coin
        try db.run(db_roulette.insert(index <- 19, level <- 3, item_id <- 12108, amount <- 1, flag <- 0 ))  // Bundle_Of_Magic_Scroll
        try db.run(db_roulette.insert(index <- 20, level <- 3, item_id <- 617, amount <- 1, flag <- 0 ))    // Old_Violet_Box
        try db.run(db_roulette.insert(index <- 21, level <- 3, item_id <- 12514, amount <- 1, flag <- 0 ))  // E_Abrasive
        try db.run(db_roulette.insert(index <- 22, level <- 3, item_id <- 7444, amount <- 1, flag <- 0 ))   // Treasure_Box
        try db.run(db_roulette.insert(index <- 23, level <- 3, item_id <- 969, amount <- 1, flag <- 0 ))    // Gold

        try db.run(db_roulette.insert(index <- 24, level <- 4, item_id <- 675, amount <- 1, flag <- 1 ))    // Silver_Coin
        try db.run(db_roulette.insert(index <- 25, level <- 4, item_id <- 671, amount <- 1, flag <- 0 ))    // Gold_Coin
        try db.run(db_roulette.insert(index <- 26, level <- 4, item_id <- 616, amount <- 1, flag <- 0 ))    // Old_Card_Album
        try db.run(db_roulette.insert(index <- 27, level <- 4, item_id <- 12516, amount <- 1, flag <- 0 ))  // E_Small_Life_Potion
        try db.run(db_roulette.insert(index <- 28, level <- 4, item_id <- 22777, amount <- 1, flag <- 0 ))  // Gift_Buff_Set
        try db.run(db_roulette.insert(index <- 29, level <- 4, item_id <- 6231, amount <- 1, flag <- 0 ))   // Guarantee_Weapon_6Up

        try db.run(db_roulette.insert(index <- 30, level <- 5, item_id <- 671, amount <- 1, flag <- 1 ))    // Gold_Coin
        try db.run(db_roulette.insert(index <- 31, level <- 5, item_id <- 12246, amount <- 1, flag <- 0 ))  // Magic_Card_Album
        try db.run(db_roulette.insert(index <- 32, level <- 5, item_id <- 12263, amount <- 1, flag <- 0 ))  // Comp_Battle_Manual
        try db.run(db_roulette.insert(index <- 33, level <- 5, item_id <- 12831, amount <- 1, flag <- 0 ))  // Potion_Box
        try db.run(db_roulette.insert(index <- 34, level <- 5, item_id <- 6235, amount <- 1, flag <- 0 ))   // Guarantee_Armor_6Up

        try db.run(db_roulette.insert(index <- 35, level <- 6, item_id <- 671, amount <- 1, flag <- 1 ))    // Gold_Coin
        try db.run(db_roulette.insert(index <- 36, level <- 6, item_id <- 12766, amount <- 1, flag <- 0 ))  // Reward_Job_BM25
        try db.run(db_roulette.insert(index <- 37, level <- 6, item_id <- 6234, amount <- 1, flag <- 0 ))   // Guarantee_Armor_7Up
        try db.run(db_roulette.insert(index <- 38, level <- 6, item_id <- 6233, amount <- 1, flag <- 0 ))   // Guarantee_Armor_8Up

        try db.run(db_roulette.insert(index <- 39, level <- 7, item_id <- 671, amount <- 1, flag <- 1 ))    // Gold_Coin
        try db.run(db_roulette.insert(index <- 40, level <- 7, item_id <- 6233, amount <- 1, flag <- 0 ))   // Guarantee_Armor_8Up
        try db.run(db_roulette.insert(index <- 41, level <- 7, item_id <- 6233, amount <- 1, flag <- 0 ))   // Guarantee_Armor_8Up (KRO lists this twice)
    }

    private func create_bonus_script(_ db: Connection) throws {
        let bonus_script = Table("bonus_script")
        let char_id = Expression<Int64>("char_id")
        let script = Expression<String>("script")
        let tick = Expression<Int64>("tick")
        let flag = Expression<Int64>("flag")
        let type = Expression<Int64>("type")
        let icon = Expression<Int64>("icon")

        try db.run(bonus_script.create(ifNotExists: true) { t in
            t.column(char_id)
            t.column(script)
            t.column(tick, defaultValue: 0)
            t.column(flag, defaultValue: 0)
            t.column(type, defaultValue: 0)
            t.column(icon, defaultValue: -1)
        })

        try db.run(bonus_script.createIndex(char_id, ifNotExists: true))
    }

    private func create_buyingstore_items(_ db: Connection) throws {
        let buyingstore_items = Table("buyingstore_items")
        let buyingstore_id = Expression<Int64>("buyingstore_id")
        let index = Expression<Int64>("index")
        let item_id = Expression<Int64>("item_id")
        let amount = Expression<Int64>("amount")
        let price = Expression<Int64>("price")

        try db.run(buyingstore_items.create(ifNotExists: true) { t in
            t.column(buyingstore_id, primaryKey: true)
            t.column(index, primaryKey: true)
            t.column(item_id)
            t.column(amount)
            t.column(price)
        })
    }

    private func create_buyingstores(_ db: Connection) throws {
        let buyingstores = Table("buyingstores")
        let id = Expression<Int64>("id")
        let account_id = Expression<Int64>("account_id")
        let char_id = Expression<Int64>("char_id")
        let sex = Expression<String>("sex")
        let map = Expression<String>("map")
        let x = Expression<Int64>("x")
        let y = Expression<Int64>("y")
        let title = Expression<String>("title")
        let limit = Expression<Int64>("limit")
        let body_direction = Expression<String>("body_direction")
        let head_direction = Expression<String>("head_direction")
        let sit = Expression<String>("sit")
        let autotrade = Expression<Int64>("autotrade")

        try db.run(buyingstores.create(ifNotExists: true) { t in
            t.column(id, primaryKey: true)
            t.column(account_id)
            t.column(char_id)
            t.column(sex, defaultValue: "M")
            t.column(map)
            t.column(x)
            t.column(y)
            t.column(title)
            t.column(limit)
            t.column(body_direction, defaultValue: "4")
            t.column(head_direction, defaultValue: "0")
            t.column(sit, defaultValue: "1")
            t.column(autotrade)
        })
    }
}

extension TableBuilder {

    func column<V: Value>(_ name: Expression<V>, primaryKey: Bool, defaultValue: V) {
        column(name, primaryKey: primaryKey, defaultValue: Expression(value: defaultValue))
    }
}
