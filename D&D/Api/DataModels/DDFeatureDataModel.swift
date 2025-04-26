//
//  DDFeatureDataModel.swift
//  D&D
//
//  Created by Alex Reynolds on 4/26/25.
//
import Foundation

struct DDFeaturesDataModel: Codable {
    let count: Int?
    let results: [DDResourceDataModel]?
}
