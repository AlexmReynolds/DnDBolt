//
//  DDListSpellTableViewCell.swift
//  DND
//
//  Created by Alex Reynolds on 4/26/25.
//

import UIKit

class DDListSpellTableViewCell: UITableViewCell {
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        return label
    }()
    
    let levelLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(.required, for: .horizontal)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.levelLabel)
        let chevronImageView = UIImageView(image: UIImage(named: "chevron")?.withRenderingMode(.alwaysTemplate))
        chevronImageView.tintColor = .white
        self.accessoryView = chevronImageView
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.1, alpha: 1.0)
        self.backgroundView = view
        self.accessoryType = .disclosureIndicator
        self.nameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16.09).isActive = true
        self.nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16.0).isActive = true
        self.nameLabel.trailingAnchor.constraint(equalTo: self.levelLabel.leadingAnchor, constant: 16.0).isActive = true
        self.levelLabel.centerYAnchor.constraint(equalTo: self.nameLabel.centerYAnchor).isActive = true

        
        //make breakable to prevent constraint errors when cell is first created and frame has not been laid out
        let trailing = self.levelLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16.0)
        trailing.priority = UILayoutPriority(999)
        trailing.isActive = true
        
        let bottom = self.nameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16.0)
        bottom.priority = UILayoutPriority(999)
        bottom.isActive = true
    }
}
