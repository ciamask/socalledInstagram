//
//  StoryModel.swift
//  SocalledInstagram
//
//  Created by cia on 12/01/2021.
//

import UIKit

struct storyModel {
    let profileImage: UIImage
    let profileName:  String
    let storyImage: UIImage
}

struct storyData {
    private var data = [storyModel]()
    
    init() {
        data.append(storyModel(profileImage: #imageLiteral(resourceName: "cute"), profileName: "Shreeya 1", storyImage: #imageLiteral(resourceName: "p4")))
        data.append(storyModel(profileImage: #imageLiteral(resourceName: "p2"), profileName: "Shreeya 2", storyImage: #imageLiteral(resourceName: "cute")))
        data.append(storyModel(profileImage: #imageLiteral(resourceName: "Puppy"), profileName: "Shreeya 3", storyImage: #imageLiteral(resourceName: "p1")))
        data.append(storyModel(profileImage: #imageLiteral(resourceName: "cute"), profileName: "Shreeya 4", storyImage: #imageLiteral(resourceName: "p3")))
        data.append(storyModel(profileImage: #imageLiteral(resourceName: "p2"), profileName: "Shreeya 5", storyImage: #imageLiteral(resourceName: "cute")))
        data.append(storyModel(profileImage: #imageLiteral(resourceName: "Puppy"), profileName: "Shreeya 6", storyImage: #imageLiteral(resourceName: "p3")))
        data.append(storyModel(profileImage: #imageLiteral(resourceName: "cute"), profileName: "Shreeya 7", storyImage: #imageLiteral(resourceName: "p4")))
        data.append(storyModel(profileImage: #imageLiteral(resourceName: "p2"), profileName: "Shreeya 8", storyImage: #imageLiteral(resourceName: "p4")))
        data.append(storyModel(profileImage: #imageLiteral(resourceName: "Puppy"), profileName: "Shreeya 9", storyImage: #imageLiteral(resourceName: "p1")))
        data.append(storyModel(profileImage: #imageLiteral(resourceName: "cute"), profileName: "Shreeya 10", storyImage: #imageLiteral(resourceName: "p3")))
    }
    
    func getStoryData() -> [storyModel]{
        return data
    }
    
}
