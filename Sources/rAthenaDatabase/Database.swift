//
//  Database.swift
//  rAthena
//
//  Created by Leon Li on 2023/1/20.
//

import Foundation
import rAthenaResource
import Yams

public class Database {

    private let renewal: Bool
    private let resourceManager: ResourceManager
    private let decoder: YAMLDecoder

    public static let renewal = Database(renewal: true)
    public static let prerenewal = Database(renewal: false)

    private init(renewal: Bool) {
        self.renewal = renewal
        self.resourceManager = ResourceManager()
        self.decoder = YAMLDecoder()
    }

    public func fetchItems() -> [Item] {
        let path = renewal ? "db/re/" : "db/pre-re/"

        let usableItemData = try! resourceManager.data(forResource: path + "item_db_usable.yml")
        let usableItemList = try! decoder.decode(List<Item>.self, from: usableItemData)

        let equipItemData = try! resourceManager.data(forResource: path + "item_db_equip.yml")
        let equipItemList = try! decoder.decode(List<Item>.self, from: equipItemData)

        let etcItemData = try! resourceManager.data(forResource: path + "item_db_etc.yml")
        let etcItemList = try! decoder.decode(List<Item>.self, from: etcItemData)

        let items = usableItemList.body + equipItemList.body + etcItemList.body
        return items
    }
}