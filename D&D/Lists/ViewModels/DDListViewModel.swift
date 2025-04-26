//
//  DDListViewModel.swift
//  D&D
//
//  Created by Alex Reynolds on 4/26/25.
//

import UIKit


class DDListViewModel: NSObject {
    var title: String = ""
    
    func loadData() async throws {

    }
    
    func detailController() -> UIViewController {//TODO: Override in child models
        return UIViewController()
    }
    
    //simple factory
    class func model(for name: String) -> DDListViewModel {
        switch name {
        case "monsters":
            return DDListMonsterViewModel()
        default:
            return DDListViewModel()
        }
    }
}

extension DDListViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? DDHomeViewTableViewCell else {
            return UITableViewCell()
        }

        return cell
    }
}
