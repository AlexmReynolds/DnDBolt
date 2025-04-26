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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.spells.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? DDHomeViewTableViewCell else {
            return UITableViewCell()
        }
        cell.label.text = self.spells[indexPath.row].name
        return cell
    }
}
