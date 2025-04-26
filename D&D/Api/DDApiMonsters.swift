//
//  DDApiMonsters.swift
//  D&D
//
//  Created by Alex Reynolds on 4/26/25.
//
import Foundation

extension DDApi {
    func fetchMonsters() async throws -> [DDMonster] {
        let paths = [
            DDApiURLEndpointPath(path: .monsters)
        ]
        
        let endpoint = DDApiURLEndpoint()
        let baseURL = endpoint.baseComponentsFor(paths: paths)
        let request = endpoint.makeRequest(components: baseURL, method: .get, queryItems: nil)
        
        let result = try await self.dataTask(request: request)
        
        do {
            let apiMonstersRepsponsee =  try JSONDecoder().decode(DDMonstersDataModel.self, from: result.data)
            if let results = apiMonstersRepsponsee.results {
                var monsters = [DDMonster]()
                for monster in results {
                    //name and url are required so if the api gave us bad data, let's ignore it
                    if let name = monster.name, let url = monster.url {
                        monsters.append(DDMonster(name: name, url: url, size: "", type: "", alignment: "", armorClass: [], hitPoints: 0, hitDice: "", hitPointsRoll: "", speed: [:], strength: 0, dexterity: 0, constitution: 0, intelligence: 0, wisdom: 0, charisma: 0))
                    }
                }
                return monsters
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
