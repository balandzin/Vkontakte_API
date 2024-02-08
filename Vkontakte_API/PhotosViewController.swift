//
//  PhotosViewController.swift
//  Vkontakte_API
//
//  Created by Антон Баландин on 7.02.24.
//

import UIKit

class PhotosViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photos"
        
        collectionView.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: Constants.Identifier.groupCell)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.Identifier.groupCell,
            for: indexPath
        ) as? PhotoCell else { return UICollectionViewCell() }
        
        return cell
    }
}


/// Задаем размеры фото относительно ширины экрана
extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = UIScreen.main.bounds.width
        let cellSize = width / 2 - 20
        return CGSize(width: cellSize, height: cellSize)
    }
}

