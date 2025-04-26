//
//  DDMonsterArmorClass.swift
//  DND
//
//  Created by Alex Reynolds on 4/26/25.
//
import Foundation

class DDMonsterArmorClass: Codable {
    let type: String
    let value: Int
    
    init(type: String, value: Int) {
        self.type = type
        self.value = value
    }
}
