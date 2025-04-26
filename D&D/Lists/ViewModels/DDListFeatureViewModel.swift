//
//  DDListFeatureViewModel.swift
//  DND
//
//  Created by Alex Reynolds on 4/26/25.
//
import UIKit

class DDListFeatureViewModel: DDListViewModel {
    var features = [DDFeature]()
    override init() {
        super.init()
        self.title = "Features"
    }
    override func loadData() async throws {
        let api = DDApi()
        self.features = try await api.fetchFeatures()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.features.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? DDHomeViewTableViewCell else {
            return UITableViewCell()
        }
        cell.label.text = self.features[indexPath.row].name
        return cell
    }
}
