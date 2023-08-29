//
//  RADatabase+Identifiable.swift
//  rAthena
//
//  Created by Leon Li on 2023/8/29.
//

import rAthenaCommon

extension RADatabaseRecord: Identifiable {
    public var id: Int {
        recordID
    }
}

extension RADatabaseRecordField: Identifiable {
    public var id: String {
        if let reference = value.reference {
            return "\(reference.recordID)"
        } else {
            return name
        }
    }
}
