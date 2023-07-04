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
    let recordFields: [RADatabaseRecordField]

    public var body: some View {
        List(recordFields, id: \.name) { field in
            switch field.value.type {
            case .string:
                HStack {
                    Text(field.name)
                    Spacer()
                    Text(field.value.string!)
                }
            case .stringArray:
                HStack {
                    Text(field.name)
                    Spacer()
                    Text(field.value.stringArray!.joined(separator: " / "))
                }
            case .referenceArray:
                Section(field.name) {
                    ForEach(field.value.referenceArray!, id: \.recordID) { reference in
                        NavigationLink {
                            DatabaseRecordView(record: reference)
                        } label: {
                            Text(reference.recordTitle)
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
    }

    public init(record: RADatabaseRecord) {
        self.record = record

        let builder = RADatabaseRecordFieldsBuilder()
        record.buildFields(with: builder)
        self.recordFields = builder.build()
    }
}

struct DatabaseRecordView_Previews: PreviewProvider {
    static var previews: some View {
        DatabaseRecordView(record: RADatabaseRecord())
    }
}
