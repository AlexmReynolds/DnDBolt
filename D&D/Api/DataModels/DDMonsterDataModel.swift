//
//  DDMonsterDataModel.swift
//  D&D
//
//  Created by Alex Reynolds on 4/26/25.
//
import Foundation
//prefer optionals so a change in the api will not crash apps
struct DDMonsterDataModel: Codable {
    let name: String?
    let url: String?
    let index: String?
    let size: String?
    let type: String?
    let alignment: String?
    let armor_class: [DDMonsterArmorClass]?
    let hit_points: Int?
    let hit_dice: String?
    let hit_points_roll: String?
    let speed: [String: String]?
    let strength: Int?
    let dexterity: Int?
    let constitution: Int?
    let intelligence: Int?
    let wisdom: Int?
    let charisma: Int?
    let image: String?
}

struct DDMonstersDataModel: Codable {
    let count: Int?
    let results: [DDResourceDataModel]?
}
