//
//  WledHTTPPost.swift
//  WledLib
//
//  Created by Robert Brune on 27.11.23.
//

public protocol WledHTTPPost: Encodable {
    static var SET_PATH:String { get }
}
