//
//  ServerView.swift
//  ROServer
//
//  Created by Leon Li on 2022/11/2.
//

import rAthena
import SwiftUI

struct ServerView: View {
    private let title: String
    private let startAction: () -> Void
    @Binding private var pendingLog: Data
    @Binding private var pendingSession: Data

    @State private var clearLogs = false
    @State private var clearSessions = false
    @State private var showsSessions = true

    var body: some View {
        HStack(spacing: 0) {
            VStack {
                HStack(spacing: 8) {
                    Text(title.uppercased())
                        .font(.subheadline)

                    Spacer()

                    Button(action: startAction) {
                        Image(systemName: "play")
                    }
                    .frame(width: 32, height: 32)

                    Button {
                        clearLogs.toggle()
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

                TerminalView(clear: $clearLogs, pendingData: $pendingLog)
            }

            Color(uiColor: .secondarySystemBackground)
                .frame(width: showsSessions ? 1 : 0)

            VStack {
                if showsSessions {
                    HStack(spacing: 8) {
                        Spacer()

                        Button {
                            clearSessions.toggle()
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

                TerminalView(clear: $clearSessions, pendingData: $pendingSession)
            }
            .frame(width: showsSessions ? 320 : 0)
        }
        .cornerRadius(16)
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(uiColor: .secondarySystemBackground), lineWidth: 1)
        }
        .animation(.easeInOut, value: showsSessions)
    }

    init(_ title: String, startAction: @escaping () -> Void, pendingLog: Binding<Data>, pendingSession: Binding<Data>) {
        self.title = title
        self.startAction = startAction
        _pendingLog = pendingLog
        _pendingSession = pendingSession
    }
}

struct ServerView_Previews: PreviewProvider {
    static var previews: some View {
        ServerView("Login Server", startAction: ServerManager.shared.loginServer.start, pendingLog: .constant(Data()), pendingSession: .constant(Data()))
    }
}
