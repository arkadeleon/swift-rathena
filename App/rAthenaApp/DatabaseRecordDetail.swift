//
//  DatabaseRecordDetail.swift
//  rAthenaApp
//
//  Created by Leon Li on 2023/6/29.
//

import SwiftUI
import rAthenaDatabase

struct DatabaseRecordDetail: View {
    let database: Database
    let record: DatabaseRecord

    private enum Status {
        case notYetLoaded
        case loading
        case loaded(DatabaseRecordFields)
        case failed(Error)
    }

    @State private var status: Status = .notYetLoaded

    public var body: some View {
        ZStack {
            switch status {
            case .notYetLoaded:
                EmptyView()
            case .loading:
                ProgressView()
            case .loaded(let recordFields):
                List(recordFields.fields) { field in
                    switch field {
                    case .string(let name, let value):
                        LabeledContent(name, value: value)
                    case .reference(let name, let reference):
                        NavigationLink {
                            DatabaseRecordDetail(database: database, record: reference)
                        } label: {
                            Text(name)
                        }
                    case .array:
                        OutlineGroup(field, children: \.array) { field in
                            switch field {
                            case .string(let name, let value):
                                LabeledContent(name, value: value)
                            case .reference(let name, let reference):
                                NavigationLink {
                                    DatabaseRecordDetail(database: database, record: reference)
                                } label: {
                                    Text(name)
                                }
                            case .array(let name, _):
                                Text(name)
                            }
                        }
                    }
                }
                .listStyle(.plain)
            case .failed(let error):
                Text(error.localizedDescription)
            }
        }
        .navigationTitle(record.recordTitle)
        .navigationBarTitleDisplayMode(.inline)
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
            let recordFields = try await record.recordFields(with: database)
            status = .loaded(recordFields)
        } catch {
            status = .failed(error)
        }
    }
}
