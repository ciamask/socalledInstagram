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
        observeEvents()
    }
    
    let currentview = FriendlistView()
    var data = FriendsData() {
        didSet {
            currentview.tableView.reloadData()
        }
    }
    
    lazy var originalData = data.getData()
    
    override func loadView() {
        view = currentview
    }
    
    func observeEvents() {
        currentview.issearchFieldedited = { [weak self] (searchText) in
            guard let self = self else { return }
            self.filterSearchData(searchText: searchText)
        }
    }
    
    private func filterSearchData(searchText: String) {
        
//        var tempFilteredData = [FriendsModel]()
        
        let tempFilteredData = originalData.filter({ $0.friendsName.contains(searchText) })
        searchText.isEmpty ? data.setData(friendsArray: originalData) : data.setData(friendsArray: tempFilteredData)
//
//        for value in originalData {
//            let name = value.friendsName
//            let doesContain = name.contains(searchText)
//            if doesContain {
//                tempFilteredData.append(value)
//            }
//            if searchText.isEmpty {
//                data.setData(friendsArray: originalData)
//            } else {
//                data.setData(friendsArray: tempFilteredData)
//            }
//        }
//        currentview.tableView.reloadData()
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
