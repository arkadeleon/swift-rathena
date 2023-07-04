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
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(field.value.string!)
                }
            case .number:
                HStack {
                    Text(field.name)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(field.value.number!.stringValue)
                }
            case .stringArray:
                HStack {
                    Text(field.name)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(field.value.stringArray!.joined(separator: " / "))
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
            @unknown default:
                EmptyView()
            }
        }
        .listStyle(.plain)
        .navigationTitle(record.recordTitle)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            Task {
                let builder = RADatabaseRecordFieldsBuilder()
                record.buildFields(with: builder)
                recordFields = builder.build()
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
