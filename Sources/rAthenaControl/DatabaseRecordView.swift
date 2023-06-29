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

    public var body: some View {
        List(record.recordFields, id: \.name) { field in
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
            @unknown default:
                EmptyView()
            }
        }
        .navigationTitle(record.recordTitle)
        .navigationBarTitleDisplayMode(.inline)
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
