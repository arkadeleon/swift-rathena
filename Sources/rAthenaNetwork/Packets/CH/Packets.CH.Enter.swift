//
//  Packets.CH.Enter.swift
//  rAthena
//
//  Created by Leon Li on 2021/7/6.
//

extension Packets.CH {

    public struct Enter: Packet {

        public var aid: UInt32
        public var authCode: UInt32
        public var userLevel: UInt32
        public var clientType: UInt16
        public var sex: UInt8

        public var packetName: String {
            return "PACKET_CH_ENTER"
        }

        public var packetType: UInt16 {
            return 0x0065
        }

        public var packetLength: UInt16 {
            return 2 + 4 + 4 + 4 + 2 + 1
        }

        public init() {
            self.aid = 0
            self.authCode = 0
            self.userLevel = 0
            self.clientType = 0
            self.sex = 0
        }

        public init(from decoder: BinaryDecoder) throws {
            let packetType = try decoder.decode(UInt16.self)
            guard packetType == 0x0065 else {
                throw PacketDecodingError.packetMismatch(packetType)
            }
            self.aid = try decoder.decode(UInt32.self)
            self.authCode = try decoder.decode(UInt32.self)
            self.userLevel = try decoder.decode(UInt32.self)
            self.clientType = try decoder.decode(UInt16.self)
            self.sex = try decoder.decode(UInt8.self)
        }

        public func encode(to encoder: BinaryEncoder) throws {
            try encoder.encode(self.packetType)
            try encoder.encode(self.aid)
            try encoder.encode(self.authCode)
            try encoder.encode(self.userLevel)
            try encoder.encode(self.clientType)
            try encoder.encode(self.sex)
        }
    }
}
