//
//  DiscoveryService.swift
// WledLib
//
//  Created by Robert Brune on 13.12.23.
//

import Foundation
import Network
import Logging

fileprivate enum DiscoveryServiceConstants {
    static let LOGGER = Logger(label: "WledLib.DiscoveryService")
    static let TYPE = "_wled._tcp."
    static let DOMAIN = "local."
    static let QUEUE = DispatchQueue(label: "WledLib.DiscoveryService", qos: .userInitiated)
}

public class DiscoveryService<D>: ObservableObject where D: WledHost, D: Hashable {
    
    private let browser: NWBrowser
    
    @Published public var devices:Set<D> = Set()
    
    public init() {
        
        let bonjourTCP = NWBrowser.Descriptor.bonjour(
            type: DiscoveryServiceConstants.TYPE ,
            domain: DiscoveryServiceConstants.DOMAIN
        )
        
        let bonjourParms = NWParameters.init()
        bonjourParms.allowLocalEndpointReuse = true
        bonjourParms.acceptLocalOnly = true
        bonjourParms.allowFastOpen = true
        
        browser = NWBrowser(for: bonjourTCP, using: bonjourParms)
        browser.stateUpdateHandler = self.hanlderUpdate(_:)
        browser.browseResultsChangedHandler = self.browserResultHandler(_:_:)
    }
    
    public func startService() {
        DiscoveryServiceConstants.LOGGER.info("Start discovery service")
        browser.start(queue: DiscoveryServiceConstants.QUEUE)
    }
    
    public func stopService() {
        DiscoveryServiceConstants.LOGGER.info("Stop discovery service")
        browser.cancel()
    }
    
    private func browserResultHandler(_ newResults: Set<NWBrowser.Result>, _ changes: Set<NWBrowser.Result.Change>) {
        DiscoveryServiceConstants.LOGGER.info("Handle scan results")
        
        #if DEBUG
        for result in newResults {
            DiscoveryServiceConstants.LOGGER.info("\(String(reflecting: result))")
        }
        #endif
        
        for change in changes {
            switch change {
            case .identical:
                DiscoveryServiceConstants.LOGGER.info("Results identical")
            case .added(let result):
                DiscoveryServiceConstants.LOGGER.info("Result added: \(result.endpoint.debugDescription)")
                guard let info = resultInfo(result: result) else {
                    return
                }
                let d = D.createDevice(name: info.name, domain: info.domain)
                devices.insert(d)
                
            case .removed(let result):
                DiscoveryServiceConstants.LOGGER.info("Result removed: \(result.endpoint.debugDescription)")
                guard let info = resultInfo(result: result) else {
                    return
                }
                let d = D.createDevice(name: info.name, domain: info.domain)
                devices.remove(d)
            case .changed(_ , let newResult, _):
                DiscoveryServiceConstants.LOGGER.info("Result changed: \(newResult.endpoint.debugDescription)")
            @unknown default:
                DiscoveryServiceConstants.LOGGER.error("Unnown result change")
            }
        }
    }
    
    private func resultInfo(result: NWBrowser.Result) -> (name: String, domain: String)? {
        if case .service(let name, let type, let domain, _) = result.endpoint {
            if type == DiscoveryServiceConstants.TYPE {
                return (name, domain)
            } else {
                DiscoveryServiceConstants.LOGGER.error("Invalid service type")
            }
        } else {
            DiscoveryServiceConstants.LOGGER.error("Expected service as browser result")
        }
        return nil
    }
    
    private func hanlderUpdate(_ newState: NWBrowser.State) {
        switch newState {
        case .failed(let error):
            DiscoveryServiceConstants.LOGGER.error("Error state: \(error) – restarting")
            stopService()
            startService()
        case .ready:
            DiscoveryServiceConstants.LOGGER.info("Ready state")
        case .setup:
            DiscoveryServiceConstants.LOGGER.info("Setup state")
        case .cancelled:
            DiscoveryServiceConstants.LOGGER.info("Cancelled state")
        case .waiting(_):
            DiscoveryServiceConstants.LOGGER.info("New state  waiting")
        @unknown default:
            DiscoveryServiceConstants.LOGGER.info("Unnown status change")
        }
    }
}
