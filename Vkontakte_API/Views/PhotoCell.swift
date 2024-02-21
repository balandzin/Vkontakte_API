//
//  PhotoCell.swift
//  Vkontakte_API
//
//  Created by Антон Баландин on 8.02.24.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    private let photoImageView = UIImageView()
    
    override init (frame: CGRect) {
        super.init (frame: frame)
        setupViews ()
    }
    
    required init?(coder: NSCoder) {
        fatalError ("init (coder:) has not been implemented")
        
    }
    
    func updateCell(photo: Photo) {
        DispatchQueue.global().async {
            if let url = URL(string: photo.sizes.first?.url ?? ""), let data = try? Data(contentsOf: url) {
                
                DispatchQueue.main.async {
                    self.photoImageView.image = UIImage(data: data)
                }
            }
        }
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
