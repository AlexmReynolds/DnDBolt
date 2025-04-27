//
//  DDSpellDataModel.swift
//  D&D
//
//  Created by Alex Reynolds on 4/26/25.
//

import Foundation

struct DDSpellDataModel: Codable {
    let name: String?
    let index: String?
    let url: String?
    let desc: [String]?
    let range: String?
    let duration: String?
    let level: Int?
    let casting_time: String?
}

struct DDSpellsDataModel: Codable {
    let count: Int?
    let results: [DDResourceWithLevelDataModel]?
}
