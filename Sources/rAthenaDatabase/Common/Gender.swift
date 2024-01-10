//
//  Gender.swift
//  rAthena
//
//  Created by Leon Li on 2024/1/10.
//

public enum Gender: String, Decodable, CustomStringConvertible {

    /// Female
    case female = "Female"

    /// Male
    case male = "Male"

    /// Both
    case both = "Both"

    public var description: String {
        rawValue
    }
}
