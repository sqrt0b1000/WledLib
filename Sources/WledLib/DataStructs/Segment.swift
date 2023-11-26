//
//  Segment.swift
//  WledLib
//
//  Created by Robert Brune on 26.11.23.
//

public struct Segment: Decodable, Encodable {
    public var id : Int64?
    public var start : Int64?
    public var stop : Int64?
    public var length : Int64?
    public var grouping : Int64?
    public var spacing : Int64?
    public var isOn : Bool?
    public var brightness : Int64?
    public var colors : [[Int64]]?
    public var effect : Int64?
    public var effectSpeed : Int64?
    public var effectInt64ensity : Int64?
    public var palette : Int64?
    public var isSelected : Bool?
    public var isReversed : Bool?
    public var isMirrored : Bool?
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case start
        case stop
        case length = "len"
        case grouping = "grp"
        case spacing = "spc"
        case isOn = "on"
        case brightness = "bri"
        case colors = "col"
        case effect = "fx"
        case effectSpeed = "sx"
        case effectInt64ensity = "ix"
        case palette = "pal"
        case isSelected = "sel"
        case isReversed = "rev"
        case isMirrored = "mi"
    }
}
