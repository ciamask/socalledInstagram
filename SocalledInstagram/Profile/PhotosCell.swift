//
//  PhotosCell.swift
//  SocalledInstagram
//
//  Created by cia on 11/01/2021.
//

import UIKit

class Photoscell: UICollectionViewCell {
    static let cellId = "photosCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(postImage)
        postImage.fillSuperview()
    }
    
    let postImage: UIImageView = {
        let postview = UIImageView()
        postview.contentMode = .scaleAspectFill
        postview.clipsToBounds = true
        postview.translatesAutoresizingMaskIntoConstraints = false
//        postview.widthAnchor.constraint(equalToConstant: 390).isActive = true
//        postview.heightAnchor.constraint(equalToConstant: 390).isActive = true
        return postview
    }()
        
    
    func configureCell(with data: photosModel) {
        postImage.image = data.cellPhotos
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
