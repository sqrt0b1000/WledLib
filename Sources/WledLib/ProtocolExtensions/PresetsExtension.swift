//
//  PresetsExtension.swift
//  WledLib
//
//  Created by Robert Brune on 27.11.23.
//

extension Presets: WledHttGet {
    public static var GET_PATH: String {
        "/presets.json"
    }
}
