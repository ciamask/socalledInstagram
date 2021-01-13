//
//  LoginView.swift
//  SocalledInstagram
//
//  Created by cia on 13/01/2021.
//

import UIKit

class LoginView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var openHomepagebtnClicked: (() -> Void)?
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let logo: UIImageView = {
        let logoImg = UIImageView()
        logoImg.image = #imageLiteral(resourceName: "logo")
        logoImg.contentMode = .scaleAspectFit
        logoImg.heightAnchor.constraint(equalToConstant: 820).isActive = true
        logoImg.heightAnchor.constraint(equalToConstant: 820).isActive = true
        logoImg.translatesAutoresizingMaskIntoConstraints = false
        return logoImg
    }()
    
    let emailBar: UITextField = {
        let emailfiled = UITextField()
        emailfiled.placeholder = "Enter Email"
        emailfiled.textAlignment = .center
        emailfiled.borderStyle = .roundedRect
        emailfiled.font = UIFont.systemFont(ofSize: 22)
        emailfiled.keyboardType = .emailAddress
        return emailfiled
    }()
    
    let passwordBar: UITextField = {
        let pwfield = UITextField()
        pwfield.placeholder = "Enter Password"
        pwfield.textAlignment = .center
        pwfield.borderStyle = .roundedRect
        pwfield.font = UIFont.systemFont(ofSize: 22)
        return pwfield
    }()
    
    let loginbtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("LOGIN", for: .normal)
        btn.setTitleColor(.systemPink, for: .normal)
        btn.backgroundColor = .white
        btn.heightAnchor.constraint(equalToConstant: 44).isActive = true
        btn.addTarget(self , action: #selector(openHomepage), for: .touchUpInside)
        return btn
    }()
    
    private func setupUI(){
        addSubview(scrollView)
        scrollView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: trailingAnchor)
        
        scrollView.addSubview(contentView)
        contentView.anchor(top: scrollView.topAnchor, leading: scrollView.leadingAnchor, bottom: scrollView.bottomAnchor, trailing: scrollView.trailingAnchor)
        contentView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        contentView.addSubview(logo)
        logo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        logo.anchor(top: contentView.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 44, left: 0, bottom: 0, right: 0))
        
        contentView.addSubview(emailBar)
        emailBar.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        emailBar.anchor(top: logo.bottomAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 0, right: 10))
        
        contentView.addSubview(passwordBar)
        passwordBar.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        passwordBar.anchor(top: emailBar.bottomAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 0, right: 10))
        
        contentView.addSubview(loginbtn)
        loginbtn.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        loginbtn.anchor(top: passwordBar.bottomAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 80, right: 10))
    }
    
    @objc func openHomepage() {
        openHomepagebtnClicked?()
    }
    
}
