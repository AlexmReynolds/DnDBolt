//
//  DDListClassViewModel.swift
//  DND
//
//  Created by Alex Reynolds on 4/26/25.
//
import UIKit

class DDListClassViewModel: DDListViewModel {
    var classes = [DDClass]()
    override init() {
        super.init()
        self.title = "Classes"
    }
    override func loadData() async throws {
        let api = DDApi()
        self.classes = try await api.fetchClasses()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.classes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? DDHomeViewTableViewCell else {
            return UITableViewCell()
        }
        cell.label.text = self.classes[indexPath.row].name
        return cell
    }
}
