//
//  Size.swift
//  rAthena
//
//  Created by Leon Li on 2024/1/9.
//

public enum Size: String, CaseIterable, CodingKey, Decodable {

    /// Small.
    case small = "Small"

    /// Medium.
    case medium = "Medium"

    /// Large
    case large = "Large"
}
