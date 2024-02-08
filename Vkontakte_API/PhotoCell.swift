//
//  PhotoCell.swift
//  Vkontakte_API
//
//  Created by Антон Баландин on 8.02.24.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    private let photoImageView: UIImageView = {
        let photo = UIImageView()
        photo.backgroundColor = .green
        
        return photo
    }()
    
    override init (frame: CGRect) {
        super.init (frame: frame)
        setupViews ()
    }
    
    required init?(coder: NSCoder) {
        fatalError ("init (coder:) has not been implemented")
        
    }
    
    private func setupViews () {
        addSubview (photoImageView)
        setupConstraints ()
    }
    
    private func setupConstraints() {
        photoImageView.translatesAutoresizingMaskIntoConstraints=false
        
        NSLayoutConstraint.activate([
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            photoImageView.topAnchor.constraint (equalTo: topAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
