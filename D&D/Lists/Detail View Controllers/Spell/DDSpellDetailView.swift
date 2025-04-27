//
//  DDSpellDetailView.swift
//  DND
//
//  Created by Alex Reynolds on 4/26/25.
//
import UIKit

class DDSpellDetailView: UIView {
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 0
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.setContentHuggingPriority(.required, for: .horizontal)
        return label
    }()
    
    let levelLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.setContentHuggingPriority(.required, for: .horizontal)
        return label
    }()
    
    let rangeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.setContentHuggingPriority(.required, for: .horizontal)
        return label
    }()
    
    let durationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.setContentHuggingPriority(.required, for: .horizontal)
        return label
    }()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8.0
        stack.addArrangedSubview(self.nameLabel)
        stack.addArrangedSubview(self.levelLabel)
        stack.addArrangedSubview(self.descriptionLabel)
        stack.addArrangedSubview(self.rangeLabel)
        stack.addArrangedSubview(self.durationLabel)
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(white: 0.2, alpha: 1.0)
        self.addSubview(self.stack)
        self.stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0).isActive = true
        self.stack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        self.stack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16.0).isActive = true
        self.stack.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func load(spell: DDSpell) {
        //TODO: use localized strings not these hardcoded ones
        self.rangeLabel.text = "Range: " + spell.range
        self.nameLabel.text = "Name: " + spell.name
        self.descriptionLabel.text = "Description: " + spell.desc.joined(separator: " ")
        self.levelLabel.text = "Level: \(spell.level)"
        self.durationLabel.text = "Duration: \(spell.duration)"

    }
}
