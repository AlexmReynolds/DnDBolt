//
//  DDClassWebObject.swift
//  D&D
//
//  Created by Alex Reynolds on 4/26/25.
//
import Foundation

struct DDClassWebObject: Codable {
    
}
struct DDClassesDataModel: Codable {
    let count: Int?
    let results: [DDResourceWithLevelDataModel]?
}
