//
//  Packets.AC.RefuseLogin.swift
//  rAthena
//
//  Created by Leon Li on 2021/7/6.
//

extension Packets.AC {
    public struct RefuseLogin: Packet {
        public enum PacketType: UInt16, PacketTypeProtocol {
            case x006a = 0x006a
            case x083e = 0x083e
        }

        public let packetType: PacketType
        public var errorCode: UInt32 = 0
        public var blockDate = ""

        public var packetName: String {
            "PACKET_AC_REFUSE_LOGIN"
        }

        public var packetLength: UInt16 {
            2 + 1 + 20
        }

        public init(packetVersion: Int) {
            if packetVersion < 20120000 {
                packetType = .x006a
            } else {
                packetType = .x083e
            }
        }

        public init(from decoder: BinaryDecoder) throws {
            packetType = try decoder.decode(PacketType.self)

            switch packetType {
            case .x006a:
                errorCode = try UInt32(decoder.decode(UInt8.self))
            case .x083e:
                errorCode = try decoder.decode(UInt32.self)
            }

            blockDate = try decoder.decode(String.self, length: 20)
        }

        public func encode(to encoder: BinaryEncoder) throws {
            try encoder.encode(packetType)

            switch packetType {
            case .x006a:
                try encoder.encode(UInt8(errorCode))
            case .x083e:
                try encoder.encode(errorCode)
            }

            try encoder.encode(blockDate, length: 20)
        }
    }
}
