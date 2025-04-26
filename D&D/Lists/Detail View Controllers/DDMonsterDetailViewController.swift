//
//  DDMonsterDetailViewController.swift
//  DND
//
//  Created by Alex Reynolds on 4/26/25.
//
import UIKit

class DDMonsterDetailViewController: UIViewController {
    let viewModel: DDMonsterDetailViewModel
    var castView: DDMonsterDetailView! //easier to talk to later vs casting self.view all the time
    
    init(viewModel: DDMonsterDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.viewModel.monster.name
        Task { @MainActor in
            do {
                try await self.viewModel.loadData()
                self.castView.load(monster: self.viewModel.monster)
            } catch {
                //TODO: Show Error in ui
            }
        }
    }

    override func loadView() {
        let view = DDMonsterDetailView()
        view.load(monster: self.viewModel.monster)
        self.castView = view
        self.view = view
    }
}
