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

    /// Client -> All Servers
    public enum CS {
    }

    /// All Servers -> Client
    public enum SC {
    }

    static var all: [any Packet.Type] {
        return [
            Packets.CA.Login.self,
            Packets.CA.ExeHashcheck.self,

            Packets.AC.AcceptLogin.self,
            Packets.AC.RefuseLogin.self,

            Packets.CH.Enter.self,
            Packets.CH.SelectChar.self,
            Packets.CH.MakeChar.self,
            Packets.CH.DeleteChar.self,
            Packets.CH.ExeHashcheck.self,

            Packets.HC.AcceptEnterNeoUnion.self,

            Packets.CZ.ExeHashcheck.self,

            Packets.SC.NotifyBan.self,
        ]
    }
}
