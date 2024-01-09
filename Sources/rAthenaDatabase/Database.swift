//
//  Database.swift
//  rAthena
//
//  Created by Leon Li on 2023/1/20.
//

import rAthenaResource
import Yams

public class Database {
    private let renewal: Bool
    private let decoder: YAMLDecoder

    public static let renewal = Database(renewal: true)
    public static let prerenewal = Database(renewal: false)

    private init(renewal: Bool) {
        self.renewal = renewal
        self.decoder = YAMLDecoder()
    }

    public func fetchItems() async throws -> [Item] {
        let path = renewal ? "db/re/" : "db/pre-re/"

        let usableItemData = try ResourceManager.shared.data(forResource: path + "item_db_usable.yml")
        let usableItemList = try decoder.decode(List<Item>.self, from: usableItemData)

        let equipItemData = try ResourceManager.shared.data(forResource: path + "item_db_equip.yml")
        let equipItemList = try decoder.decode(List<Item>.self, from: equipItemData)

        let etcItemData = try ResourceManager.shared.data(forResource: path + "item_db_etc.yml")
        let etcItemList = try decoder.decode(List<Item>.self, from: etcItemData)

        let items = usableItemList.body + equipItemList.body + etcItemList.body
        return items
    }
}
