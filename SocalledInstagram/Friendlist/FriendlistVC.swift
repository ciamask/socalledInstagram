//
//  FriendlistVC.swift
//  SocalledInstagram
//
//  Created by cia on 09/01/2021.
//

import UIKit

class FriendlistVC: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
    }
    
    let currentview = FriendlistView()
    
    override func loadView() {
        view = currentview
    }
}
