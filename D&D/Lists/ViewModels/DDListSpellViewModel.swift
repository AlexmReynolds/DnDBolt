//
//  DDListSpellViewModel.swift
//  DND
//
//  Created by Alex Reynolds on 4/26/25.
//

import UIKit

class DDListSpellViewModel: DDListViewModel {
    var spells = [DDSpell]()
    override init() {
        super.init()
        self.title = "Spells"
    }
    override func loadData() async throws {
        self.spells = self.dataService.getSpells()
        if self.spells.isEmpty {
            let api = DDApi()
            self.spells = try await api.fetchSpells()
            self.dataService.saveSpells(self.spells)
        }
    }
    
    override func detailController(at indexPath: IndexPath) -> UIViewController {
        let selected = self.spells[indexPath.row]
        return DDSpellDetailViewController(viewModel: DDSpellDetailViewModel(spell: selected))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.spells.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "spellCell") as? DDListSpellTableViewCell else {
            return UITableViewCell()
        }
        let spell = self.spells[indexPath.row]
        cell.nameLabel.text = spell.name
        cell.levelLabel.text = "Lvl: \(spell.level)"
        return cell
    }
}
