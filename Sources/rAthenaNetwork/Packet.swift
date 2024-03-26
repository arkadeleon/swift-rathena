//
//  Packet.swift
//  rAthena
//
//  Created by Leon Li on 2021/7/5.
//

public protocol Packet: BinaryDecodable, BinaryEncodable {

    var packetName: String { get }

    var packetType: UInt16 { get }

    var packetLength: UInt16 { get }
}
