//
//  FileSystem.swift
//  WledLib
//
//  Created by Robert Brune on 26.11.23.
//

public struct FileSystem: Codable {
    public var spaceUsed : Int64?
    public var spaceTotal : Int64?
    public var presetLastModification : Int64?
    
    enum CodingKeys: String, CodingKey {
        case spaceUsed = "u"
        case spaceTotal = "t"
        case presetLastModification = "pmt"
    }
}
