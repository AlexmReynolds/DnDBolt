//
//  DDMonsterDataModel.swift
//  D&D
//
//  Created by Alex Reynolds on 4/26/25.
//
import Foundation

struct DDMonsterDataModel: Codable {
    
}

struct DDMonstersDataModel: Codable {
    let count: Int?
    let results: [DDResourceDataModel]?
}
