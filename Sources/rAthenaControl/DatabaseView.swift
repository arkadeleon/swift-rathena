//
//  DatabaseView.swift
//  rAthena
//
//  Created by Leon Li on 2023/6/28.
//

import SwiftUI
import rAthenaCommon

public struct DatabaseView: View {
    let database: RADatabase

    @State private var records = [RADatabaseRecord]()

    public var body: some View {
        List(records, id: \.recordID) { record in
            NavigationLink {
                DatabaseRecordView(record: record)
            } label: {
                HStack {
                    Text(record.recordTitle)
                    Text(record.recordSubtitle)
                        .foregroundColor(.secondary)
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle(database.name)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            Task {
                records = database.allRecords()
            }
        }
    }

    public init(database: RADatabase) {
        self.database = database
    }
}

struct DatabaseView_Previews: PreviewProvider {
    static var previews: some View {
        DatabaseView(database: RADatabase())
    }
}
