//
//  LoginVC.swift
//  SocalledInstagram
//
//  Created by cia on 13/01/2021.
//

import UIKit

class LoginVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        observeEvents()
    }
    
    let currentview = LoginView()
    
    override func loadView() {
        view = currentview
    }
    
    private func observeEvents(){
        currentview.openHomepagebtnClicked = { [weak self] in
            guard let self = self else {return}
            self.showAlert()
//            self.gotoMainTabBar()
        }
    }
    
    private func showAlert() {
        let alertVC = UIAlertController(title: "SoCalledInstagram", message: "Are you sure you bro?", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] (_) in
            guard let self = self else { return }
            self.gotoMainTabBar()
        }

        let cancleAction = UIAlertAction(title: "Cancel", style: .cancel) 
        
        alertVC.addAction(okAction)
        alertVC.addAction(cancleAction)
        
        present(alertVC, animated: true)
    }
    
    private func gotoMainTabBar() {
        let maintabVC = MainTabBarVC()
        maintabVC.modalPresentationStyle = .overFullScreen
        present(maintabVC, animated: true)
    }
    
    
}
