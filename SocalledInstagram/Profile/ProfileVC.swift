//
//  ProfileVC.swift
//  SocalledInstagram
//
//  Created by cia on 06/01/2021.
//

import UIKit

class ProfileVC: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
//        setupUI()
//        setupTableView()
        setupCollectionView()
    }
    
    let baseView = ProfileView()
    let data = photosData()
    
    override func loadView() {
        view = baseView
    }

    private func setupCollectionView() {
        baseView.photosCollection.register(Photoscell.self, forCellWithReuseIdentifier: Photoscell.cellId)
        baseView.photosCollection.delegate = self
        baseView.photosCollection.dataSource = self
    }

}



extension ProfileVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.getPhotos().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Photoscell.cellId, for: indexPath) as! Photoscell
        cell.backgroundColor = .systemGray
        let model = data.getPhotos()[indexPath.row]
        cell.configureCell(with: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ((collectionView.frame.width) / 3) - 2
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
}
