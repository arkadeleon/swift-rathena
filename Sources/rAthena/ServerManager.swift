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

    public let charTerminalView = TerminalView()
    public let loginTerminalView = TerminalView()
    public let mapTerminalView = TerminalView()
    public let sessionsTerminalView = TerminalView()

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

        CharServerSetOutput(charTerminalView.terminal.output)
        LoginServerSetOutput(loginTerminalView.terminal.output)
        MapServerSetOutput(mapTerminalView.terminal.output)

        CharServerSetDataReceiveHandler { data in
            self.print(data: data, flow: "Receive", fromServer: "Char")
        }
        CharServerSetDataSendHandler { data in
            self.print(data: data, flow: "Send", fromServer: "Char")
        }
        LoginServerSetDataReceiveHandler { data in
            self.print(data: data, flow: "Receive", fromServer: "Login")
        }
        LoginServerSetDataSendHandler { data in
            self.print(data: data, flow: "Send", fromServer: "Login")
        }
        MapServerSetDataReceiveHandler { data in
            self.print(data: data, flow: "Receive", fromServer: "Map")
        }
        MapServerSetDataSendHandler { data in
            self.print(data: data, flow: "Send", fromServer: "Map")
        }
    }

    private func print(data: Data, flow: String, fromServer server: String) {
        let data = data.map({ String(format: "%02X", $0) }).joined()
        let text = "[\(server)|\(flow)]: 0x\(data)\n"
        sessionsTerminalView.terminal.write(text, length: text.count)
    }
}
