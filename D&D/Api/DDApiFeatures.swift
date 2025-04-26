//
//  DDApiFeatures.swift
//  DND
//
//  Created by Alex Reynolds on 4/26/25.
//
import Foundation

extension DDApi {
    func fetchFeatures() async throws -> [DDFeature] {
        let paths = [
            DDApiURLEndpointPath(path: .features)
        ]
        
        let endpoint = DDApiURLEndpoint()
        let baseURL = endpoint.baseComponentsFor(paths: paths)
        let request = endpoint.makeRequest(components: baseURL, method: .get, queryItems: nil)
        
        let result = try await self.dataTask(request: request)
        
        do {
            let apiMonstersRepsponse =  try JSONDecoder().decode(DDFeaturesDataModel.self, from: result.data)
            if let results = apiMonstersRepsponse.results {
                var features = [DDFeature]()
                for feature in results {
                    //name and url are required so if the api gave us bad data, let's ignore it
                    if let name = feature.name, let url = feature.url {
                        features.append(DDFeature(name: name, url: url))
                    }
                }
                return features
            } else {
                return []//return empty sincee the UI doesn't need to know IMO
            }

        } catch {
            //make our own better error to bubble to UI
            let error = NSError(domain: "com.api.error", code: 500, userInfo: [NSLocalizedDescriptionKey:NSLocalizedString("Data format was invalid", comment: "api data format error")])
            throw error
        }
    }
}
