//
//  FriendsViewController.swift
//  Vkontakte_API
//
//  Created by Антон Баландин on 7.02.24.
//

import UIKit

class FriendsViewController: UITableViewController {
    
    private var friends: [Friend] = []
    
    private let networkService = NetworkService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Friends"
        
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        
        tableView.register(FriendCell.self, forCellReuseIdentifier: Constants.Identifier.groupCell)
        
        networkService.getFriends { [weak self] friends in
            self?.friends = friends
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.Identifier.groupCell,
            for: indexPath
        ) as? FriendCell else { return UITableViewCell() }
        
        cell.updateName(friend: friends[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
