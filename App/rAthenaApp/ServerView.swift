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

    private let logView = TerminalView()
    private let sessionView = TerminalView()

    @State private var isServerRunning = false

    @State private var showsSessions = true

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
                        logView.clear()
                    } label: {
                        Image(systemName: "trash")
                    }
                    .frame(width: 32, height: 32)

                    if !showsSessions {
                        Button {
                            showsSessions.toggle()
                        } label: {
                            Image(systemName: "rectangle.rightthird.inset.filled")
                        }
                        .frame(width: 32, height: 32)
                    }
                }
                .frame(height: 32)
                .padding(.horizontal, 8)
                .background(Color(uiColor: .secondarySystemBackground))

                logView
            }

            Color(uiColor: .secondarySystemBackground)
                .frame(width: showsSessions ? 1 : 0)

            VStack {
                if showsSessions {
                    HStack(spacing: 8) {
                        Spacer()

                        Button {
                            sessionView.clear()
                        } label: {
                            Image(systemName: "trash")
                        }
                        .frame(width: 32, height: 32)

                        Button {
                            showsSessions.toggle()
                        } label: {
                            Image(systemName: "rectangle.rightthird.inset.filled")
                        }
                        .frame(width: 32, height: 32)
                    }
                    .frame(height: 32)
                    .padding(.horizontal, 8)
                    .background(Color(uiColor: .secondarySystemBackground))
                }

                sessionView
            }
            .frame(width: showsSessions ? 320 : 0)
        }
        .cornerRadius(16)
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(uiColor: .secondarySystemBackground), lineWidth: 1)
        }
        .animation(.easeInOut, value: showsSessions)
        .task {
            serverManager.setOutputHandler({ data in
                if let data = String(data: data, encoding: .isoLatin1)?
                    .replacingOccurrences(of: "\n", with: "\r\n")
                    .data(using: .isoLatin1) {
                    logView.appendBuffer(data)
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
