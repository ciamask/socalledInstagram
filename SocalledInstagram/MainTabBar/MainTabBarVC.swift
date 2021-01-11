//
//  MainTabBarVC.swift
//  SocalledInstagram
//
//  Created by cia on 07/01/2021.
//

import UIKit

class MainTabBarVC: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let profileVC = ProfileVC()
        let profileNavVC = UINavigationController(rootViewController: profileVC)
        profileNavVC.tabBarItem.title = "Profile"
        profileNavVC.tabBarItem.image = #imageLiteral(resourceName: "account")
        
        
        let homeVC = HomepageVC()
        let homeNavVC = UINavigationController(rootViewController: homeVC)
        homeNavVC.tabBarItem.title = "Details"
        homeNavVC.tabBarItem.image = #imageLiteral(resourceName: "home")
        
        let friendVC = FriendlistVC()
        let friendNavVC = UINavigationController(rootViewController: friendVC)
        friendNavVC.tabBarItem.title = "FriendList"
        friendNavVC.tabBarItem.image = #imageLiteral(resourceName: "heart")
        
        tabBar.tintColor = .systemPink
        
        viewControllers = [homeNavVC, friendNavVC, profileNavVC]
    }
}
