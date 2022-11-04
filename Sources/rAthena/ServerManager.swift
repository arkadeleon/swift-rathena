//
//  ServerManager.swift
//  rAthena
//
//  Created by Leon Li on 2021/7/17.
//

import Foundation
import rAthenaLogin
import rAthenaChar
import rAthenaMap
import rAthenaWeb

public enum ServerType {
    case login
    case char
    case map
    case web
}

public class ServerManager {
    public typealias OutputHandler = (Data) -> Void

    public static let shared = ServerManager()

    private var loginServer: LoginServer
    private var charServer: CharServer
    private var mapServer: MapServer
    private var webServer: WebServer

    public var loginServerOutputHandler: OutputHandler? {
        didSet {
            loginServer.outputHandler = loginServerOutputHandler;
        }
    }

    public var charServerOutputHandler: OutputHandler? {
        didSet {
            charServer.outputHandler = charServerOutputHandler
        }
    }

    public var mapServerOutputHandler: OutputHandler? {
        didSet {
            mapServer.outputHandler = mapServerOutputHandler
        }
    }

    public var webServerOutputHandler: OutputHandler? {
        didSet {
            webServer.outputHandler = webServerOutputHandler
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
            loginServer.dataReceiveHandler = { data in
                print(data, "Receive", "Login")
            }
            loginServer.dataSendHandler = { data in
                print(data, "Send", "Login")
            }
            charServer.dataReceiveHandler = { data in
                print(data, "Receive", "Char")
            }
            charServer.dataSendHandler = { data in
                print(data, "Send", "Char")
            }
            mapServer.dataReceiveHandler = { data in
                print(data, "Receive", "Map")
            }
            mapServer.dataSendHandler = { data in
                print(data, "Send", "Map")
            }
            webServer.dataReceiveHandler = { data in
                print(data, "Receive", "Web")
            }
            webServer.dataSendHandler = { data in
                print(data, "Send", "Web")
            }
        }
    }

    private init() {
        loginServer = LoginServer()
        charServer = CharServer()
        mapServer = MapServer()
        webServer = WebServer()
    }

    public func startServer(_ serverType: ServerType) {
        switch serverType {
        case .login:
            if !loginServer.isExecuting {
                loginServer.start()
            }
        case .char:
            if !charServer.isExecuting {
                charServer.start()
            }
        case .map:
            if !mapServer.isExecuting {
                mapServer.start()
            }
        case .web:
            if !webServer.isExecuting {
                webServer.start()
            }
        }
    }

    public func stopServer(_ serverType: ServerType) {
        switch serverType {
        case .login:
            if loginServer.isExecuting {
                loginServer.cancel()
                loginServer = LoginServer()
            }
        case .char:
            if charServer.isExecuting {
                charServer.cancel()
                charServer = CharServer()
            }
        case .map:
            if mapServer.isExecuting {
                mapServer.cancel()
                mapServer = MapServer()
            }
        case .web:
            if webServer.isExecuting {
                webServer.cancel()
                webServer = WebServer()
            }
        }
    }
}
