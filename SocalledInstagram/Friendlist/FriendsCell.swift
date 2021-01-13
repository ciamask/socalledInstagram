//
//  FriendsCell.swift
//  SocalledInstagram
//
//  Created by cia on 06/01/2021.
//

import UIKit

class FriendsCell: UITableViewCell {
    
    static let cellId = "friendsCell"
    
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1.2
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 25
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return imageView
    }()
    
    let friendName: UILabel = {
        let heroView = UILabel()
        heroView.translatesAutoresizingMaskIntoConstraints = false
        heroView.numberOfLines = 0
        heroView.clipsToBounds = true
        return heroView
    }()
    
    let favicon: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.heightAnchor.constraint(equalToConstant: 30).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 30).isActive = true
        icon.image = #imageLiteral(resourceName: "heart")
        return icon
    }()
    
    lazy var infoStack: UIStackView = {
        var stack = UIStackView (arrangedSubviews: [profileImage, friendName, favicon])
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing =  10
        stack.distribution = .fillProportionally
        stack.alignment = .center
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(infoStack)
        infoStack.fillSuperview(padding: .init(top: 5, left: 5, bottom: 5, right: 5))
        infoStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        infoStack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        infoStack.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        infoStack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func configureCell(with data: FriendsModel) {
        profileImage.image = data.profileImage
        friendName.text = data.friendsName
        favicon.isHidden = !data.isfavourite
    }
}
