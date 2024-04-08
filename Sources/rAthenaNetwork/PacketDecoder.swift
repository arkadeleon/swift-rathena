//
//  PacketDecoder.swift
//  rAthena
//
//  Created by Leon Li on 2021/6/28.
//

import Foundation

public enum PacketDecodingError: Error {
    case packetMismatch(UInt16)
    case unknownPacket(UInt16)
}

public class PacketDecoder {
    public let packetVersion: Int
    private let packets: [UInt16 : any PacketProtocol.Type]

    public init(packetVersion: Int) {
        self.packetVersion = packetVersion
        self.packets = Dictionary(uniqueKeysWithValues: PacketManager.shared.allPackets.map({ ($0.init(packetVersion: packetVersion).packetType.rawValue, $0) }))
    }

    public func decode(from data: Data) throws -> any PacketProtocol {
        let packetTypeDecoder = BinaryDecoder(data: data, packetVersion: packetVersion)
        let packetType = try packetTypeDecoder.decode(UInt16.self)
        guard let packet = packets[packetType] else {
            throw PacketDecodingError.unknownPacket(packetType)
        }
        let decoder = BinaryDecoder(data: data, packetVersion: packetVersion)
        return try packet.init(from: decoder)
    }
}
