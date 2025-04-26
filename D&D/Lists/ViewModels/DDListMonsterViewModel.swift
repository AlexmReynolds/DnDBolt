//
//  DDListMonsterViewModel.swift
//  D&D
//
//  Created by Alex Reynolds on 4/26/25.
//
import UIKit

class DDListMonsterViewModel: DDListViewModel {
    var monsters = [DDMonster]()
    override init() {
        super.init()
        self.title = "Monsters"
    }
    override func loadData() async throws {
        let api = DDApi()
        self.monsters = try await api.fetchMonsters()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.monsters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? DDHomeViewTableViewCell else {
            return UITableViewCell()
        }
        cell.label.text = self.monsters[indexPath.row].name
        return cell
    }
}
