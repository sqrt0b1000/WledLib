//
//  WledHost.swift
//  WledLib
//
//  Created by Robert Brune on 27.11.23.
//

import Foundation

public protocol WledHost {
    var hostname:String { get }
    
    static func createDevice(name: String, domain: String) -> Self
}
