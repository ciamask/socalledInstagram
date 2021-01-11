//
//  StoryCell.swift
//  SocalledInstagram
//
//  Created by cia on 11/01/2021.
//

import UIKit

class StoryCell: UICollectionViewCell {
    
    static let cellId = "storyCell"
    
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.orange.cgColor
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 30
        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.image = #imageLiteral(resourceName: "cute")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(profileImage)
        profileImage.fillSuperview(padding: .init(top: 5, left: 5, bottom: 5, right: 5))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
