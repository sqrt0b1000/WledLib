//
//  WledHostHTTP.swift
//  WledLib
//
//  Created by Robert Brune on 28.11.23.
//

import Foundation

extension WledHost {
    private static var HEADER_FIELD_CONTENT_TYPE: String { "Content-Type" }
    private static var CONTENT_TYPE_JSON: String { "application/json" }
    
    private static var HTTP_METHOD_POST: String { "POST" }
    private static var HTTP_METHOD_GET: String { "GET" }
    
    private static var SUCCESS_MESSAGE:Int { 200 }
    
    private func provideRequest(
        url: URL,
        body: Data? = nil,
        method: String
    ) throws -> URLRequest {
        var request = URLRequest(url: url)
        request.addValue(
            Self.CONTENT_TYPE_JSON,
            forHTTPHeaderField: Self.HEADER_FIELD_CONTENT_TYPE
        )
        request.httpMethod = method
        request.httpBody = body
        return request
    }
    
    private func validateResponse(response: URLResponse?) -> URLError? {
        if let response = response as? HTTPURLResponse {
            guard response.statusCode == Self.SUCCESS_MESSAGE else {
                return URLError(.badServerResponse)
            }
            guard Self.CONTENT_TYPE_JSON == response.allHeaderFields[Self.HEADER_FIELD_CONTENT_TYPE] as? String else {
                return URLError(.badServerResponse)
            }
        }
        return nil
    }
    
    public func get<G: WledHttGet>(
        handleData: @escaping (_ data: G) -> Void = {_ in},
        handleError: @escaping (_ error: Error) -> Void = {_ in}
    ) throws {
        
        let url = try self.provideURL(connection: Connection.httpGet, path: G.GET_PATH)
        
        let request = try self.provideRequest(
            url: url,
            method: Self.HTTP_METHOD_GET
        )
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                handleError(error)
                return
            }
            if let error = validateResponse(response: response) {
                handleError(error)
                return
            }
            guard let data = data else {
                handleError(URLError(.badServerResponse))
                return
            }
            
            do {
                let data = try JSONDecoder().decode(G.self, from: data)
                handleData(data)
            } catch {
                handleError(error)
            }
        }
        
        task.resume()
    }
    
    public func send<S: WledHTTPPost, R: WledHTTPResponse>(
        data: S,
        encoder: JSONEncoder = JSONEncoder(),
        handleData: @escaping (_ data: R) -> Void = {_ in},
        handleError: @escaping (_ error: Error) -> Void = {_ in}
    ) throws {
        
        let url = try self.provideURL(connection: Connection.httpPost, path: S.SET_PATH)
        
        let data = try encoder.encode(data)
        
        let request = try self.provideRequest(
            url: url,
            body: data,
            method: Self.HTTP_METHOD_POST
        )
        
        let task = URLSession.shared.dataTask(
            with: request
        ) { data, response, error in
            
            if let error = error {
                handleError(error)
                return
            }
            if let error = validateResponse(response: response) {
                handleError(error)
                return
            }
            guard let data = data else {
                handleError(URLError(.badServerResponse))
                return
            }
            do {
                let data = try JSONDecoder().decode(R.self, from: data)
                handleData(data)
            } catch {
                handleError(error)
            }
        }
        task.resume()
    }
}
