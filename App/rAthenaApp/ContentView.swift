//
//  ContentView.swift
//  rAthenaApp
//
//  Created by Leon Li on 2022/11/2.
//

import SwiftUI
import rAthenaLogin
import rAthenaChar
import rAthenaMap
import rAthenaWeb

struct ContentView: View {
    private let servers: [RAServer] = [
        RALoginServer.shared,
        RACharServer.shared,
        RAMapServer.shared,
        RAWebServer.shared,
    ]

    var body: some View {
        NavigationView {
            List {
                Section("Servers") {
                    ForEach(servers, id: \.name) { server in
                        NavigationLink {
                            ServerView(server: server)
                        } label: {
                            Label(server.name, systemImage: "macpro.gen3.server")
                        }
                    }
                }

                Section("Databases") {
                    NavigationLink {
                        DatabaseView(database: RAItemDatabase.shared)
                    } label: {
                        Label(RAItemDatabase.shared.name, systemImage: "list.bullet.rectangle")
                    }

                    NavigationLink {
                        DatabaseView(database: RAMonsterDatabase.shared)
                    } label: {
                        Label(RAMonsterDatabase.shared.name, systemImage: "list.bullet.rectangle")
                    }

                    NavigationLink {
                        DatabaseView(database: RAJobDatabase.shared)
                    } label: {
                        Label(RAJobDatabase.shared.name, systemImage: "list.bullet.rectangle")
                    }

                    NavigationLink {
                        DatabaseView(database: RASkillDatabase.shared)
                    } label: {
                        Label(RASkillDatabase.shared.name, systemImage: "list.bullet.rectangle")
                    }

                    NavigationLink {
                        DatabaseView(database: RASkillTreeDatabase.shared)
                    } label: {
                        Label(RASkillTreeDatabase.shared.name, systemImage: "list.bullet.rectangle")
                    }
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("rAthena")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
