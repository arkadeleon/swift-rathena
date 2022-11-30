//
//  ServerManager.swift
//  ROServer
//
//  Created by Leon Li on 2021/7/17.
//

import Combine
import Foundation
import rAthenaLogin
import rAthenaChar
import rAthenaMap
import rAthenaWeb
import rAthenaResource

public enum ServerType {
    case login
    case char
    case map
    case web
}

public class ServerManager {
    public typealias OutputHandler = (Data) -> Void

    public static let shared = ServerManager()

    private var loginServer = LoginServer()
    private var charServer = CharServer()
    private var mapServer = MapServer()
    private var webServer = WebServer()

    private init() {
        let resourceManager = ResourceManager()
        try? resourceManager.copyBundleResourceFiles()
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

    public func serverName(_ type: ServerType) -> String {
        let server = server(for: type)
        return server.name!
    }

    public func startServer(_ type: ServerType) {
        let server = server(for: type)

        if !server.isExecuting {
            server.start()
        }
    }

    public func stopServer(_ type: ServerType) {
        let server = server(for: type)

        if server.isExecuting {
            server.cancel()
            resetServer(for: type)
        }
    }

    public func isServerRunning(_ type: ServerType) -> AnyPublisher<Bool, Never> {
        return Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
            .map { [unowned self] _ in
                let server = self.server(for: type)
                return server.isExecuting
            }
            .replaceError(with: false)
            .eraseToAnyPublisher()
    }

    public func setOutputHandler(_ outputHandler: OutputHandler?, for type: ServerType) {
        switch type {
        case .login:
            loginServer.outputHandler = outputHandler
        case .char:
            charServer.outputHandler = outputHandler
        case .map:
            mapServer.outputHandler = outputHandler
        case .web:
            webServer.outputHandler = outputHandler
        }
    }

    private func server(for type: ServerType) -> Thread {
        switch type {
        case .login:
            return loginServer
        case .char:
            return charServer
        case .map:
            return mapServer
        case .web:
            return webServer
        }
    }

    private func resetServer(for type: ServerType) {
        switch type {
        case .login:
            let outputHandler = loginServer.outputHandler
            loginServer.outputHandler = nil
            loginServer = LoginServer()
            loginServer.outputHandler = outputHandler
        case .char:
            let outputHandler = charServer.outputHandler
            charServer.outputHandler = nil
            charServer = CharServer()
            charServer.outputHandler = outputHandler
        case .map:
            let outputHandler = mapServer.outputHandler
            mapServer.outputHandler = nil
            mapServer = MapServer()
            mapServer.outputHandler = outputHandler
        case .web:
            let outputHandler = webServer.outputHandler
            webServer.outputHandler = nil
            webServer = WebServer()
            webServer.outputHandler = outputHandler
        }
    }
}
