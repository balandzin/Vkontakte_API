//
//  GroupsCell.swift
//  Vkontakte_API
//
//  Created by Антон Баландин on 8.02.24.
//

import UIKit

class GroupCell: UITableViewCell {
    
    private let groupImageView = UIImageView(image: UIImage(systemName: "person"))
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.numberOfLines = 1
        label.textColor = .black
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.numberOfLines = 1
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCell(group: Group) {
        nameLabel.text = "\(group.name ?? "")"
        descriptionLabel.text = group.description
        
        DispatchQueue.global().async {
            if let url = URL(string: group.photo ?? ""), let data = try? Data(contentsOf: url) {
                
                DispatchQueue.main.async {
                    self.groupImageView.image = UIImage(data: data)
                }
            }
        }
    }
    
    private func setupViews() {
        contentView.addSubview(groupImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        groupImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            groupImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            groupImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            groupImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            groupImageView.widthAnchor.constraint(equalToConstant: 50),
            groupImageView.heightAnchor.constraint(equalToConstant: 50),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: groupImageView.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            descriptionLabel.leadingAnchor.constraint(equalTo: groupImageView.trailingAnchor, constant: 16)
        ])
    }
}
