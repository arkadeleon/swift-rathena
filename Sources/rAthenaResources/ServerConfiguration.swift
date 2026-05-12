//
//  ServerConfiguration.swift
//  rAthena
//
//  Created by Leon Li on 2026/5/12.
//

import Foundation

public struct ServerConfiguration: Sendable {
    public static let `default` = ServerConfiguration()

    public var atcommands: String?
    public var battle_conf: String?
    public var char_conf: String?
    public var groups: String?
    public var inter_conf: String?
    public var inter_server: String?
    public var log_conf: String?
    public var login_conf: String?
    public var map_conf: String?
    public var packet_conf: String?
    public var script_conf: String?
    public var web_conf: String?

    public init(
        atcommands: String? = nil,
        battle_conf: String? = nil,
        char_conf: String? = nil,
        groups: String? = nil,
        inter_conf: String? = nil,
        inter_server: String? = nil,
        log_conf: String? = nil,
        login_conf: String? = nil,
        map_conf: String? = nil,
        packet_conf: String? = nil,
        script_conf: String? = nil,
        web_conf: String? = nil
    ) {
        self.atcommands = atcommands
        self.battle_conf = battle_conf
        self.char_conf = char_conf
        self.groups = groups
        self.inter_conf = inter_conf
        self.inter_server = inter_server
        self.log_conf = log_conf
        self.login_conf = login_conf
        self.map_conf = map_conf
        self.packet_conf = packet_conf
        self.script_conf = script_conf
        self.web_conf = web_conf
    }

    func write(to url: URL) throws {
        let confFiles: [(String, String?)] = [
            ("atcommands.yml", atcommands),
            ("battle_conf.txt", battle_conf),
            ("char_conf.txt", char_conf),
            ("groups.yml", groups),
            ("inter_conf.txt", inter_conf),
            ("inter_server.yml", inter_server),
            ("log_conf.txt", log_conf),
            ("login_conf.txt", login_conf),
            ("map_conf.txt", map_conf),
            ("packet_conf.txt", packet_conf),
            ("script_conf.txt", script_conf),
            ("web_conf.txt", web_conf),
        ]
        for (filename, content) in confFiles {
            if let content {
                let fileURL = url.appendingPathComponent(filename)
                try content.write(to: fileURL, atomically: true, encoding: .utf8)
            }
        }
    }
}
