//
//  DDSpellDetailViewController.swift
//  DND
//
//  Created by Alex Reynolds on 4/26/25.
//
import UIKit

class DDSpellDetailViewController: UIViewController {
    let viewModel: DDSpellDetailViewModel
    var castView: DDSpellDetailView! //easier to talk to later vs casting self.view all the time
    
    init(viewModel: DDSpellDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.viewModel.spell.name
        Task { @MainActor in
            do {
                try await self.viewModel.loadData()
                self.castView.load(spell: self.viewModel.spell)
            } catch {
                //TODO: Show Error in ui
            }
        }
    }

    override func loadView() {
        let view = DDSpellDetailView()
        view.load(spell: self.viewModel.spell)
        self.castView = view
        self.view = view
    }
}
