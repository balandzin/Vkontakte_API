//
//  SceneDelegate.swift
//  Vkontakte_API
//
//  Created by Антон Баландин on 7.02.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let navigationController = UINavigationController(rootViewController: LoginViewController())
        
        window = UIWindow(windowScene: scene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

