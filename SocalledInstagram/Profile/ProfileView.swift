//
//  ProfileView.swift
//  SocalledInstagram
//
//  Created by cia on 07/01/2021.
//

import UIKit

class ProfileView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
//        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Puppy")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1.2
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50
        return imageView
    }()
    
    let postNumber: UILabel = {
        let heroView = UILabel()
        heroView.text = "163\nPosts"
        heroView.translatesAutoresizingMaskIntoConstraints = false
        heroView.numberOfLines = 2
        heroView.clipsToBounds = true
        return heroView
    }()
    
    let followerNumber: UILabel = {
        let heroView = UILabel()
        heroView.text = "864\nFollowers"
        heroView.translatesAutoresizingMaskIntoConstraints = false
        heroView.clipsToBounds = true
        heroView.numberOfLines = 2
        return heroView
    }()
    
    let followingNumber: UILabel = {
        let heroView = UILabel()
        heroView.text = "607\nFollowing"
        heroView.translatesAutoresizingMaskIntoConstraints = false
        heroView.clipsToBounds = true
        heroView.numberOfLines = 2
        return heroView
    }()
    
    let profileName: UILabel = {
        let heroView = UILabel()
        heroView.text = "Shreeya Maskey"
        heroView.translatesAutoresizingMaskIntoConstraints = false
        heroView.numberOfLines = 1
        heroView.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return heroView
    }()
    
    let profileDetails: UILabel = {
        let heroView = UILabel()
        heroView.text = "My name is given up above i like dancing, cooking, travelling and many more. follow me to know more about me!!!!"
        heroView.translatesAutoresizingMaskIntoConstraints = false
        heroView.numberOfLines = 5
        heroView.font = UIFont.systemFont(ofSize: 18)
        return heroView
    }()
    
    let followButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("FOLLOW ME", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.systemBlue
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        button.layer.cornerRadius = 8
        return button
    }()
    
    let messageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("MESSAGE", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.systemRed
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        button.layer.cornerRadius = 8
        return button
    }()
    
    lazy var heroStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [postNumber, followerNumber, followingNumber])
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var buttonStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [followButton, messageButton])
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let line: UIView = {
        var lineView = UIView()
        lineView.backgroundColor = UIColor.lightGray
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    let photosCollection : UICollectionView = {
        let photoLayout = UICollectionViewFlowLayout()
        let photoCollection = UICollectionView(frame: .zero, collectionViewLayout: photoLayout)
        return photoCollection
    }()
    
    
    private func setupUI() {
        addSubview(profileImage)
        profileImage.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 20, left: 10, bottom: 0, right: 0))
        profileImage.constraintWidth(constant: 100)
        profileImage.constraintHeight(constant: 100)
        
        addSubview(heroStack)
        heroStack.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor).isActive = true
        heroStack.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 40).isActive = true
        heroStack.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        
        addSubview(profileName)
        profileName.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 10).isActive = true
        profileName.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        
        addSubview(profileDetails)
        profileDetails.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 2).isActive = true
        profileDetails.leftAnchor.constraint(equalTo: leftAnchor, constant:10).isActive = true
        profileDetails.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        
        addSubview(buttonStack)
        buttonStack.topAnchor.constraint(equalTo: profileDetails.bottomAnchor,constant: 10).isActive = true
        buttonStack.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        buttonStack.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        
        addSubview(line)
        line.topAnchor.constraint(equalTo: buttonStack.bottomAnchor, constant: 8).isActive = true
        line.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        line.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        addSubview(photosCollection)
        photosCollection.anchor(top: line.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 4, left: 0, bottom: 0, right: 0))
        
    }

}
