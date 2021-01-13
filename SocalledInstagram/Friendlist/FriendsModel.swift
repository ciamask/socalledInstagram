//
//  FriendsModel.swift
//  SocalledInstagram
//
//  Created by cia on 06/01/2021.
//

import UIKit

struct FriendsModel {
    let profileImage: UIImage
    let friendsName: String
    let friendsDetails: String
    let isfavourite: Bool
}

struct FriendsData {
    private var data = [FriendsModel]()
    
    init() {
        data.append(FriendsModel(profileImage: #imageLiteral(resourceName: "Puppy"), friendsName: "Shreeya Maskey", friendsDetails: "jbsjah bkab bdkjbd kedbkwjqb dbwkd iudhbiuqwhdiuh udbi", isfavourite: true))
        data.append(FriendsModel(profileImage: #imageLiteral(resourceName: "Puppy"), friendsName: "Sujal Shrestha", friendsDetails: "jbsjah bkab bdkjbd kedbkwjqb dbwkd iudhbiuqwhdiuh udbi", isfavourite: false))
        data.append(FriendsModel(profileImage: #imageLiteral(resourceName: "Puppy"), friendsName: "Sampada Regmi", friendsDetails: "jbsjah bkab bdkjbd kedbkwjqb dbwkd iudhbiuqwhdiuh udbi", isfavourite: true))
        data.append(FriendsModel(profileImage: #imageLiteral(resourceName: "Puppy"), friendsName: "Sulav Maskey", friendsDetails: "jbsjah bkab bdkjbd kedbkwjqb dbwkd iudhbiuqwhdiuh udbi", isfavourite: false))
    }
    
    func getData() -> [FriendsModel] {
        return data
    }
}
