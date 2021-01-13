//
//  StoryVC.swift
//  SocalledInstagram
//
//  Created by cia on 12/01/2021.
//

import UIKit

protocol StoryCloseProtocol: NSObject  {
    func userTappedCloseButton(with data: String)
}

class StoryVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        observeEvents()
        currentview.delegate = self
    }
    
    let currentview = StoryView()
    
    override func loadView() {
        view = currentview
    }
    
    private func observeEvents() {
        currentview.onCloseButtonClicked = { [weak self] in
            guard let self = self else { return }
            self.dismiss(animated: true)
        }
    }

}

extension StoryVC: StoryCloseProtocol {
    func userTappedCloseButton(with data: String) {
//        print(data)
        dismiss(animated: true)
    }
}
