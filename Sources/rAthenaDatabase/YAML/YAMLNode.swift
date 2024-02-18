//
//  YAMLNode.swift
//  rAthena
//
//  Created by Leon Li on 2024/2/18.
//

import ryml

enum YAMLNode {
    case value(String?)
    case map(Map)
    case sequence(Sequence)

    init(from node: c4.yml.NodeRef) {
        if node.is_map() {
            self = .map(Map(from: node))
        } else if node.is_seq() {
            self = .sequence(Sequence(from: node))
        } else {
            self = .value(node.val_is_null() ? nil : node.val().string)
        }
    }

    func value() -> String? {
        switch self {
        case .value(let string): string
        case .map(let map): nil
        case .sequence(let sequence): nil
        }
    }
}

extension YAMLNode {
    struct Map {
        let nodes: [String : YAMLNode]

        init(from node: c4.yml.NodeRef) {
            var nodes: [String : YAMLNode] = [:]
            for pos in 0..<node.num_children() {
                let child = node.child(pos)
                nodes[child.key().string] = YAMLNode(from: child)
            }
            self.nodes = nodes
        }
    }
}

extension YAMLNode {
    struct Sequence {
        let nodes: [YAMLNode]

        init(from node: c4.yml.NodeRef) {
            nodes = (0..<node.num_children()).map({ YAMLNode(from: node[$0]) })
        }
    }
}
