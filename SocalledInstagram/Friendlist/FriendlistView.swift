//
//  FriendlistView.swift
//  SocalledInstagram
//
//  Created by cia on 09/01/2021.
//

import UIKit

class FriendlistView: UIView{
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var issearchFieldedited: ((String) -> Void)?
    var data = FriendsData()
    
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
    
    let searchField: UISearchTextField = {
        let field = UISearchTextField()
        field.placeholder = "Search friends"
        field.addTarget(self, action: #selector(handleSearchField), for: .editingChanged)
        return field
    }()
    
    private func setupUI() {
        addSubview(titleView)
        titleView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 20, bottom: 0, right: 10) )
        
        addSubview(searchField)
        searchField.anchor(top: titleView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 8, left: 20, bottom: 0, right: 20))
        searchField.constraintHeight(constant: 40)
        
        addSubview(line)
        line.anchor(top: searchField.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 0))
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        addSubview(tableView)
        tableView.anchor(top: line.bottomAnchor, leading: leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: trailingAnchor, padding: .init(top: 4, left: 0, bottom: 4, right: 0))
    }
    
    @objc func handleSearchField() {
//        print(searchField.text)
        issearchFieldedited?(searchField.text ?? "")
//        let filteredData = [FriendsModel]()
//        let searchText = searchField.text ?? ""
//        let totalCellnumber = data.getData()
//        for (_,num) in totalCellnumber.enumerated(){
//            let doesContainText = num.friendsName.contains(searchText)
//            print(doesContainText)
//            if doesContainText == true{
//                  filteredData.append(FriendsModel(profileImage: #imageLiteral(resourceName: "Puppy"), friendsName: "Shreeya Maskey", friendsDetails: "jbsjah bkab bdkjbd kedbkwjqb dbwkd iudhbiuqwhdiuh udbi", isfavourite: true))
//            }else{
//                //
//            }
            
//        }
//            let model = data.getData()[indexPath.row]
//        let doesContainText = name.contains(searchText)
//        print("Does Contain? ", doesContainText)
    }
    
}


