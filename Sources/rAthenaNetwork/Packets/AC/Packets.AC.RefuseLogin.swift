//
//  Packets.AC.RefuseLogin.swift
//  rAthena
//
//  Created by Leon Li on 2021/7/6.
//

extension Packets.AC {

    public struct RefuseLogin: Packet {

        public var errorCode: UInt8
        public var blockDate: String

        public var packetName: String {
            return "PACKET_AC_REFUSE_LOGIN"
        }

        public var packetType: UInt16 {
            return 0x006A
        }

        public var packetLength: UInt16 {
            return 2 + 1 + 20
        }

        public var source: PacketEndpoint {
            return .loginServer
        }

        public var destination: PacketEndpoint {
            return .client
        }

        public init() {
            self.errorCode = 0
            self.blockDate = ""
        }

        public init(from decoder: BinaryDecoder) throws {
            let packetType = try decoder.decode(UInt16.self)
            guard packetType == 0x006A else {
                throw PacketDecodingError.packetMismatch(packetType)
            }
            self.errorCode = try decoder.decode(UInt8.self)
            self.blockDate = try decoder.decode(String.self, length: 20)
        }

        public func encode(to encoder: BinaryEncoder) throws {
            try encoder.encode(self.packetType)
            try encoder.encode(self.errorCode)
            try encoder.encode(self.blockDate, length: 20)
        }
    }
}
