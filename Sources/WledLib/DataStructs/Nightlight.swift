//
//  Nightlight.swift
//  WledLib
//
//  Created by Robert Brune on 26.11.23.
//

public struct Nightlight: Codable {
    public var isOn : Bool?
    public var duration : Int64?
    public var fade : Bool?
    public var mode : Int64?
    public var targetBrightness : Int64?
    public var remainingTime : Int64?
    
    
    enum CodingKeys: String, CodingKey {
        case isOn = "on"
        case duration = "dur"
        case fade
        case mode
        case targetBrightness = "tbri"
        case remainingTime = "rem"
    }
}
