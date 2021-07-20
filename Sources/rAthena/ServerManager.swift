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

public enum Server {

    case char
    case login
    case map
}

public class ServerManager {

    public static let shared = ServerManager()

    private let charServer = Thread {
        CharServerMain()
    }

    private let loginServer = Thread {
        LoginServerMain()
    }

    private let mapServer = Thread {
        MapServerMain()
    }

    private let charTerminalView = TerminalView()
    private let loginTerminalView = TerminalView()
    private let mapTerminalView = TerminalView()

    private init() {
        CharServerSetOutput(charTerminalView.terminal.output)
        LoginServerSetOutput(loginTerminalView.terminal.output)
        MapServerSetOutput(mapTerminalView.terminal.output)
    }

    public func name(for server: Server) -> String {
        switch server {
        case .char:
            return CharServerGetName()
        case .login:
            return LoginServerGetName()
        case .map:
            return MapServerGetName()
        }
    }

    public func terminalView(for server: Server) -> UIView {
        switch server {
        case .char:
            return charTerminalView
        case .login:
            return loginTerminalView
        case .map:
            return mapTerminalView
        }
    }

    public func start(_ server: Server) {
        switch server {
        case .char:
            if !charServer.isExecuting {
                charServer.start()
            }
        case .login:
            if !loginServer.isExecuting {
                loginServer.start()
            }
        case .map:
            if !mapServer.isExecuting {
                mapServer.start()
            }
        }
    }

    public func clearTerminal(for server: Server) {
        switch server {
        case .char:
            charTerminalView.terminal.clear()
        case .login:
            loginTerminalView.terminal.clear()
        case .map:
            mapTerminalView.terminal.clear()
        }
    }
}
