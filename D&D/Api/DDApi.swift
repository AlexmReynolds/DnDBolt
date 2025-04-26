//
//  DDApi.swift
//  D&D
//
//  Created by Alex Reynolds on 4/26/25.
//

import Foundation

class DDApi {
    
    func dataTask(request: URLRequest) async throws -> (data: Data, response: HTTPURLResponse) {
        return try await withCheckedThrowingContinuation { continuation in
            URLSession.shared.dataTask(with: request) { (data, response, error) -> Void in
                //TODO: Here we can do any common api processing like validating auth token or getting a refresh token etc.
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let data = data, let response = response as? HTTPURLResponse {
                    return continuation.resume(returning: (data: data, response: response))
                } else {
                    let error = NSError(domain: "com.api.error", code: 500, userInfo: [NSLocalizedDescriptionKey:NSLocalizedString("Data or response were invaldid", comment: "api error")])
                    continuation.resume(throwing: error)
                }
            }.resume()
        }
    }
}
