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

    public static let shared = ServerManager()

    public let charServer: Thread
    public let loginServer: Thread
    public let mapServer: Thread

    public var charServerOutputHandler: ((Data) -> Void)? {
        didSet {
            if let handler = charServerOutputHandler {
                CharServerSetOutputHandler(handler)
            }
        }
    }

    public var loginServerOutputHandler: ((Data) -> Void)? {
        didSet {
            if let handler = loginServerOutputHandler {
                LoginServerSetOutputHandler(handler)
            }
        }
    }

    public var mapServerOutputHandler: ((Data) -> Void)? {
        didSet {
            if let handler = mapServerOutputHandler {
                MapServerSetOutputHandler(handler)
            }
        }
    }

    public var sessionsOutputHandler: ((Data) -> Void)? {
        didSet {
            if let handler = sessionsOutputHandler {
                let print: (Data, String, String) -> Void = { (data, flow, server) in
                    let data = data.map({ String(format: "%02X", $0) }).joined()
                    let message = "[\(server)|\(flow)]: 0x\(data)\n"
                    handler(message.data(using: .isoLatin1) ?? Data())
                }
                CharServerSetDataReceiveHandler { data in
                    print(data, "Receive", "Char")
                }
                CharServerSetDataSendHandler { data in
                    print(data, "Send", "Char")
                }
                LoginServerSetDataReceiveHandler { data in
                    print(data, "Receive", "Login")
                }
                LoginServerSetDataSendHandler { data in
                    print(data, "Send", "Login")
                }
                MapServerSetDataReceiveHandler { data in
                    print(data, "Receive", "Map")
                }
                MapServerSetDataSendHandler { data in
                    print(data, "Send", "Map")
                }
            }
        }
    }

    private init() {
        charServer = Thread {
            CharServerMain()
        }
        charServer.name = CharServerGetName()

        loginServer = Thread {
            LoginServerMain()
        }
        loginServer.name = LoginServerGetName()

        mapServer = Thread {
            MapServerMain()
        }
        mapServer.name = MapServerGetName()
    }
}
