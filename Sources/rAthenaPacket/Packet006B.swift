//
//  Packet006B.swift
//  rAthena
//
//  Created by Leon Li on 2021/7/7.
//

import rAthenaCommon

public struct Packet006B: Packet {

    public var totalSlotNum: UInt8
    public var premiumStartSlot: UInt8
    public var premiumEndSlot: UInt8
    public var charList: [CharInfo]

    public var packetName: String {
        return "PACKET_HC_ACCEPT_ENTER_NEO_UNION"
    }

    public var packetType: UInt16 {
        return 0x006B
    }

    public var packetLength: UInt16 {
        var length: UInt16 = 24
        if RA_CONFIG_PACKETVER >= 20100413 {
            length += 3
        }
        length += CharInfo.size * UInt16(charList.count)
        return length
    }

    public var source: PacketEndpoint {
        return .charServer
    }

    public var destination: PacketEndpoint {
        return .client
    }

    public init() {
        self.totalSlotNum = 0
        self.premiumStartSlot = 0
        self.premiumEndSlot = 0
        self.charList = []
    }

    public init(from decoder: BinaryDecoder) throws {
        let packetType = try decoder.decode(UInt16.self)
        guard packetType == 0x006B else {
            throw PacketDecodingError.packetMismatch(packetType)
        }
        let packetLength = try decoder.decode(UInt16.self)
        let charCount: UInt16
        if RA_CONFIG_PACKETVER >= 20100413 {
            charCount = (packetLength - 27) / CharInfo.size
        } else {
            charCount = (packetLength - 24) / CharInfo.size
        }

        if RA_CONFIG_PACKETVER >= 20100413 {
            self.totalSlotNum = try decoder.decode(UInt8.self)
            self.premiumStartSlot = try decoder.decode(UInt8.self)
            self.premiumEndSlot = try decoder.decode(UInt8.self)
        } else {
            self.totalSlotNum = 0
            self.premiumStartSlot = 0
            self.premiumEndSlot = 0
        }
        let _ = try decoder.decode(String.self, length: 20)

        self.charList = []
        for _ in 0..<charCount {
            let charInfo = try decoder.decode(CharInfo.self, length: Int(CharInfo.size))
            self.charList.append(charInfo)
        }
    }

    public func encode(to encoder: BinaryEncoder) throws {
        try encoder.encode(self.packetLength)
        if RA_CONFIG_PACKETVER >= 20100413 {
            try encoder.encode(self.totalSlotNum)
            try encoder.encode(self.premiumStartSlot)
            try encoder.encode(self.premiumEndSlot)
        }
        try encoder.encode("", length: 20)  // unknown bytes
        for charInfo in self.charList {
            try encoder.encode(charInfo, length: Int(CharInfo.size))
        }
    }
}

extension Packet006B {

    public struct CharInfo: BinaryDecodable, BinaryEncodable {

        public var id: UInt32
        public var baseExp: UInt64
        public var zeny: UInt32
        public var jobExp: UInt64
        public var jobLevel: UInt32
        public var option: UInt32
        public var karma: UInt32
        public var manner: UInt32
        public var statusPoint: UInt16
        public var hp: UInt32
        public var maxHp: UInt32
        public var sp: UInt16
        public var maxSp: UInt16
        public var speed: UInt16
        public var `class`: UInt16
        public var hair: UInt16
        public var body: UInt16
        public var weapon: UInt16
        public var baseLevel: UInt16
        public var skillPoint: UInt16
        public var headBottom: UInt16
        public var shield: UInt16
        public var headTop: UInt16
        public var headMid: UInt16
        public var hairColor: UInt16
        public var clothesColor: UInt16
        public var name: String
        public var str: UInt8
        public var agi: UInt8
        public var vit: UInt8
        public var int: UInt8
        public var dex: UInt8
        public var luk: UInt8
        public var slot: UInt16
        public var renamed: UInt16
        public var lastMap: String
        public var deleteDate: UInt32
        public var robe: UInt32
        public var charMoves: UInt32
        public var renameEnabled: UInt32
        public var sex: UInt8

