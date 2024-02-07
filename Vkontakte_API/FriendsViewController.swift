//
//  FriendsViewController.swift
//  Vkontakte_API
//
//  Created by Антон Баландин on 7.02.24.
//

import UIKit

class FriendsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Friends"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        FriendCell()
    }
}
