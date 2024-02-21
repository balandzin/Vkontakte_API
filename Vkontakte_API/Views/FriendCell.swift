//
//  FriendCell.swift
//  Vkontakte_API
//
//  Created by Антон Баландин on 7.02.24.
//

import UIKit

class FriendCell: UITableViewCell {
    
    private var friendImageView = UIImageView(image: UIImage(systemName: "person"))
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = .black
        return label
    }()
    
    private var onlineCircle: UIView = {
        let circle = UIView()
        circle.backgroundColor = .gray
        circle.layer.cornerRadius = 10
        return circle
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCell(friend: Friend) {
        nameLabel.text = "\(friend.firstName ?? "") \(friend.lastName ?? "")"
        if let online = friend.online {
            let isOnline = online
            if isOnline == 1 {
                onlineCircle.backgroundColor = .green
            } else {
                onlineCircle.backgroundColor = .red
            }
        }
        
        DispatchQueue.global().async {
            if let url = URL(string: friend.photo ?? ""), let data = try?
                Data(contentsOf: url) {
                
                DispatchQueue.main.async {
                    self.friendImageView.image = UIImage(data: data)
                }
            }
        }
    }
    
    private func setupViews() {
        contentView.addSubview(friendImageView)
        contentView.addSubview(nameLabel)
        friendImageView.addSubview(onlineCircle)
        
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        onlineCircle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            friendImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            friendImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            friendImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            friendImageView.widthAnchor.constraint(equalToConstant: 50),
            friendImageView.heightAnchor.constraint(equalToConstant: 50),
            
            nameLabel.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 16),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            onlineCircle.widthAnchor.constraint(equalToConstant: 20),
            onlineCircle.heightAnchor.constraint(equalToConstant: 20),
            onlineCircle.trailingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 10),
            onlineCircle.bottomAnchor.constraint(equalTo: friendImageView.bottomAnchor)
        ])
    }
}
