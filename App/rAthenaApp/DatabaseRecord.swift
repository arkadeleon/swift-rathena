//
//  DatabaseRecord.swift
//  rAthenaApp
//
//  Created by Leon Li on 2024/1/4.
//

import rAthenaMap

protocol DatabaseRecord {
    var recordID: Int { get }
    var recordTitle: String { get }

    func recordFields() async throws -> [DatabaseRecordField]
}

enum DatabaseRecordField {
    case string(String, String)
    case reference(String, DatabaseRecord)
    case array(String, [DatabaseRecordField])

    var array: [DatabaseRecordField]? {
        switch self {
        case .string:
            return nil
        case .reference:
            return nil
        case .array(_, let array):
            return array
        }
    }
}

extension DatabaseRecordField: Identifiable {
    var id: String {
        switch self {
        case .string(let name, _):
            return name
        case .reference(_, let record):
            return "\(record.recordID)"
        case .array(let name, _):
            return name
        }
    }
}
