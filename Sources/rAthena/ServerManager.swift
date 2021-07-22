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
    }
}
