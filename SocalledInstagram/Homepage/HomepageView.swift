//
//  HomepageView.swift
//  SocalledInstagram
//
//  Created by cia on 10/01/2021.
//

import UIKit

class HomepageView: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
//        setupTableView()
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
    
    private func setupUI() {
        addSubview(storyCollection)
        storyCollection.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 4, left: 0, bottom: 0, right: 0))
        storyCollection.constraintHeight(constant: 70)
        
        addSubview(tableView)
        tableView.anchor(top: storyCollection.bottomAnchor, leading: leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: trailingAnchor, padding: .init(top: 4, left: 0, bottom: 0, right: 0))
    }

}
