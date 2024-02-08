//
//  FriendCell.swift
//  Vkontakte_API
//
//  Created by Антон Баландин on 7.02.24.
//

import UIKit

class FriendCell: UITableViewCell {
    
    private let friendImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 25
        imageView.backgroundColor = .purple
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(friendImageView)
        contentView.addSubview(nameLabel)
        
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            friendImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            friendImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            friendImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            friendImageView.widthAnchor.constraint(equalToConstant: 50),
            friendImageView.heightAnchor.constraint(equalToConstant: 50),
            
            nameLabel.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 16),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
