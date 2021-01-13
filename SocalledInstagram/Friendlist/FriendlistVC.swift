//
//  FriendlistVC.swift
//  SocalledInstagram
//
//  Created by cia on 09/01/2021.
//

import UIKit

class FriendlistVC: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupTableView()
    }
    
    let currentview = FriendlistView()
    let data = FriendsData()
    
    override func loadView() {
        view = currentview
    }
    
    private func setupTableView() {
        currentview.tableView.register(FriendsCell.self, forCellReuseIdentifier: FriendsCell.cellId)
        currentview.tableView.delegate = self
        currentview.tableView.dataSource = self
        currentview.tableView.estimatedRowHeight = 90
    }
    
}

// MARK:- Tableview Stuffs

extension FriendlistVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.getData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendsCell.cellId, for: indexPath) as! FriendsCell
        let model = data.getData()[indexPath.row]
        cell.configureCell(with: model)
//            cell.accessoryType = .checkmark
        //        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            return 60
        UITableView.automaticDimension
    }

    //        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //            let model = data.getData()[indexPath.row]
    //            gotoVC(data: model)
    //        }

    
}
