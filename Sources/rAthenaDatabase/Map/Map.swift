//
//  Map.swift
//  rAthena
//
//  Created by Leon Li on 2024/3/4.
//

public struct Map {

    /// Map name.
    public var name: String

    /// Map index.
    public var index: Int
}

extension Map: Comparable {
    public static func < (lhs: Map, rhs: Map) -> Bool {
        lhs.index < rhs.index
    }
}

extension Map: Identifiable {
    public var id: String {
        name
    }
}
