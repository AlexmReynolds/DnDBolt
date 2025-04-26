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
    init(name: String, url: String, level: Int) {
        self.name = name
        self.url = url
        self.level = level
    }
}
