//
//  DatabaseView.swift
//  rAthenaApp
//
//  Created by Leon Li on 2023/6/28.
//

import SwiftUI
import rAthenaCommon

public struct DatabaseView: View {
    let database: RADatabase

    @State private var searchText = ""
    @State private var allRecords = [RADatabaseRecord]()
    @State private var filteredRecords = [RADatabaseRecord]()

    public var body: some View {
        List(filteredRecords) { record in
            NavigationLink {
                DatabaseRecordView(record: record)
            } label: {
                Text(record.recordTitle)
            }
        }
        .listStyle(.plain)
        .searchable(text: $searchText)
        .navigationTitle(database.name)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            Task {
                allRecords = database.allRecords()
                filterRecords()
            }
        }
        .onSubmit(of: .search) {
            filterRecords()
        }
        .onChange(of: searchText) { _ in
            filterRecords()
        }
    }

    public init(database: RADatabase) {
        self.database = database
    }

    private func filterRecords() {
        if searchText.isEmpty {
            filteredRecords = allRecords
        } else {
            filteredRecords = allRecords.filter { record in
                record.recordTitle.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}

struct DatabaseView_Previews: PreviewProvider {
    static var previews: some View {
        DatabaseView(database: RADatabase())
    }
}
