//
//  StoryView.swift
//  SocalledInstagram
//
//  Created by cia on 12/01/2021.
//

import UIKit

class StoryView: UIView {
    
    weak var delegate: StoryCloseProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    var onCloseButtonClicked: (() -> Void)? // this is a closure
    
    let circleImage: UIImageView = {
        let pic = UIImageView()
        pic.contentMode = .scaleAspectFit
        pic.clipsToBounds = true
        pic.layer.cornerRadius = 15
        pic.backgroundColor = .clear
        return pic
    }()
    
    let storyName: UILabel = {
        let name = UILabel()
        name.textColor = .systemPink
        name.textAlignment = .center
        name.backgroundColor = .clear
        return name
    }()
    
    let closeButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(#imageLiteral(resourceName: "icons8-macos-close-32").withRenderingMode(.alwaysOriginal), for: .normal)
        btn.backgroundColor = .clear
        btn.addTarget(self, action: #selector(closecurrentView), for: .allTouchEvents)
        return btn
    }()
    
    let storyImage: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "p4")
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        return img
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func closecurrentView() {
        delegate?.userTappedCloseButton(with: "Shreeya Maskey")
//        onCloseButtonClicked?()
    }
    
    func configureStoryCell(with populate: storyModel){
        circleImage.image = populate.profileImage
        storyName.text = populate.profileName
        storyImage.image = populate.storyImage
    }
    
    private func setupUI() {
        addSubview(storyImage)
        storyImage.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        
        addSubview(circleImage)
        circleImage.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 4, left: 2, bottom: 0, right: 0))
        circleImage.constraintHeight(constant: 30)
        circleImage.constraintWidth(constant: 30)
        
        addSubview(storyName)
        storyName.anchor(top: safeAreaLayoutGuide.topAnchor, leading: circleImage.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 4, left: 10, bottom: 0, right: 0))
        storyName.centerYAnchor.constraint(equalTo: circleImage.centerYAnchor).isActive = true
        
        addSubview(closeButton)
        closeButton.anchor(top: safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 4, left: 0, bottom: 0, right: 4))
        closeButton.centerYAnchor.constraint(equalTo: circleImage.centerYAnchor).isActive = true
    }
    
}
