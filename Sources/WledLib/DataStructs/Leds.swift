//
//  Leds.swift
//  WledLib
//
//  Created by Robert Brune on 26.11.23.
//

public struct Leds: Codable {
    public var count : Int64?
    public var estimatedPowerUsed : Int64?
    public var fps : Int64?
    public var maxPower : Int64?
    public var maxSegment : Int64?
    
    
    enum CodingKeys: String, CodingKey {
        case count
        case estimatedPowerUsed = "pwr"
        case fps
        case maxPower = "maxpwr"
        case maxSegment = "maxseg"
    }
}
