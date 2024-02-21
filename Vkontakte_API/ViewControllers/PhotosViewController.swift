//
//  PhotosViewController.swift
//  Vkontakte_API
//
//  Created by Антон Баландин on 7.02.24.
//

import UIKit

class PhotosViewController: UICollectionViewController {
    
    private let networkService = NetworkService.shared
    private var models: [Photo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photos"
        
        collectionView.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: Constants.Identifier.photoCell)
        
        networkService.getPhotos { [weak self] photos in
            self?.models = photos
            
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.Identifier.photoCell,
            for: indexPath
        ) as? PhotoCell else { return UICollectionViewCell() }
        
        cell.updateCell(photo: models[indexPath.row])
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
        return CGSize(width: cellSize, height: cellSize - 30)
    }
}

