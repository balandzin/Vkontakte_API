//
//  ViewController.swift
//  Vkontakte_API
//
//  Created by Антон Баландин on 7.02.24.
//

import UIKit
import WebKit

class LoginViewController: UIViewController {
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: view.bounds)
        webView.navigationDelegate = self
        return webView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(webView)
        setupViews()
        
        let url = URL(string: "https://oauth.vk.com/authorize?client_id=51726827&redirect_uri=https://oauth.vk.com/blank.html&scope=262150&display=mobile&response_type=token")
        
        guard let url = url else { return }
        webView.load(URLRequest(url: url))
    }
    
    private func setupViews() {
        setupConstraints()
    }
    
    private func setupConstraints() {
        
    }
    
    /// При нажатии на кнопку ВОЙТИ создается tabBarController, где каждый VC
    /// находится в NavigationController
    private func enterAction() {
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
        ///(т.е. переназначить корневой контроллер приложения)
        guard let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let firstWindow = firstScene.windows.first else {
            return
        }
        
        firstWindow.rootViewController = tabBarController
    }
}

extension LoginViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        NetworkService.token = params["access_token"]!
        NetworkService.userID = params["user_id"]!
        decisionHandler(.cancel)
        webView.removeFromSuperview()
        enterAction()
    }
}

