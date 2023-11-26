//
//  DeviceStateInfoExtension.swift
//  WledLib
//
//  Created by Robert Brune on 27.11.23.
//

extension Device: WledHttGet, WledWebSocketData {
    public static var WEB_SOCKET_PATH: String {
        "/ws"
    }
    
    public static var GET_PATH: String {
        "/json"
    }
}
