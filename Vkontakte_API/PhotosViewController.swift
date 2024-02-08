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
        
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "PhotoCell")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "PhotoCell",
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
        CGSize(width: (view.frame.width / 2) - 10, height: 100)
    }
}

/// Проверка работоспособности веток
