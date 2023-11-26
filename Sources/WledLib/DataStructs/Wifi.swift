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
    
    
    enum CodingKeys: String, CodingKey {
        case bssid
        case rssi
        case signal
        case channel
    }
}
