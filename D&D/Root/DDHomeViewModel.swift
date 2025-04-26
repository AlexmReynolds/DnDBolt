//
//  DDHomeViewModel.swift
//  D&D
//
//  Created by Alex Reynolds on 4/26/25.
//
import UIKit

class DDHomeViewModel: NSObject {
    let rows = ["Classes", "Monsters", "Spells", "Features"]//for now we assume it's always Classes, Spells, Monsters and Features
}

extension DDHomeViewModel: UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? DDHomeViewTableViewCell else {
            return UITableViewCell()
        }
        
        if self.rows.count > indexPath.row {//add safety
            let rowName = self.rows[indexPath.row]
            cell.label.text = rowName
        }
        return cell
    }
}
