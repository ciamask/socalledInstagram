//
//  BaseViewController.swift
//  SocalledInstagram
//
//  Created by cia on 11/01/2021.
//

import UIKit

class BaseViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        addLogo()
    }
    
    private func addLogo() {
        let logoimage = #imageLiteral(resourceName: "logo")
        let logoImageView = UIImageView(image: logoimage)
        logoImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = logoImageView
    }
}
