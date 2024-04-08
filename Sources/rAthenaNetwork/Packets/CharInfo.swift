//
//  CharInfo.swift
//  rAthena
//
//  Created by Leon Li on 2024/3/27.
//

public struct CharInfo: BinaryDecodable, BinaryEncodable {
    public var id: UInt32 = 0
    public var baseExp: UInt64 = 0
    public var zeny: UInt32 = 0
    public var jobExp: UInt64 = 0
    public var jobLevel: UInt32 = 0
    public var option: UInt32 = 0
    public var karma: UInt32 = 0
    public var manner: UInt32 = 0
    public var statusPoint: UInt16 = 0
    public var hp: UInt32 = 0
    public var maxHp: UInt32 = 0
    public var sp: UInt16 = 0
    public var maxSp: UInt16 = 0
    public var speed: UInt16 = 0
    public var `class`: UInt16 = 0
    public var hair: UInt16 = 0
    public var body: UInt16 = 0
    public var weapon: UInt16 = 0
    public var baseLevel: UInt16 = 0
    public var skillPoint: UInt16 = 0
    public var headBottom: UInt16 = 0
    public var shield: UInt16 = 0
    public var headTop: UInt16 = 0
    public var headMid: UInt16 = 0
    public var hairColor: UInt16 = 0
    public var clothesColor: UInt16 = 0
    public var name = ""
    public var str: UInt8 = 0
    public var agi: UInt8 = 0
    public var vit: UInt8 = 0
    public var int: UInt8 = 0
    public var dex: UInt8 = 0
    public var luk: UInt8 = 0
    public var slot: UInt16 = 0
    public var renamed: UInt16 = 0
    public var lastMap = ""
    public var deleteDate: UInt32 = 0
    public var robe: UInt32 = 0
    public var charMoves: UInt32 = 0
    public var renameEnabled: UInt32 = 0
    public var sex: UInt8 = 0

    public static func size(for packetVersion: Int) -> UInt16 {
        var size: UInt16 = 106
        if packetVersion >= 20170830 {
            size += 4   // base exp
        }
        if packetVersion >= 20170830 {
            size += 4   // job exp
        }
        size += 4
        if packetVersion >= 20141022 {
            size += 2   // body
        }
        size += 2
        if (packetVersion >= 20100720 && packetVersion <= 20100727) || packetVersion >= 20100803 {
            size += 16  // last map
        }
        if packetVersion >= 20100803 {
            size += 4   // delete date
        }
        if packetVersion >= 20110111 {
            size += 4   // robe
        }
        if packetVersion >= 20110928 {
            size += 4   // char moves
        }
        if packetVersion >= 20111025 {
            size += 4   // rename enabled
        }
        if packetVersion >= 20141016 {
            size += 1   // sex
        }
        return size
    }

