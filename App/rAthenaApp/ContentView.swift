//
//  ContentView.swift
//  rAthenaApp
//
//  Created by Leon Li on 2022/11/2.
//

import SwiftUI
import rAthenaDatabase
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
                        DatabaseView {
                            try await Database.renewal.fetchItems()
                        }
                        .navigationTitle("Items")
                        .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        Label("Items", systemImage: "list.bullet.rectangle")
                    }

                    NavigationLink {
                        DatabaseView {
                            try await Database.renewal.fetchMonsters()
                        }
                        .navigationTitle("Monsters")
                        .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        Label("Monsters", systemImage: "list.bullet.rectangle")
                    }

                    NavigationLink {
                        DatabaseView {
                            try await Database.renewal.fetchJobs()
                        }
                        .navigationTitle("Jobs")
                        .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        Label("Jobs", systemImage: "list.bullet.rectangle")
                    }

                    NavigationLink {
                        DatabaseView {
                            try await Database.renewal.fetchSkills()
                        }
                        .navigationTitle("Skills")
                        .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        Label("Skills", systemImage: "list.bullet.rectangle")
                    }

                    NavigationLink {
                        DatabaseView {
                            RASkillTreeDatabase.shared.allRecords()
                        }
                        .navigationTitle(RASkillTreeDatabase.shared.name)
                        .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        Label(RASkillTreeDatabase.shared.name, systemImage: "list.bullet.rectangle")
                    }
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("rAthena")

            ServerView(server: RALoginServer.shared)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
