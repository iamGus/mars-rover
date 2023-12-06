//
//  Endpoint.swift
//  Mars Rover
//
//  Created by Angus Muller on 05/12/2023.
//

import Foundation

/// A type that provides URLRequests for defined API endpoints
protocol Endpoint {
    var base: String { get }
    var path: String { get }
    var queryItem: [URLQueryItem] { get }
}

extension Endpoint {
    /// Returns an instance of URLComponents containing the base URL, path and
    /// query items provided
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        components.queryItems = queryItem
        
        return components
    }
    
    /// Returns an instance of URLRequest encapsulating the endpoint URL. This
    /// URL is obtained through the `urlComponents` object.
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}

enum NasaEndpoint {
    /// A type that provides possible sort options for returned rover cameras
    enum SortRoverCameras: CustomStringConvertible {
        case all, fhaz, rhaz, mast, chemcam, mahli, mardi, navcam, pancam, minites
        
        var description: String {
            switch self {
            case .all: return "all"
            case .fhaz: return "FHAZ"
            case .rhaz: return "RHAZ"
            case .mast: return "MAST"
            case .chemcam: return "CHEMCAM"
            case .mahli: return "MAHLI"
            case .mardi: return "MARDI"
            case .navcam: return "NAVCAM"
            case .pancam: return "PANCAM"
            case .minites: return "MINITES"
            }
        }
    }
    
    
    case roverTypes
    case imageSearchByRover(rover: String)
}

extension NasaEndpoint: Endpoint {
    var base: String {
        return NetworkConstants.baseEndpoint
    }
    
    
    var path: String {
        switch self {
        case .roverTypes: return "/mars-photos/api/v1/rovers"
        case .imageSearchByRover(let rover): return "/mars-photos/api/v1/rovers/\(rover)/photos"
        }
    }
    
    private var apiKey: String {
        return NetworkConstants.apiKey
    }
    
    var queryItem: [URLQueryItem] {
        switch self {
        
        case .roverTypes:
            return [
            URLQueryItem(name: "api_key", value: apiKey)
            ]
        case .imageSearchByRover( _):
                return [
                    URLQueryItem(name: "api_key", value: apiKey),
                    URLQueryItem(name: "sol", value: "1000")
                ]
            }
        }
}

