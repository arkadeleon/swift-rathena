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
            0x0066: Packet0066.self,
            0x0067: Packet0067.self,
            0x0068: Packet0068.self,
            0x0069: Packet0069.self,
        ]
    }
}
