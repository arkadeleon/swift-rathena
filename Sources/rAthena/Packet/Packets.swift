//
//  Packets.swift
//  rAthena
//
//  Created by Leon Li on 2021/7/6.
//

public enum Packets {

    static var all: [UInt16: Packet.Type] {
        return [
            0x0064: Packet0064.self
        ]
    }
}
