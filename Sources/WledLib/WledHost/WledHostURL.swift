//
//  WledHostURL.swift
//  WledLib
//
//  Created by Robert Brune on 28.11.23.
//

import Foundation

extension WledHost {
    func provideURL(connection: Connection, path: String) throws -> URL {
        var urlComponents = URLComponents()
        
        urlComponents.scheme = connection.sheme
        urlComponents.path = path
        urlComponents.host = self.hostname
        
        guard let url = urlComponents.url else {
            let userInfo = [
                "sheme": connection.sheme,
                "host": self.hostname,
                "path": path,
            ]
            throw URLError(URLError.Code.badURL, userInfo: userInfo)
        }
        return url
    }
}
