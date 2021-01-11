//
//  ViewController.swift
//  SocalledInstagram
//
//  Created by cia on 06/01/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        // Do any additional setup after loading the view.
    }

    let profileImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = #imageLiteral(resourceName: "Puppy")
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.cornerRadius = 70
        return image
    }()
    
    let profileName: UILabel = {
        let name = UILabel()
        name.text = "HI"
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        name.textAlignment = .center
        return name
    }()
    
    let profileDetails: UILabel = {
        let details = UILabel()
        details.text = "hvdjbwieud wiudbibd kjdbia iuhhb wyduwq iubsb iubdiub iuqwhdbiw iuqbwdib"
        details.translatesAutoresizingMaskIntoConstraints = false
        details.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        details.textAlignment = .center
        details.numberOfLines = 0
        return details
    }()
    
    private func setupUI() {
        view.addSubview(profileImage)
        profileImage.centerXInSuperview()
        profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 140).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 140).isActive = true
        
        view.addSubview(profileName)
        profileName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        profileName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        profileName.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 20).isActive = true
        
        view.addSubview(profileDetails)
        profileDetails.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        profileDetails.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        profileDetails.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 20).isActive = true

    }
    
    public func configureView(data: FriendsModel){
        profileImage.image = data.profileImage
        profileName.text = data.friendsName.addHi()
        profileDetails.text = data.friendsDetails
    }
    
}

extension String {
    func addHi() -> String {
        return "Hi, \(self)"
    }
}
