//
//  Info.swift
//  WledLib
//
//  Created by Robert Brune on 26.11.23.
//

public struct Info: Codable {
    
    public static let urlpath: String = "/json/info"
    
    public var leds : Leds
    public var wifi : Wifi
    public var version : String?
    public var buildId : Int64?
    public var name : String
    public var str : Bool?
    public var udpPort : Int64?
    public var isUpdatedLive : Bool?
    public var lm : String?
    public var lip : String?
    public var websocketClientCount : Int64?
    public var effectCount : Int64?
    public var paletteCount : Int64?
    public var fileSystem : FileSystem?
    public var ndc : Int64?
    public var platformName : String?
    public var arduinoCoreVersion : String?
    public var lwip : Int64?
    public var freeHeap : Int64?
    public var uptime : Int64?
    public var opt : Int64?
    public var brand : String?
    public var product : String?
    public var mac : String?
    
    
    enum CodingKeys: String, CodingKey {
        case leds
        case wifi
        case version = "ver"
        case buildId = "vid"
        case name
        case str
        case udpPort = "udpport"
        case isUpdatedLive = "Live"
        case lm
        case lip
        case websocketClientCount = "ws"
        case effectCount = "fxcount"
        case paletteCount = "palcount"
        case fileSystem = "fs"
        case ndc
        case platformName = "arch"
        case arduinoCoreVersion = "core"
        case lwip
        case freeHeap
        case uptime
        case opt
        case brand
        case product
        case mac
    }
}
