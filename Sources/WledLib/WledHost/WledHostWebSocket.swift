//
//  WledHostWebSocket.swift
//  WledLib
//
//  Created by Robert Brune on 28.11.23.
//

import Foundation

extension WledHost {
    public func getWebsocketReceiver<S: WledWebSocketData>(
        handleData: @escaping (_ data: S) -> Void = {_ in},
        handleError: @escaping (_ error: Error) -> Void = {_ in}
    ) throws -> URLSessionWebSocketTask {
        
        let url = try self.provideURL(connection: .ws, path: S.WEB_SOCKET_PATH)
        
        let task = URLSession.shared.webSocketTask(with: url)
        
        let handler = { result in
            self.receive(
                task: task,
                type: S.self,
                result: result,
                handleData: handleData,
                handleError: handleError
            )
        }
        
        task.receive(completionHandler: handler)
        task.resume()
            
        return task
    }
    
    private func receive<S: WledWebSocketData>(
        task: URLSessionWebSocketTask,
        type: S.Type,
        result: Result<URLSessionWebSocketTask.Message, Error>,
        handleData: @escaping (_ data: S) -> Void = {_ in},
        handleError: @escaping (_ error: Error) -> Void
    ) {
        switch result {
        case .failure(let error):
            handleError(error)
        case .success(let message):
            switch message {
            case .data(_):
                handleError(URLError(.badServerResponse))
            case .string(let string):
                guard let data = string.data(using: .utf8) else {
                    handleError(URLError(.badServerResponse))
                    return
                }
                guard let stateData = try?JSONDecoder().decode(S.self, from: data) else {
                    handleError(URLError(.badServerResponse))
                    return
                }
                handleData(stateData)
            @unknown default: break
            }
            let handler = { result in
                self.receive(
                    task: task,
                    type: S.self,
                    result: result,
                    handleData: handleData,
                    handleError: handleError
                )
            }
            task.receive(completionHandler: handler)
        }
        
    }
    
    
}
