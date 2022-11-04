//
//  WebServerView.swift
//  ROServer
//
//  Created by Leon Li on 2022/11/2.
//

import rAthena
import SwiftUI

struct WebServerView: View {
    @State private var pendingLog = Data()
    @State private var pendingSession = Data()

    var body: some View {
        ServerView("Web Server", startAction: startServer, pendingLog: $pendingLog, pendingSession: $pendingSession)
        .task {
            ServerManager.shared.webServerOutputHandler = { data in
                if let data = String(data: data, encoding: .isoLatin1)?
                    .replacingOccurrences(of: "\n", with: "\r\n")
                    .data(using: .isoLatin1) {
                    pendingLog = data
                }
            }
        }
    }

    private func startServer() {
        ServerManager.shared.startServer(.web)
    }
}

struct WebServerView_Previews: PreviewProvider {
    static var previews: some View {
        WebServerView()
    }
}
