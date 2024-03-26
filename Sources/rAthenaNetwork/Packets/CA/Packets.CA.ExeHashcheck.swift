//
//  Packets.CA.ExeHashcheck.swift
//  rAthena
//
//  Created by Leon Li on 2024/3/26.
//

extension Packets.CA {

    public struct ExeHashcheck: Packet {

        public var hashValue: [UInt8]

        public var packetName: String {
            return "PACKET_CA_EXE_HASHCHECK"
        }

        public var packetType: UInt16 {
            return 0x0204
        }

        public var packetLength: UInt16 {
            return 2 + 16
        }

        public init() {
            self.hashValue = []
        }

        public init(from decoder: BinaryDecoder) throws {
            let packetType = try decoder.decode(UInt16.self)
            guard packetType == 0x0204 else {
                throw PacketDecodingError.packetMismatch(packetType)
            }
            self.hashValue = try decoder.decode([UInt8].self, length: 16)
        }

        public func encode(to encoder: BinaryEncoder) throws {
            try encoder.encode(self.packetType)
            try encoder.encode(self.hashValue)
        }
    }
}
