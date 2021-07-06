//
//  Packets.swift
//  rAthena
//
//  Created by Leon Li on 2021/7/6.
//

public enum Packets {

    static var all: [UInt16: Packet.Type] {
        return [
            0x0064: Packet0064.self,
            0x0065: Packet0065.self,
            0x0066: Packet0066.self
        ]
    }
}
