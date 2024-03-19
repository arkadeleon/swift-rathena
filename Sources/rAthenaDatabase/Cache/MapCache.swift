//
//  MapCache.swift
//  rAthena
//
//  Created by Leon Li on 2024/3/11.
//

actor MapCache {
    private(set) var maps: [Map] = []

    private var mapsByNames: [String : Map] = [:]

    var isEmpty: Bool {
        maps.isEmpty
    }

    func storeMaps(_ maps: [Map]) {
        self.maps = maps
        mapsByNames = Dictionary(maps.map({ ($0.name, $0) }), uniquingKeysWith: { (first, _) in first })
    }

    func map(forName name: String) -> Map? {
        mapsByNames[name]
    }
}
