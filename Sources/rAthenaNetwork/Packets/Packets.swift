//
//  Packets.swift
//  rAthena
//
//  Created by Leon Li on 2021/7/6.
//

public enum Packets {

    /// Client -> Login Server
    public enum CA {
    }

    /// Login Server -> Client
    public enum AC {
    }

    /// Client -> Char Server
    public enum CH {
    }

    /// Char Server -> Client
    public enum HC {
    }

    /// Client -> Map Server
    public enum CZ {
    }

    /// Map Server -> Client
    public enum ZC {
    }

    static func all(for packetVersion: Int) -> [UInt16 : Packet.Type] {
        var packets: [UInt16 : Packet.Type] = [:]

        // MARK: - Common

        packets[0x64] = Packets.CA.Login.self

        if packetVersion >= 20170315 {
            packets[0xac4] = Packets.AC.AcceptLogin.self
        } else {
            packets[0x69] = Packets.AC.AcceptLogin.self
        }

        if packetVersion >= 20120000 {
            packets[0x83e] = Packets.AC.RefuseLogin.self
        } else {
            packets[0x6a] = Packets.AC.RefuseLogin.self
        }

        // TODO: PACKET_SC_NOTIFY_BAN

        // TODO: PACKET_CA_REQ_HASH

        // TODO: PACKET_AC_ACK_HASH

        // TODO: PACKET_CA_LOGIN2

        // TODO: PACKET_CA_LOGIN3

        // TODO: PACKET_CA_CONNECT_INFO_CHANGED

        packets[0x204] = Packets.CA.ExeHashcheck.self

        // TODO: PACKET_CA_LOGIN_PCBANG

        // TODO: PACKET_CA_LOGIN4

        // TODO: PACKET_CA_LOGIN_CHANNEL

        // TODO: PACKET_CA_SSO_LOGIN_REQ

        // TODO: PACKET_CT_AUTH

        // TODO: PACKET_TC_RESULT

        // MARK: - Char

        packets[0x65] = Packets.CH.Enter.self

        packets[0x66] = Packets.CH.SelectChar.self

        if packetVersion >= 20151001 {
            packets[0xa39] = Packets.CH.MakeChar.self
        } else if packetVersion >= 20120307 {
            packets[0x970] = Packets.CH.MakeChar.self
        } else {
            packets[0x67] = Packets.CH.MakeChar.self
        }

        packets[0x68] = Packets.CH.DeleteChar.self

        packets[0x6b] = Packets.HC.AcceptEnterNeoUnion.self

        packets[0x20b] = Packets.CH.ExeHashcheck.self

        // MARK: - Map

        packets[0x20c] = Packets.CZ.ExeHashcheck.self

        return packets
    }
}
