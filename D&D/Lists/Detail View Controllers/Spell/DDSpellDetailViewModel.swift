//
//  DDMonsterDetailViewModel.swift
//  DND
//
//  Created by Alex Reynolds on 4/26/25.
//
import Foundation

class DDSpellDetailViewModel {
    var spell: DDSpell
    private let api = DDApi()
    init(spell: DDSpell) {
        self.spell = spell
    }
    
    func loadData() async throws {
        self.spell = try await self.api.fetchSpell(index: self.spell.index)
    }
}
