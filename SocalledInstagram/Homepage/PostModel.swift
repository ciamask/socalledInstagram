//
//  PostModel.swift
//  SocalledInstagram
//
//  Created by cia on 10/01/2021.
//

import UIKit

struct PostModel {
    let profileImage: UIImage
    let postName: String
    let postImage: UIImage
    let likeCounts: String
}

struct PostData {
    private var data = [PostModel]()
    
    init() {
        data.append(PostModel(profileImage: #imageLiteral(resourceName: "account"), postName: "Shreeya Maskey",postImage: #imageLiteral(resourceName: "cute"), likeCounts: "90 likes"))
        data.append(PostModel(profileImage: #imageLiteral(resourceName: "Puppy"), postName: "Sujal Shrestha",postImage: #imageLiteral(resourceName: "Puppy"), likeCounts: "120 likes"))
        data.append(PostModel(profileImage: #imageLiteral(resourceName: "account"), postName: "Sampada Regmi",postImage: #imageLiteral(resourceName: "cute"), likeCounts: "200 likes"))
        data.append(PostModel(profileImage: #imageLiteral(resourceName: "Puppy"), postName: "Sulav Maskey",postImage: #imageLiteral(resourceName: "Puppy"),likeCounts: "100 likes"))
    }
    
    func getData() -> [PostModel] {
        return data
    }
}
