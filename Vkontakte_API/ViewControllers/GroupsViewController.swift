//
//  GroupsViewController.swift
//  Vkontakte_API
//
//  Created by Антон Баландин on 7.02.24.
//

import UIKit

class GroupsViewController: UITableViewController {
    
    private var groups: [Group] = []
    
    private let networkService = NetworkService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Groups"
        
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        
        tableView.register(GroupCell.self, forCellReuseIdentifier: Constants.Identifier.groupCell )
        
        networkService.getGroups { [weak self] groups in
            self?.groups = groups
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifier.groupCell, for: indexPath) as? GroupCell else { return UITableViewCell() }
        
        cell.updateName(group: groups[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
