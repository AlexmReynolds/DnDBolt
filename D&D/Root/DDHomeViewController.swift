//
//  DDHomeViewController.swift
//  D&D
//
//  Created by Alex Reynolds on 4/26/25.
//

import UIKit

class DDHomeViewController: UIViewController {
    let viewModel = DDHomeViewModel()
    var castView: DDHomeView! //easier to talk to later vs casting self.view all the time
    override func viewDidLoad() {
        super.viewDidLoad()
        print("VCTTT")
        // Do any additional setup after loading the view.
    }

    override func loadView() {
        let view = DDHomeView()
        self.castView = view
        view.tableView.dataSource = self.viewModel
        self.view = view
    }
}

extension DDHomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        let rowName = self.viewModel.rows[indexPath.row]
        let vm = DDListViewModel.model(for: rowName)
        let vc = DDListViewController(viewModel: vm)
        self.navigationController?.pushViewController(vc, animated: true)
        print("row \(rowName)")
    }
}

