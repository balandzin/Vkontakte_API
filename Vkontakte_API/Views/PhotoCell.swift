//
//  PhotoCell.swift
//  Vkontakte_API
//
//  Created by Антон Баландин on 8.02.24.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    private let photoImageView = UIImageView(image: UIImage(systemName: "person"))
    
    override init (frame: CGRect) {
        super.init (frame: frame)
        setupViews ()
    }
    
    required init?(coder: NSCoder) {
        fatalError ("init (coder:) has not been implemented")
        
    }
    
    private func setupViews () {
        addSubview(photoImageView)
        setupConstraints ()
    }
    
    private func setupConstraints() {
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            photoImageView.topAnchor.constraint (equalTo: topAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    /// Данный метод переопределяется, если мы хотим переиспользовать ячейку
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
}
