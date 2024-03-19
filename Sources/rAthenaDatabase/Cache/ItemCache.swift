//
//  ItemCache.swift
//  rAthena
//
//  Created by Leon Li on 2024/3/11.
//

actor ItemCache {
    private(set) var items: [Item] = []

    private var itemsByIDs: [Int : Item] = [:]
    private var itemsByAegisNames: [String : Item] = [:]

    var isEmpty: Bool {
        items.isEmpty
    }

    func storeItems(_ items: [Item]) {
        self.items = items
        itemsByIDs = Dictionary(items.map({ ($0.id, $0) }), uniquingKeysWith: { (first, _) in first })
        itemsByAegisNames = Dictionary(items.map({ ($0.aegisName, $0) }), uniquingKeysWith: { (first, _) in first })
    }

    func item(forID id: Int) -> Item? {
        itemsByIDs[id]
    }

    func item(forAegisName aegisName: String) -> Item? {
        itemsByAegisNames[aegisName]
    }
}
