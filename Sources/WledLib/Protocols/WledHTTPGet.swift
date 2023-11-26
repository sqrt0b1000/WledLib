//
//  WledHttpGet.swift
//  WledLib
//
//  Created by Robert Brune on 27.11.23.
//

public protocol WledHttGet: Decodable {
    static var GET_PATH:String { get }
}
