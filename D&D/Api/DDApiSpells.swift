//
//  DDApiSpells.swift
//  DND
//
//  Created by Alex Reynolds on 4/26/25.
//

import Foundation

extension DDApi {
    func fetchSpells() async throws -> [DDSpell] {
        let paths = [
            DDApiURLEndpointPath(path: .spells)
        ]
        
        let endpoint = DDApiURLEndpoint()
        let baseURL = endpoint.baseComponentsFor(paths: paths)
        let request = endpoint.makeRequest(components: baseURL, method: .get, queryItems: nil)
        
        let result = try await self.dataTask(request: request)
        
        do {
            let apiMonstersRepsponse =  try JSONDecoder().decode(DDSpellsDataModel.self, from: result.data)
            if let results = apiMonstersRepsponse.results {
                var spells = [DDSpell]()
                for spell in results {
                    //name and url are required so if the api gave us bad data, let's ignore it
                    if let name = spell.name, let url = spell.url {
                        spells.append(DDSpell(name: name, url: url))
                    }
                }
                return spells
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
