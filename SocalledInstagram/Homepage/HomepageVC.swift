//
//  HomepageVC.swift
//  SocalledInstagram
//
//  Created by cia on 10/01/2021.
//

import UIKit

class HomepageVC: BaseViewController {
   
    let currentview = HomepageView()
    let data = PostData()
    let populate = storyData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollectionView()
        setupTableView()
    }
    
    
    override func loadView() {
        view = currentview
    }
    
    private func setupCollectionView() {
        currentview.storyCollection.register(HomeStoryCell.self, forCellWithReuseIdentifier: HomeStoryCell.cellId)
        currentview.storyCollection.delegate = self
        currentview.storyCollection.dataSource = self
    }
    private func setupTableView() {
        currentview.tableView.register(PostCell.self, forCellReuseIdentifier: PostCell.cellId)
        currentview.tableView.delegate = self
        currentview.tableView.dataSource = self
        currentview.tableView.estimatedRowHeight = 800
    }

    private func gotoStoryVC(data: storyModel) {
        let storyVC = StoryVC()
        storyVC.currentview.configureStoryCell(with: data)
        storyVC.modalPresentationStyle = .overFullScreen
//        navigationController?.pushViewController(storyVC, animated: true)
        present(storyVC, animated: true)
        
    }

}

//MARK:- collection stuffs
 

extension HomepageVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return populate.getStoryData().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeStoryCell.cellId, for: indexPath) as! HomeStoryCell
        let module = populate.getStoryData()[indexPath.item]
        cell.configureStoryCell(with: module)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        return CGSize(width: 70, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = populate.getStoryData()[indexPath.item]
        gotoStoryVC(data: model)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
////        return 30
//    }
}

// MARK:- Tableview Stuffs

extension HomepageVC: UITableViewDelegate, UITableViewDataSource {
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
