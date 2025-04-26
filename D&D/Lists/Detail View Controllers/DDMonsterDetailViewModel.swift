//
//  DDMonsterDetailViewModel.swift
//  DND
//
//  Created by Alex Reynolds on 4/26/25.
//
import Foundation

class DDMonsterDetailViewModel {
    var monster: DDMonster
    private let api = DDApi()
    init(monster: DDMonster) {
        self.monster = monster
    }
    
    func loadData() async throws {
        self.monster = try await self.api.fetchMonster(name: self.monster.name)
    }
}
