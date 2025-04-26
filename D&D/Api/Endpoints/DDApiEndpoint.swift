//
//  DDApiEndpoint.swift
//  D&D
//
//  Created by Alex Reynolds on 4/26/25.
//
import Foundation

struct DDApiURLEndpoint {
    
    enum Path : String, CaseIterable {
        case classes
        case spells
        case monsters
        case features
    }
    
    enum Method : String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"

    }
    
    var baseURL: URL {//Api version doesn't seem to change in decades but if it were more given to change, we can extract the version path component and select version when we build the request in case some endpoints are only in newer version
        return URL(string: "https://www.dnd5eapi.co/api/2014")!
    }
    
    
    func baseComponentsFor(paths:[DDApiURLEndpointPath]) -> URLComponents {
        var url = self.baseURL
        
        for path in paths {
            url = url.appendingPathComponent(path.path.rawValue)
            if let resourceId = path.resourceId {
                url = url.appendingPathComponent(resourceId)
            }
        }
        
        return URLComponents(url: url, resolvingAgainstBaseURL: true)!
    }
    
    
    
    func makeRequest(components: URLComponents, method:Method, queryItems: [URLQueryItem]?) -> URLRequest {
        var locComp = components
        locComp.queryItems = queryItems

        var request = URLRequest(url: locComp.url!)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
}


struct DDApiURLEndpointPath {
    var path: DDApiURLEndpoint.Path
    var resourceId: String?
}
