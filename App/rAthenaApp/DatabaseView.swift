//
//  DatabaseView.swift
//  rAthenaApp
//
//  Created by Leon Li on 2023/6/28.
//

import SwiftUI
import rAthenaCommon

struct DatabaseView<Record>: View where Record: Any, Record: DatabaseRecord {
    let fetcher: () async throws -> [Record]

    private enum Status {
        case notYetLoaded
        case loading
        case loaded([Record])
        case failed(Error)
    }

    @State private var status: Status = .notYetLoaded
    @State private var searchText = ""
    @State private var filteredRecords: [Record] = []

    public var body: some View {
        ZStack {
            switch status {
            case .notYetLoaded:
                EmptyView()
            case .loading:
                ProgressView()
            case .loaded:
                List(filteredRecords, id: \.recordID) { record in
                    NavigationLink {
                        DatabaseRecordView(record: record)
                    } label: {
                        Text(record.recordTitle)
                    }
                }
                .listStyle(.plain)
                .searchable(text: $searchText)
                .onSubmit(of: .search) {
                    filterRecords()
                }
                .onChange(of: searchText) { _ in
                    filterRecords()
                }
            case .failed(let error):
                Text(error.localizedDescription)
            }
        }
        .task {
            await load()
        }
    }

    private func load() async {
        guard case .notYetLoaded = status else {
            return
        }

        status = .loading

        do {
            let records = try await fetcher()
            status = .loaded(records)
            filterRecords()
        } catch {
            status = .failed(error)
        }
    }

    private func filterRecords() {
        guard case .loaded(let records) = status else {
            return
        }

        if searchText.isEmpty {
            filteredRecords = records
        } else {
            filteredRecords = records.filter { record in
                record.recordTitle.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}
