//
//  DDDataService.swift
//  DND
//
//  Created by Alex Reynolds on 4/26/25.
//
import Foundation

//TODO: Yes all these methods are basically the same. We could make 1-2 single methods that pass in a abstracted array etc. Also in a production app we would probably cache in CoreData vs userdefaults. Also we would probably break dataservice in to a bunch of smaller files since having all the methods here will get large
class DDDataService {
    func getSpells() -> [DDSpell] {
        let decoder = JSONDecoder()
        guard let data = UserDefaults.standard.object(forKey: "spells") as? Data else {
            return []
        }
        if let result = try? decoder.decode([DDSpell].self, from: data) {
            return result
        } else {
            return []
        }
    }
    
    func saveSpells(_ spells: [DDSpell]) {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(spells) {
            UserDefaults.standard.set(data, forKey: "spells")
        }
    }
    
    func getMonsters() -> [DDMonster] {
        let decoder = JSONDecoder()
        guard let data = UserDefaults.standard.object(forKey: "monsters") as? Data else {
            return []
        }
        if let result = try? decoder.decode([DDMonster].self, from: data) {
            return result
        } else {
            return []
        }
    }
    
    func saveMonsters(_ monsters: [DDMonster]) {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(monsters) {
            UserDefaults.standard.set(data, forKey: "monsters")
        }
    }
    
    func getFeatures() -> [DDFeature] {
        let decoder = JSONDecoder()
        guard let data = UserDefaults.standard.object(forKey: "features") as? Data else {
            return []
        }
        if let result = try? decoder.decode([DDFeature].self, from: data) {
            return result
        } else {
            return []
        }
    }
    
    func saveFeatures(_ features: [DDFeature]) {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(features) {
            UserDefaults.standard.set(data, forKey: "features")
        }
    }
    
    func getClasses() -> [DDClass] {
        let decoder = JSONDecoder()
        guard let data = UserDefaults.standard.object(forKey: "classes") as? Data else {
            return []
        }
        if let result = try? decoder.decode([DDClass].self, from: data) {
            return result
        } else {
            return []
        }
    }
    
    func saveClasses(_ classes: [DDClass]) {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(classes) {
            UserDefaults.standard.set(data, forKey: "classes")
        }
    }
}
