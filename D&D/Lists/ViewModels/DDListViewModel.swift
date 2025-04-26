//
//  DDListViewModel.swift
//  D&D
//
//  Created by Alex Reynolds on 4/26/25.
//

import UIKit


class DDListViewModel: NSObject {
    var title: String = ""
    var dataService = DDDataService()

    func loadData() async throws {
        //override in subclass
    }
    
    func detailController() -> UIViewController {//TODO: Override in subclass
        return UIViewController()
    }
    
    //simple factory
    class func model(for name: String) -> DDListViewModel {
        switch name {
        case "Monsters":
            return DDListMonsterViewModel()
        case "Spells":
            return DDListSpellViewModel()
        case "Features":
            return DDListFeatureViewModel()
        case "Classes":
            return DDListClassViewModel()
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
