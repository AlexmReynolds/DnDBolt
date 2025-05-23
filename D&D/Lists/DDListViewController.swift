//
//  DDListViewController.swift
//  D&D
//
//  Created by Alex Reynolds on 4/26/25.
//

import UIKit

class DDListViewController: UIViewController {
    let viewModel: DDListViewModel
    var castView: DDListView! //easier to talk to later vs casting self.view all the time
    
    init(viewModel: DDListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.viewModel.title
        Task { @MainActor in
            do {
                try await self.viewModel.loadData()
                self.castView.tableView.reloadData()
            } catch {
                //TODO: Show Error in ui
            }
        }
    }

    override func loadView() {
        let view = DDListView()
        self.castView = view
        view.tableView.dataSource = self.viewModel
        view.tableView.delegate = self
        self.view = view
    }
}

extension DDListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        let vc = self.viewModel.detailController(at: indexPath)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
