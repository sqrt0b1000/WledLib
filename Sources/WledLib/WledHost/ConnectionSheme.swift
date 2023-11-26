//
//  ConnectionSheme.swift
//  WledLib
//
//  Created by Robert Brune on 28.11.23.
//

extension Connection {
    
    private static var HTTP_SHEME:String { "http" }
    private static var WEB_SOCKET_SHEME: String { "ws" }
    
    var sheme: String {
        switch self {
        case .httpGet: Self.HTTP_SHEME
        case .httpPost: Self.HTTP_SHEME
        case .ws: Self.WEB_SOCKET_SHEME
        }
    }
}
