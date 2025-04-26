//
//  DDMonsterDetailView.swift
//  DND
//
//  Created by Alex Reynolds on 4/26/25.
//
import UIKit

class DDMonsterDetailView: UIView {
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 0
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        return label
    }()
    
    let sizeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.setContentHuggingPriority(.required, for: .horizontal)
        return label
    }()
    
    let alignmentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.setContentHuggingPriority(.required, for: .horizontal)
        return label
    }()
    
    let typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.setContentHuggingPriority(.required, for: .horizontal)
        return label
    }()
    
    let hitDiceLabel: UILabel = {
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
        stack.addArrangedSubview(self.sizeLabel)
        stack.addArrangedSubview(self.typeLabel)
        stack.addArrangedSubview(self.alignmentLabel)
        stack.addArrangedSubview(self.hitDiceLabel)
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
    
    func load(monster: DDMonster) {
        //TODO: use localized strings not these hardcoded ones
        self.sizeLabel.text = "Size: " + monster.size
        self.nameLabel.text = "Name: " + monster.name
        self.alignmentLabel.text = "Alignment: " + monster.alignment
        self.typeLabel.text = "Type: " + monster.type
        self.hitDiceLabel.text = "Hit Dice: " + monster.hitDice

    }
}