        public static var size: UInt16 {
            var size: UInt16 = 106
            if RA_CONFIG_PACKETVER >= 20170830 {
                size += 4   // base exp
            }
            if RA_CONFIG_PACKETVER >= 20170830 {
                size += 4   // job exp
            }
            size += 4
            if RA_CONFIG_PACKETVER >= 20141022 {
                size += 2   // body
            }
            size += 2
            if (RA_CONFIG_PACKETVER >= 20100720 && RA_CONFIG_PACKETVER <= 20100727) || RA_CONFIG_PACKETVER >= 20100803 {
                size += 16  // last map
            }
            if RA_CONFIG_PACKETVER >= 20100803 {
                size += 4   // delete date
            }
            if RA_CONFIG_PACKETVER >= 20110111 {
                size += 4   // robe
            }
            if RA_CONFIG_PACKETVER != 20111116 {
                if RA_CONFIG_PACKETVER >= 20110928 {
                    size += 4   // char moves
                }
                if RA_CONFIG_PACKETVER >= 20111025 {
                    size += 4   // rename enabled
                }
                if RA_CONFIG_PACKETVER >= 20141016 {
                    size += 1   // sex
                }
            }
            return size
        }

        public init() {
            self.id = 0
            self.baseExp = 0
            self.zeny = 0
            self.jobExp = 0
            self.jobLevel = 0
            self.option = 0
            self.karma = 0
            self.manner = 0
            self.statusPoint = 0
            self.hp = 0
            self.maxHp = 0
            self.sp = 0
            self.maxSp = 0
            self.speed = 0
            self.class = 0
            self.hair = 0
            self.body = 0
            self.weapon = 0
            self.baseLevel = 0
            self.skillPoint = 0
            self.headBottom = 0
            self.shield = 0
            self.headTop = 0
            self.headMid = 0
            self.hairColor = 0
            self.clothesColor = 0
            self.name = ""
            self.str = 0
            self.agi = 0
            self.vit = 0
            self.int = 0
            self.dex = 0
            self.luk = 0
            self.slot = 0
            self.renamed = 0
            self.lastMap = ""
            self.deleteDate = 0
            self.robe = 0
            self.charMoves = 0
            self.renameEnabled = 0
            self.sex = 0
        }

        public init(from decoder: BinaryDecoder) throws {
            self.id = try decoder.decode(UInt32.self)
            if RA_CONFIG_PACKETVER >= 20170830 {
                self.baseExp = try decoder.decode(UInt64.self)
            } else {
                self.baseExp = try UInt64(decoder.decode(UInt32.self))
            }
            self.zeny = try decoder.decode(UInt32.self)
            if RA_CONFIG_PACKETVER >= 20170830 {
                self.jobExp = try decoder.decode(UInt64.self)
            } else {
                self.jobExp = try UInt64(decoder.decode(UInt32.self))
            }
            self.jobLevel = try decoder.decode(UInt32.self)
            let _ = try decoder.decode(UInt32.self)
            let _ = try decoder.decode(UInt32.self)
            self.option = try decoder.decode(UInt32.self)
            self.karma = try decoder.decode(UInt32.self)
            self.manner = try decoder.decode(UInt32.self)
            self.statusPoint = try decoder.decode(UInt16.self)
            self.hp = try decoder.decode(UInt32.self)
            self.maxHp = try decoder.decode(UInt32.self)
            self.sp = try decoder.decode(UInt16.self)
            self.maxSp = try decoder.decode(UInt16.self)
            self.speed = try decoder.decode(UInt16.self)
            self.class = try decoder.decode(UInt16.self)
            self.hair = try decoder.decode(UInt16.self)
            if RA_CONFIG_PACKETVER >= 20141022 {
                self.body = try decoder.decode(UInt16.self)
            } else {
                self.body = 0
            }
            self.weapon = try decoder.decode(UInt16.self)
            self.baseLevel = try decoder.decode(UInt16.self)
            self.skillPoint = try decoder.decode(UInt16.self)
            self.headBottom = try decoder.decode(UInt16.self)
            self.shield = try decoder.decode(UInt16.self)
            self.headTop = try decoder.decode(UInt16.self)
            self.headMid = try decoder.decode(UInt16.self)
            self.hairColor = try decoder.decode(UInt16.self)
            self.clothesColor = try decoder.decode(UInt16.self)
            self.name = try decoder.decode(String.self, length: 24)
            self.str = try decoder.decode(UInt8.self)
            self.agi = try decoder.decode(UInt8.self)
            self.vit = try decoder.decode(UInt8.self)
            self.int = try decoder.decode(UInt8.self)
            self.dex = try decoder.decode(UInt8.self)
            self.luk = try decoder.decode(UInt8.self)
            self.slot = try decoder.decode(UInt16.self)
            self.renamed = try decoder.decode(UInt16.self)
            if (RA_CONFIG_PACKETVER >= 20100720 && RA_CONFIG_PACKETVER <= 20100727) || RA_CONFIG_PACKETVER >= 20100803 {
                self.lastMap = try decoder.decode(String.self, length: 16)
            } else {
                self.lastMap = ""
            }
            if RA_CONFIG_PACKETVER >= 20100803 {
                self.deleteDate = try decoder.decode(UInt32.self)
            } else {
                self.deleteDate = 0
            }
            if RA_CONFIG_PACKETVER >= 20110111 {
                self.robe = try decoder.decode(UInt32.self)
            } else {
                self.robe = 0
            }
            if RA_CONFIG_PACKETVER != 20111116 {
                if RA_CONFIG_PACKETVER >= 20110928 {
                    self.charMoves = try decoder.decode(UInt32.self)
                } else {
                    self.charMoves = 0
                }
                if RA_CONFIG_PACKETVER >= 20111025 {
                    self.renameEnabled = try decoder.decode(UInt32.self)
                } else {
                    self.renameEnabled = 0
                }
                if RA_CONFIG_PACKETVER >= 20141016 {
                    self.sex = try decoder.decode(UInt8.self)
                } else {
                    self.sex = 0
                }
            } else {
                self.charMoves = 0
                self.renameEnabled = 0
                self.sex = 0
            }
        }

