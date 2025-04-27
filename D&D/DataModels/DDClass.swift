//
//  DDClass.swift
//  DND
//
//  Created by Alex Reynolds on 4/26/25.
//
import Foundation

class DDClass: Codable {
    let name: String
    let url: String
    let index: String
    init(name: String, url: String, index: String) {
        self.name = name
        self.url = url
        self.index = index
    }
}
