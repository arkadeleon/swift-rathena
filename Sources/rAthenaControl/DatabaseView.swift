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
                Text(record.recordTitle)
            }
        }
        .task {
            records = await database.load()
        }
    }
}

struct DatabaseView_Previews: PreviewProvider {
    static var previews: some View {
        DatabaseView(database: RADatabase())
    }
}