    public init(from decoder: BinaryDecoder) throws {
        id = try decoder.decode(UInt32.self)
        if decoder.packetVersion >= 20170830 {
            baseExp = try decoder.decode(UInt64.self)
        } else {
            baseExp = try UInt64(decoder.decode(UInt32.self))
        }
        zeny = try decoder.decode(UInt32.self)
        if decoder.packetVersion >= 20170830 {
            jobExp = try decoder.decode(UInt64.self)
        } else {
            jobExp = try UInt64(decoder.decode(UInt32.self))
        }
        jobLevel = try decoder.decode(UInt32.self)
        _ = try decoder.decode(UInt32.self)
        _ = try decoder.decode(UInt32.self)
        option = try decoder.decode(UInt32.self)
        karma = try decoder.decode(UInt32.self)
        manner = try decoder.decode(UInt32.self)
        statusPoint = try decoder.decode(UInt16.self)
        hp = try decoder.decode(UInt32.self)
        maxHp = try decoder.decode(UInt32.self)
        sp = try decoder.decode(UInt16.self)
        maxSp = try decoder.decode(UInt16.self)
        speed = try decoder.decode(UInt16.self)
        self.class = try decoder.decode(UInt16.self)
        hair = try decoder.decode(UInt16.self)
        if decoder.packetVersion >= 20141022 {
            body = try decoder.decode(UInt16.self)
        }
        weapon = try decoder.decode(UInt16.self)
        baseLevel = try decoder.decode(UInt16.self)
        skillPoint = try decoder.decode(UInt16.self)
        headBottom = try decoder.decode(UInt16.self)
        shield = try decoder.decode(UInt16.self)
        headTop = try decoder.decode(UInt16.self)
        headMid = try decoder.decode(UInt16.self)
        hairColor = try decoder.decode(UInt16.self)
        clothesColor = try decoder.decode(UInt16.self)
        name = try decoder.decode(String.self, length: 24)
        str = try decoder.decode(UInt8.self)
        agi = try decoder.decode(UInt8.self)
        vit = try decoder.decode(UInt8.self)
        int = try decoder.decode(UInt8.self)
        dex = try decoder.decode(UInt8.self)
        luk = try decoder.decode(UInt8.self)
        slot = try decoder.decode(UInt16.self)
        renamed = try decoder.decode(UInt16.self)
        if (decoder.packetVersion >= 20100720 && decoder.packetVersion <= 20100727) || decoder.packetVersion >= 20100803 {
            lastMap = try decoder.decode(String.self, length: 16)
        }
        if decoder.packetVersion >= 20100803 {
            deleteDate = try decoder.decode(UInt32.self)
        }
        if decoder.packetVersion >= 20110111 {
            robe = try decoder.decode(UInt32.self)
        }
        if decoder.packetVersion >= 20110928 {
            charMoves = try decoder.decode(UInt32.self)
        }
        if decoder.packetVersion >= 20111025 {
            renameEnabled = try decoder.decode(UInt32.self)
        }
        if decoder.packetVersion >= 20141016 {
            sex = try decoder.decode(UInt8.self)
        }
    }

    public func encode(to encoder: BinaryEncoder) throws {
        try encoder.encode(id)
        if encoder.packetVersion >= 20170830 {
            try encoder.encode(UInt64(baseExp))
        } else {
            try encoder.encode(UInt32(baseExp))
        }
        try encoder.encode(zeny)
        if encoder.packetVersion >= 20170830 {
            try encoder.encode(UInt64(jobExp))
        } else {
            try encoder.encode(UInt32(jobExp))
        }
        try encoder.encode(jobLevel)
        try encoder.encode(UInt32(0))
        try encoder.encode(UInt32(0))
        try encoder.encode(option)
        try encoder.encode(karma)
        try encoder.encode(manner)
        try encoder.encode(statusPoint)
        try encoder.encode(hp)
        try encoder.encode(maxHp)
        try encoder.encode(sp)
        try encoder.encode(maxSp)
        try encoder.encode(speed)
        try encoder.encode(self.class)
        try encoder.encode(hair)
        if encoder.packetVersion >= 20141022 {
            try encoder.encode(body)
        }
        try encoder.encode(weapon)
        try encoder.encode(baseLevel)
        try encoder.encode(skillPoint)
        try encoder.encode(headBottom)
        try encoder.encode(shield)
        try encoder.encode(headTop)
        try encoder.encode(headMid)
        try encoder.encode(hairColor)
        try encoder.encode(clothesColor)
        try encoder.encode(name, length: 24)
        try encoder.encode(str)
        try encoder.encode(agi)
        try encoder.encode(vit)
        try encoder.encode(int)
        try encoder.encode(dex)
        try encoder.encode(luk)
        try encoder.encode(slot)
        try encoder.encode(renamed)
        if (encoder.packetVersion >= 20100720 && encoder.packetVersion <= 20100727) || encoder.packetVersion >= 20100803 {
            try encoder.encode(lastMap, length: 16)
        }
        if encoder.packetVersion >= 20100803 {
            try encoder.encode(deleteDate)
        }
        if encoder.packetVersion >= 20110111 {
            try encoder.encode(robe)
        }
        if encoder.packetVersion >= 20110928 {
            try encoder.encode(charMoves)
        }
        if encoder.packetVersion >= 20111025 {
            try encoder.encode(renameEnabled)
        }
        if encoder.packetVersion >= 20141016 {
            try encoder.encode(sex)
        }
    }
}
