//
//  postCell.swift
//  SocalledInstagram
//
//  Created by cia on 10/01/2021.
//

import UIKit

class PostCell: UITableViewCell {
    
    static let cellId = "postCell"
    
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 0.2
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 15
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return imageView
    }()
    
    let postName: UILabel = {
        let nameView = UILabel()
        return nameView
    }()
    
    let postImage: UIImageView = {
        let postview = UIImageView()
        postview.contentMode = .scaleAspectFill
        postview.clipsToBounds = true
        postview.translatesAutoresizingMaskIntoConstraints = false
//        postview.widthAnchor.constraint(equalToConstant: 390).isActive = true
//        postview.heightAnchor.constraint(equalToConstant: 390).isActive = true
        return postview
    }()
    
    let likeCount: UILabel = {
        let likes = UILabel()
        likes.text = "Checking if visible"
        likes.translatesAutoresizingMaskIntoConstraints = false
        likes.heightAnchor.constraint(equalToConstant: 16).isActive = true
        likes.clipsToBounds = true
        likes.numberOfLines = 0
        return likes
    }()
    
    let details: UIImageView = {
        let img = UIImageView()
        img.image =  #imageLiteral(resourceName: "threedots")
//        img.widthAnchor.constraint(equalToConstant: 30).isActive = true
//        img.heightAnchor.constraint(equalToConstant: 30).isActive = true
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    let like: UIImageView = {
        let img = UIImageView()
        img.image =  #imageLiteral(resourceName: "like")
        img.widthAnchor.constraint(equalToConstant: 30).isActive = true
        img.heightAnchor.constraint(equalToConstant: 30).isActive = true
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    let comment: UIImageView = {
        let img = UIImageView()
        img.image =  #imageLiteral(resourceName: "comment")
        img.widthAnchor.constraint(equalToConstant: 30).isActive = true
        img.heightAnchor.constraint(equalToConstant: 30).isActive = true
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    let share: UIImageView = {
        let img = UIImageView()
        img.image =  #imageLiteral(resourceName: "heart")
        img.widthAnchor.constraint(equalToConstant: 30).isActive = true
        img.heightAnchor.constraint(equalToConstant: 30).isActive = true
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    let save: UIImageView = {
        let img = UIImageView()
        img.image =  #imageLiteral(resourceName: "pin")
        img.widthAnchor.constraint(equalToConstant: 30).isActive = true
        img.heightAnchor.constraint(equalToConstant: 30).isActive = true
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    let blank = UIView()
    
    let infoSpacer = UIView()
    
    lazy var infoStack: UIStackView = {
        var stack = UIStackView (arrangedSubviews: [profileImage, postName, infoSpacer, details])
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing =  10
        stack.distribution = .fillProportionally
        stack.alignment = .leading
        return stack
    }()
    
    lazy var interactiveStack: UIStackView = {
        var stack = UIStackView (arrangedSubviews: [like, comment, share, blank, save])
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
//        stack.alignment = .leading
//        stack.distribution = .fillProportionally
        return stack
    }()
    
    lazy var postStack: UIStackView = {
        var stack = UIStackView (arrangedSubviews: [infoStack, postImage, interactiveStack, likeCount])
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing =  0
        stack.distribution = .fillProportionally
//        stack.alignment = .fill
        return stack
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupInfoView()
        setupContentImage()
        setupInteractiveStack()
        setupLikeView()
//        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupInfoView() {
        addSubview(profileImage)
        profileImage.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 16, bottom: 0, right: 0))
        profileImage.heightAnchor.constraint(equalTo: profileImage.widthAnchor).isActive = true
        
        addSubview(postName)
        postName.anchor(top: nil, leading: profileImage.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 10, bottom: 0, right: 0))
        postName.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor).isActive = true
        
        addSubview(details)
        details.anchor(top: nil, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 8))
        details.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor).isActive = true
    }
    
    private func setupContentImage() {
        addSubview(postImage)
        postImage.anchor(top: profileImage.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0))
        postImage.constraintHeight(constant: 300)
    }
    
    private func setupInteractiveStack() {
        addSubview(like)
        like.anchor(top: postImage.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 10, bottom: 0, right: 0))
    }
    
    private func setupLikeView() {
        addSubview(likeCount)
        likeCount.anchor(top: like.bottomAnchor, leading: like.leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 8, left: 0, bottom: 10, right: 0))
    }
    
    private func setupUI() {
        
//        addSubview(postStack)
//        postStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
//        postStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
//        postStack.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
//        postStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        addSubview(infoStack)
        infoStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        infoStack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        infoStack.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        infoStack.constraintHeight(constant: 50)
//        infoStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
//
//        addSubview(postImage)
//        postImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
//        postImage.topAnchor.constraint(equalTo: infoStack.bottomAnchor).isActive = true
//        postImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
//        infoStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true

//        addSubview(interactiveStack)
//        interactiveStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
//        interactiveStack.topAnchor.constraint(equalTo: postImage.bottomAnchor).isActive = true
//        interactiveStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
//        interactiveStack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

//        addSubview(likeCount)
//        likeCount.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
//        likeCount.topAnchor.constraint(equalTo: postImage.bottomAnchor).isActive = true
//        likeCount.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
//        likeCount.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let deviceWidth = frame.width
        postImage.constraintHeight(constant: deviceWidth)
    }
    
    func configureCell(with data: PostModel) {
        profileImage.image = data.profileImage
        postName.text = data.postName
        postImage.image = data.postImage
        likeCount.text = data.likeCounts
    }
}

