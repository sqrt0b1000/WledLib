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
    
    public init(count: Int64? = nil, estimatedPowerUsed: Int64? = nil, fps: Int64? = nil, maxPower: Int64? = nil, maxSegment: Int64? = nil) {
        self.count = count
        self.estimatedPowerUsed = estimatedPowerUsed
        self.fps = fps
        self.maxPower = maxPower
        self.maxSegment = maxSegment
    }
    
    
    enum CodingKeys: String, CodingKey {
        case count
        case estimatedPowerUsed = "pwr"
        case fps
        case maxPower = "maxpwr"
        case maxSegment = "maxseg"
    }
}
