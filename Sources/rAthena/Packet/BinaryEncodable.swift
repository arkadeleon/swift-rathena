//
//  BinaryEncodable.swift
//  rAthena
//
//  Created by Leon Li on 2021/6/28.
//

public protocol BinaryEncodable {

    func encode(to encoder: BinaryEncoder) throws
}

public protocol BinaryEncoder {

    func container() -> BinaryEncodingContaner
}

public protocol BinaryEncodingContaner {

    func encode(_ value: String, length: Int) throws

    func encode<T: FixedWidthInteger>(_ value: T) throws
}
