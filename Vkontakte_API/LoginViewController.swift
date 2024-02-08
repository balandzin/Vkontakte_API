//
//  ViewController.swift
//  Vkontakte_API
//
//  Created by Антон Баландин on 7.02.24.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        
        button.addTarget(self, action: #selector(enterAction), for: .touchUpInside)
    }
    
    private func setupViews() {
        view.addSubview(button)
        setupConstraints()
    }
    
    private func setupConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }
    
    /// При нажатии на кнопку ВОЙТИ создается tabBarController, где каждый VC
    /// находится в NavigationController
    @objc private func enterAction() {
        let tabBarController = UITabBarController()
        
        let friendsViewController = UINavigationController(rootViewController: FriendsViewController())
        let groupsViewController = UINavigationController(rootViewController: GroupsViewController())
        let photosViewController = UINavigationController(rootViewController: PhotosViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        let controllers = [friendsViewController, groupsViewController, photosViewController]
        for controller in controllers {
            controller.tabBarItem.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 25.0, weight: .regular)], for: .normal)
        }
        
        tabBarController.viewControllers = controllers
        
        friendsViewController.tabBarItem = UITabBarItem(title: "Friends", image: UIImage(systemName: "person.3.fill"), tag: 0)
        groupsViewController.tabBarItem = UITabBarItem(title: "Groups", image: UIImage(systemName: "person.2.fill"), tag: 1)
        photosViewController.tabBarItem = UITabBarItem(title: "Photos", image: UIImage(systemName: "photo"), tag: 2)
        
        //navigationController?.pushViewController(tabBarController, animated: true)
        
        ///После перехода уже невозможно будет перейти назад на LoginViewController
        guard let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let firstWindow = firstScene.windows.first else {
            return
        }
        
        firstWindow.rootViewController = tabBarController
    }
}

