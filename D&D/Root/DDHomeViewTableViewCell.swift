//
//  DDHomeViewTableViewCell.swift
//  D&D
//
//  Created by Alex Reynolds on 4/26/25.
//
import UIKit

class DDHomeViewTableViewCell: UITableViewCell {
    let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
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
        self.contentView.addSubview(self.label)
        self.backgroundView = UIView()
        self.accessoryType = .detailDisclosureButton
        self.label.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        self.label.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true

        //make breakable to prevent constraint errors when cell is first created and frame has not been laid out
        let trailing = self.label.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        trailing.priority = UILayoutPriority(999)
        trailing.isActive = true
        
        let bottom = self.label.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        bottom.priority = UILayoutPriority(999)
        bottom.isActive = true
    }
}
