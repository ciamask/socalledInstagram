//
//  FriendlistView.swift
//  SocalledInstagram
//
//  Created by cia on 09/01/2021.
//

import UIKit

class FriendlistView: UIView, UITableViewDelegate, UITableViewDataSource {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let titleView: UILabel = {
        let title = UILabel()
        title.text = "FRIENDS"
        title.textAlignment = .center
        title.highlightedTextColor = .systemBlue
        title.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return title
    }()

    let line: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.lightGray
        return lineView
    }()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.tableFooterView = UIView()
        return table
    }()
    
    let data = FriendsData()
    
    private func setupUI() {
        addSubview(titleView)
        titleView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 20, bottom: 0, right: 10) )
        
        addSubview(line)
        line.anchor(top: titleView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 0))
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        addSubview(tableView)
        tableView.anchor(top: line.bottomAnchor, leading: leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: trailingAnchor, padding: .init(top: 4, left: 0, bottom: 4, right: 0))
    }
    
    private func setupTableView() {
        tableView.register(FriendsCell.self, forCellReuseIdentifier: FriendsCell.cellId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 80
    }
    
// MARK:- Tableview Stuffs

    
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
        
//        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            return 60
//        }
        
        //        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //            let model = data.getData()[indexPath.row]
        //            gotoVC(data: model)
        //        }
    


}


