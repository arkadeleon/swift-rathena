//
//  PacketVersion.swift
//  rAthena
//
//  Created by Leon Li on 2024/4/8.
//

import rAthenaCommon

public struct PacketVersion {
    public let mode: Mode
    public let number: Int

    public init(mode: Mode, number: Int) {
        self.mode = mode
        self.number = number
    }
}
