//
//  DDSpell.swift
//  DND
//
//  Created by Alex Reynolds on 4/26/25.
//

import Foundation
class DDSpell: Codable {
    let name: String
    let url: String
    let level: Int
    let index: String
    let desc: [String]
    let range: String
    let duration: String
    let castingTime: String
    
    init(name: String, url: String, index: String, level: Int, desc: [String], range: String, duration: String, castingTime: String) {
        self.name = name
        self.url = url
        self.index = index
        self.level = level
        self.desc = desc
        self.range = range
        self.duration = duration
        self.castingTime = castingTime

    }
}
