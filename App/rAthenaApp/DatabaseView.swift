//
//  DatabaseView.swift
//  rAthenaApp
//
//  Created by Leon Li on 2023/6/28.
//

import SwiftUI
import rAthenaCommon

struct DatabaseView<Record>: View where Record: AnyObject, Record: DatabaseRecord {
    let database: RADatabase<Record>

    @State private var searchText = ""
    @State private var allRecords = [Record]()
    @State private var filteredRecords = [Record]()

    public var body: some View {
        List(filteredRecords, id: \.recordID) { record in
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

    public init(database: RADatabase<Record>) {
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
