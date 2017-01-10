//
//  NetworkController.swift
//  Representative2
//
//  Created by Chandi Abey  on 9/5/16.
//  Copyright © 2016 Chandi Abey . All rights reserved.
//

import Foundation


class NetworkController {
    
    enum HTTPMethod: String {
        case Get = "GET"
        case Put = "PUT"
        case Post = "POST"
        case Patch = "PATCH"
        case Delete = "DELETE"
    }
    
    static func performRequestForURL(_ url: URL, httpMethod: HTTPMethod, urlParameters: [String: String]? = nil, body: Data? = nil, completion: ((_ data: Data?, _ error: NSError?) -> Void)?) {
        let requestURL = urlFromURLParameters(url, urlParameters: urlParameters)
        
        let request = NSMutableURLRequest(url: requestURL)
        request.httpMethod = httpMethod.rawValue
        request.httpBody = body
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) in
            
            if let completion = completion {
                completion(data: data, error: error)
            }
        }) 
        
        dataTask.resume()
    }
    
    static func urlFromURLParameters(_ url: URL, urlParameters: [String: String]?) -> URL {
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        components?.queryItems = urlParameters?.flatMap({URLQueryItem(name: $0.0, value: $0.1)})
        
        if let url = components?.url {
            return url
        } else {
            fatalError("URL optional is nil")
        }
    }
}
