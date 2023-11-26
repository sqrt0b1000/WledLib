//
//  WledWebSocketData.swift
//  WledLib
//
//  Created by Robert Brune on 21.11.23.
//

import Foundation

public protocol WledWebSocketData: Decodable {
    static var WEB_SOCKET_PATH:String { get }
}
