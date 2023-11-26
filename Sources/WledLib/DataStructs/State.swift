//
//  State.swift
//  WledLib
//
//  Created by Robert Brune on 26.11.23.
//

public struct State: Codable {
    
    public init(isOn: Bool? = nil, brightness: UInt8? = nil, transition: Int64? = nil, selectedPresetId: Int64? = nil, selectedPlaylistId: Int64? = nil, nightlight: Nightlight? = nil, liveDataOverride: Int64? = nil, mainSegment: Int64? = nil, segment: [Segment]? = nil, debug: Bool? = nil) {
        self.isOn = isOn
        self.brightness = brightness
        self.transition = transition
        self.selectedPresetId = selectedPresetId
        self.selectedPlaylistId = selectedPlaylistId
        self.nightlight = nightlight
        self.liveDataOverride = liveDataOverride
        self.mainSegment = mainSegment
        self.segment = segment
        self.debug = debug
    }
    
    public var isOn: Bool?
    public var brightness: UInt8?
    public var transition: Int64?
    public var selectedPresetId: Int64?
    public var selectedPlaylistId: Int64?
    public var nightlight: Nightlight?
    public var liveDataOverride: Int64?
    public var mainSegment: Int64?
    public var segment: [Segment]?
    public var debug: Bool?
    
    
    enum CodingKeys: String, CodingKey {
        case isOn = "on"
        case brightness = "bri"
        case transition
        case selectedPresetId = "ps"
        case selectedPlaylistId = "pl"
        case nightlight = "nl"
        case liveDataOverride = "lor"
        case mainSegment = "mainseg"
        case segment = "seg"
        case debug = "v"
    }
}
