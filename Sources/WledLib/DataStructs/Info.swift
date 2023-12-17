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
    public var ip : String?
    
    public init(
        leds: Leds = Leds(),
        wifi: Wifi = Wifi(),
        version: String? = nil,
        buildId: Int64? = nil,
        name: String,
        str: Bool? = nil,
        udpPort: Int64? = nil,
        isUpdatedLive: Bool? = nil,
        lm: String? = nil,
        lip: String? = nil,
        websocketClientCount: Int64? = nil,
        effectCount: Int64? = nil,
        paletteCount: Int64? = nil,
        fileSystem: FileSystem? = nil,
        ndc: Int64? = nil,
        platformName: String? = nil,
        arduinoCoreVersion: String? = nil,
        lwip: Int64? = nil,
        freeHeap: Int64? = nil,
        uptime: Int64? = nil,
        opt: Int64? = nil,
        brand: String? = nil,
        product: String? = nil,
        mac: String? = nil,
        ip: String? = nil
    ) {
        self.leds = leds
        self.wifi = wifi
        self.version = version
        self.buildId = buildId
        self.name = name
        self.str = str
        self.udpPort = udpPort
        self.isUpdatedLive = isUpdatedLive
        self.lm = lm
        self.lip = lip
        self.websocketClientCount = websocketClientCount
        self.effectCount = effectCount
        self.paletteCount = paletteCount
        self.fileSystem = fileSystem
        self.ndc = ndc
        self.platformName = platformName
        self.arduinoCoreVersion = arduinoCoreVersion
        self.lwip = lwip
        self.freeHeap = freeHeap
        self.uptime = uptime
        self.opt = opt
        self.brand = brand
        self.product = product
        self.mac = mac
        self.ip = ip
    }
    
    
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
        case ip
    }
}
