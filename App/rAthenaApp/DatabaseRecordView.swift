//
//  DatabaseRecordView.swift
//  rAthenaApp
//
//  Created by Leon Li on 2023/6/29.
//

import SwiftUI
import rAthenaCommon

struct DatabaseRecordView: View {
    let record: DatabaseRecord

    @State private var recordFields = [DatabaseRecordField]()

    public var body: some View {
        List(recordFields) { field in
            switch field {
            case .string(let name, let value):
                HStack {
                    Text(name)
                    Spacer()
                    Text(value)
                        .foregroundColor(.secondary)
                }
            case .reference(let name, let reference):
                NavigationLink {
                    DatabaseRecordView(record: reference)
                } label: {
                    Text(name)
                }
            case .array:
                OutlineGroup(field, children: \.array) { field in
                    switch field {
                    case .string(let name, let value):
                        HStack {
                            Text(name)
                            Spacer()
                            Text(value)
                                .foregroundColor(.secondary)
                        }
                    case .reference(let name, let reference):
                        NavigationLink {
                            DatabaseRecordView(record: reference)
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
        .navigationTitle(record.recordTitle)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            Task {
                recordFields = record.recordFields
            }
        }
    }
}
