//
//  DDMonster.swift
//  D&D
//
//  Created by Alex Reynolds on 4/26/25.
//
import Foundation

class DDMonster: Codable {
    let name: String
    let url: String
    let size: String
    let type: String
    let alignment: String
    let armorClass: [DDMonsterArmorClass]
    let hitPoints: Int
    let hitDice: String
    let hitPointsRoll: String
    let speed: [Speed:String]
    let strength: Int
    let dexterity: Int
    let constitution: Int
    let intelligence: Int
    let wisdom: Int
    let charisma: Int
    enum Speed: String, Codable {
        case walk
        case swim
    }
    init(name: String, url: String, size: String, type: String, alignment: String, armorClass: [DDMonsterArmorClass], hitPoints: Int, hitDice: String, hitPointsRoll: String, speed: [Speed:String], strength: Int, dexterity: Int, constitution: Int, intelligence: Int, wisdom: Int, charisma: Int) {
        self.name = name
        self.url = url
        self.size = size
        self.type = type
        self.alignment = alignment
        self.armorClass = armorClass
        self.hitPoints = hitPoints
        self.hitDice = hitDice
        self.hitPointsRoll = hitPointsRoll
        self.speed = speed
        self.strength = strength
        self.dexterity = dexterity
        self.constitution = constitution
        self.intelligence = intelligence
        self.wisdom = wisdom
        self.charisma = charisma
    }
}
