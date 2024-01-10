//
//  Size.swift
//  rAthena
//
//  Created by Leon Li on 2024/1/9.
//

public enum Size: String, Decodable, CustomStringConvertible {

    /// Small.
    case small = "Small"

    /// Medium.
    case medium = "Medium"

    /// Large
    case large = "Large"

    public var description: String {
        rawValue
    }
}