        public func encode(to encoder: BinaryEncoder) throws {
            try encoder.encode(self.id)
            if RA_CONFIG_PACKETVER >= 20170830 {
                try encoder.encode(UInt64(self.baseExp))
            } else {
                try encoder.encode(UInt32(self.baseExp))
            }
            try encoder.encode(self.zeny)
            if RA_CONFIG_PACKETVER >= 20170830 {
                try encoder.encode(UInt64(self.jobExp))
            } else {
                try encoder.encode(UInt32(self.jobExp))
            }
            try encoder.encode(self.jobLevel)
            try encoder.encode(UInt32(0))
            try encoder.encode(UInt32(0))
            try encoder.encode(self.option)
            try encoder.encode(self.karma)
            try encoder.encode(self.manner)
            try encoder.encode(self.statusPoint)
            try encoder.encode(self.hp)
            try encoder.encode(self.maxHp)
            try encoder.encode(self.sp)
            try encoder.encode(self.maxSp)
            try encoder.encode(self.speed)
            try encoder.encode(self.class)
            try encoder.encode(self.hair)
            if RA_CONFIG_PACKETVER >= 20141022 {
                try encoder.encode(self.body)
            }
            try encoder.encode(self.weapon)
            try encoder.encode(self.baseLevel)
            try encoder.encode(self.skillPoint)
            try encoder.encode(self.headBottom)
            try encoder.encode(self.shield)
            try encoder.encode(self.headTop)
            try encoder.encode(self.headMid)
            try encoder.encode(self.hairColor)
            try encoder.encode(self.clothesColor)
            try encoder.encode(self.name, length: 24)
            try encoder.encode(self.str)
            try encoder.encode(self.agi)
            try encoder.encode(self.vit)
            try encoder.encode(self.int)
            try encoder.encode(self.dex)
            try encoder.encode(self.luk)
            try encoder.encode(self.slot)
            try encoder.encode(self.renamed)
            if (RA_CONFIG_PACKETVER >= 20100720 && RA_CONFIG_PACKETVER <= 20100727) || RA_CONFIG_PACKETVER >= 20100803 {
                try encoder.encode(self.lastMap, length: 16)
            }
            if RA_CONFIG_PACKETVER >= 20100803 {
                try encoder.encode(self.deleteDate)
            }
            if RA_CONFIG_PACKETVER >= 20110111 {
                try encoder.encode(self.robe)
            }
            if RA_CONFIG_PACKETVER != 20111116 {
                if RA_CONFIG_PACKETVER >= 20110928 {
                    try encoder.encode(self.charMoves)
                }
                if RA_CONFIG_PACKETVER >= 20111025 {
                    try encoder.encode(self.renameEnabled)
                }
                if RA_CONFIG_PACKETVER >= 20141016 {
                    try encoder.encode(self.sex)
                }
            }
        }
    }
}
