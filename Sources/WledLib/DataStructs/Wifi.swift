//
//  Wifi.swift
//  WledLib
//
//  Created by Robert Brune on 26.11.23.
//

public struct Wifi: Codable {
    public var bssid : String?
    public var rssi : Int64?
    public var signal : Int64?
    public var channel : Int64?
    
    public init(bssid: String? = nil, rssi: Int64? = nil, signal: Int64? = nil, channel: Int64? = nil) {
        self.bssid = bssid
        self.rssi = rssi
        self.signal = signal
        self.channel = channel
    }
    
    
    enum CodingKeys: String, CodingKey {
        case bssid
        case rssi
        case signal
        case channel
    }
}
