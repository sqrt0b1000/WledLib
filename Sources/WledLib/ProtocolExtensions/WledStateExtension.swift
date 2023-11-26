//
//  WledStateExtension.swift
//  WledLib
//
//  Created by Robert Brune on 27.11.23.
//

extension State: WledHTTPPost {
    public static var SET_PATH: String {
        "/json/state"
    }
    
    public static var HTTP_PATH: String {
        "/json/state"
    }
}
