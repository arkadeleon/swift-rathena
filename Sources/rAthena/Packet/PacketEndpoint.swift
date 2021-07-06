//
//  PacketEndpoint.swift
//  rAthena
//
//  Created by Leon Li on 2021/7/5.
//

public enum PacketEndpoint {

    /// A = Account (Login)
    case loginServer

    /// C = Client
    case client

    /// H = Character
    case charServer

    /// I = Inter
    case inter

    /// S = Server (any type of server)
    case server

    /// Z = Zone (Map)
    case mapServer
}
