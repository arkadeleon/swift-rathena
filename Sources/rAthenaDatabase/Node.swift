//
//  Node.swift
//  rAthena
//
//  Created by Leon Li on 2024/1/10.
//

public struct Node<Key, Value>: Sequence, Decodable where Key: CaseIterable, Key: CodingKey, Value: Decodable {

    private var children: [(Key, Value)]

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        self.children = try Key.allCases.compactMap { key in
            if let value = try container.decodeIfPresent(Value.self, forKey: key) {
                return (key, value)
            } else {
                return nil
            }
        }
    }

    public func makeIterator() -> [(Key, Value)].Iterator {
        children.makeIterator()
    }
}

extension Node where Value == Bool {
    public var keys: [Key] {
        let allCasesButAll = Key.allCases.filter { $0.stringValue != "All" }

        var keys = children.contains(where: { $0.0.stringValue == "All" }) ? allCasesButAll : []

        for child in children where child.0.stringValue != "All" {
            if child.1 {
                keys.append(child.0)
            } else {
                keys.removeAll(where: { $0.stringValue == child.0.stringValue })
            }
        }

        return keys
    }
}
