//
//  DatabaseRecordView.swift
//  rAthena
//
//  Created by Leon Li on 2023/6/29.
//

import SwiftUI
import rAthenaCommon

public struct DatabaseRecordView: View {
    let record: RADatabaseRecord

    @State private var recordFields = [RADatabaseRecordField]()

    public var body: some View {
        List(recordFields, id: \.name) { field in
            switch field.value.type {
            case .string:
                HStack {
                    Text(field.name)
                    Spacer()
                    Text(field.value.string!)
                        .foregroundColor(.secondary)
                }
            case .number:
                HStack {
                    Text(field.name)
                    Spacer()
                    Text(field.value.number!.stringValue)
                        .foregroundColor(.secondary)
                }
            case .reference:
                NavigationLink {
                    DatabaseRecordView(record: field.value.reference!)
                } label: {
                    Text(field.name)
                }
            case .stringArray:
                HStack {
                    Text(field.name)
                    Spacer()
                    Text(field.value.stringArray!.joined(separator: " / "))
                        .foregroundColor(.secondary)
                }
            case .referenceArray:
                Section(field.name) {
                    ForEach(field.value.referenceArray!, id: \.recordID) { reference in
                        NavigationLink {
                            DatabaseRecordView(record: reference)
                        } label: {
                            HStack {
                                Text(reference.recordTitle)
                                Text(reference.recordSubtitle)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            case .fieldArray:
                OutlineGroup(field, id: \.name, children: \.value.fieldArray) { field in
                    switch field.value.type {
                    case .string:
                        HStack {
                            Text(field.name)
                            Spacer()
                            Text(field.value.string!)
                                .foregroundColor(.secondary)
                        }
                    case .number:
                        HStack {
                            Text(field.name)
                            Spacer()
                            Text(field.value.number!.stringValue)
                                .foregroundColor(.secondary)
                        }
                    default:
                        Text(field.name)
                    }
                }
            @unknown default:
                EmptyView()
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

    public init(record: RADatabaseRecord) {
        self.record = record
    }
}

struct DatabaseRecordView_Previews: PreviewProvider {
    static var previews: some View {
        DatabaseRecordView(record: RADatabaseRecord())
    }
}
