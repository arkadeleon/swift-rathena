//
//  PacketManager.swift
//  rAthena
//
//  Created by Leon Li on 2024/4/8.
//

public class PacketManager {
    public static let shared = PacketManager()

    public let allPackets: [any PacketProtocol.Type] = [
        PACKET.CA.LOGIN.self,
        PACKET.CA.EXE_HASHCHECK.self,

        PACKET.AC.ACCEPT_LOGIN.self,
        PACKET.AC.REFUSE_LOGIN.self,

        PACKET.CH.ENTER.self,
        PACKET.CH.SELECT_CHAR.self,
        PACKET.CH.MAKE_CHAR.self,
        PACKET.CH.DELETE_CHAR.self,
        PACKET.CH.EXE_HASHCHECK.self,

        PACKET.HC.ACCEPT_ENTER_NEO_UNION.self,

        PACKET.CZ.EXE_HASHCHECK.self,

        PACKET.SC.NOTIFY_BAN.self,
    ]
}
