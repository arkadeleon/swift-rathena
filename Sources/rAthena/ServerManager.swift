//
//  ServerManager.swift
//  rAthena
//
//  Created by Leon Li on 2021/7/17.
//

import Foundation
import rAthenaChar
import rAthenaLogin
import rAthenaMap

public class ServerManager {

    public typealias OutputHandler = (Data) -> Void

    public static let shared = ServerManager()

    public let charServer: CharServer
    public let loginServer: LoginServer
    public let mapServer: MapServer

    public var charServerOutputHandler: OutputHandler? {
        didSet {
            charServer.outputHandler = charServerOutputHandler
        }
    }

    public var loginServerOutputHandler: OutputHandler? {
        didSet {
            loginServer.outputHandler = loginServerOutputHandler;
        }
    }

    public var mapServerOutputHandler: OutputHandler? {
        didSet {
            mapServer.outputHandler = mapServerOutputHandler
        }
    }

    public var sessionsOutputHandler: OutputHandler? {
        didSet {
            let handler = sessionsOutputHandler
            let print: (Data, String, String) -> Void = { (data, flow, server) in
                let data = data.map({ String(format: "%02X", $0) }).joined()
                let message = "[\(server)|\(flow)]: 0x\(data)\n"
                handler?(message.data(using: .isoLatin1) ?? Data())
            }
            charServer.dataReceiveHandler = { data in
                print(data, "Receive", "Char")
            }
            charServer.dataSendHandler = { data in
                print(data, "Send", "Char")
            }
            loginServer.dataReceiveHandler = { data in
                print(data, "Receive", "Login")
            }
            loginServer.dataSendHandler = { data in
                print(data, "Send", "Login")
            }
            mapServer.dataReceiveHandler = { data in
                print(data, "Receive", "Map")
            }
            mapServer.dataSendHandler = { data in
                print(data, "Send", "Map")
            }
        }
    }

    private init() {
        charServer = CharServer()
        loginServer = LoginServer()
        mapServer = MapServer()
    }
}
