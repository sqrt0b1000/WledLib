//
//  Device.swift
//  WledLib
//
//  Created by Robert Brune on 26.11.23.
//

public struct Device: Codable {
    public var state: State
    public var info: Info
    
    init(state: State = State(), info: Info) {
        self.state = state
        self.info = info
    }
    
    enum CodingKeys: String, CodingKey {
        case state
        case info
    }
}
