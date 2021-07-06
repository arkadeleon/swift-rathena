//
//  Packet.swift
//  rAthena
//
//  Created by Leon Li on 2021/7/5.
//

public protocol Packet: BinaryDecodable, BinaryEncodable {

    var packetType: UInt16 { get }

    var packetName: String { get }

    var source: PacketEndpoint { get }

    var destination: PacketEndpoint { get }
}
