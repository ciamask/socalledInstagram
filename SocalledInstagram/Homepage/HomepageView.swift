//
//  HomepageView.swift
//  SocalledInstagram
//
//  Created by cia on 10/01/2021.
//

import UIKit

class HomepageView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let tableView: UITableView = {
        let table = UITableView()
        table.tableFooterView = UIView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let storyCollection: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.backgroundColor = .white
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    let data = PostData()
    
    private func setupUI() {
        addSubview(storyCollection)
        storyCollection.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 4, left: 0, bottom: 0, right: 0))
        storyCollection.constraintHeight(constant: 70)
        
        addSubview(tableView)
        tableView.anchor(top: storyCollection.bottomAnchor, leading: leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: trailingAnchor, padding: .init(top: 4, left: 0, bottom: 0, right: 0))
    }
    
    private func setupTableView() {
        tableView.register(PostCell.self, forCellReuseIdentifier: PostCell.cellId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 800
    }

    // MARK:- Tableview Stuffs

    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data.getData().count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.cellId, for: indexPath) as! PostCell
            let model = data.getData()[indexPath.row]
            cell.configureCell(with: model)
    //        cell.selectionStyle = .none
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            return 500
                        return UITableView.automaticDimension
        }
    

}
