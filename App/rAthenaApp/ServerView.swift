//
//  ServerView.swift
//  rAthenaApp
//
//  Created by Leon Li on 2022/11/2.
//

import SwiftUI

struct ServerView: View {
    public let serverType: ServerType

    private let serverManager = ServerManager.shared

    private let terminalView = TerminalView()

    @State private var isServerRunning = false

    var body: some View {
        HStack(spacing: 0) {
            VStack {
                HStack(spacing: 8) {
                    Text(serverManager.serverName(serverType).uppercased())
                        .font(.subheadline)

                    Spacer()

                    if !isServerRunning {
                        Button {
                            serverManager.startServer(serverType)
                        } label: {
                            Image(systemName: "play")
                        }
                        .frame(width: 32, height: 32)
                    } else {
                        Button {
                            serverManager.stopServer(serverType)
                        } label: {
                            Image(systemName: "stop")
                        }
                        .frame(width: 32, height: 32)
                    }

                    Button {
                        terminalView.clear()
                    } label: {
                        Image(systemName: "trash")
                    }
                    .frame(width: 32, height: 32)
                }
                .frame(height: 32)
                .padding(.horizontal, 8)
                .background(Color(uiColor: .secondarySystemBackground))

                terminalView
            }
        }
        .cornerRadius(16)
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(uiColor: .secondarySystemBackground), lineWidth: 1)
        }
        .task {
            serverManager.setOutputHandler({ data in
                if let data = String(data: data, encoding: .isoLatin1)?
                    .replacingOccurrences(of: "\n", with: "\r\n")
                    .data(using: .isoLatin1) {
                    terminalView.appendBuffer(data)
                }
            }, for: serverType)
        }
        .onReceive(serverManager.isServerRunning(serverType)) { isRunning in
            isServerRunning = isRunning
        }
    }
}

struct ServerView_Previews: PreviewProvider {
    static var previews: some View {
        ServerView(serverType: .login)
    }
}
