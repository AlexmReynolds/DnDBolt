//
//  DDResourceDataModel.swift
//  D&D
//
//  Created by Alex Reynolds on 4/26/25.
//
import Foundation
struct DDResourceDataModel: Codable {
    let index: String?
    let name: String?
    let url: String?
}

struct DDResourceWithLevelDataModel: Codable {
    let index: String?
    let name: String?
    let url: String?
    let level: Int
}
