//
//  Packets.CH.DeleteChar.swift
//  rAthena
//
//  Created by Leon Li on 2021/7/6.
//

extension Packets.CH {
    public struct DeleteChar: Packet {
        public enum PacketType: UInt16, PacketTypeProtocol {
            case x0068 = 0x0068
        }

        public let packetType: PacketType
        public var gid: UInt32 = 0
        public var key = ""

        public var packetName: String {
            "PACKET_CH_DELETE_CHAR"
        }

        public var packetLength: UInt16 {
            2 + 4 + 40
        }

        public init(packetVersion: Int) {
            packetType = .x0068
        }

        public init(from decoder: BinaryDecoder) throws {
            packetType = try decoder.decode(PacketType.self)
            gid = try decoder.decode(UInt32.self)
            key = try decoder.decode(String.self, length: 40)
        }

        public func encode(to encoder: BinaryEncoder) throws {
            try encoder.encode(packetType)
            try encoder.encode(gid)
            try encoder.encode(key, length: 40)
        }
    }
}
