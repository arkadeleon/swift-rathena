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

    static var all: [UInt16: Packet.Type] {
        return [
            0x0064: Packets.CA.Login.self,
            0x0065: Packets.CH.Enter.self,
            0x0066: Packets.CH.SelectChar.self,
            0x0067: Packets.CH.MakeChar.self,
            0x0068: Packets.CH.DeleteChar.self,
            0x0069: Packets.AC.AcceptLogin.self,
            0x006A: Packets.AC.RefuseLogin.self,
            0x006B: Packets.HC.AcceptEnterNeoUnion.self,
        ]
    }
}
