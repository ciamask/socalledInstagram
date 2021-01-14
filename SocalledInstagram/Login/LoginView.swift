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
        checkValidity()
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
        emailfiled.addTarget(self, action: #selector(handelEmailChanges), for: .editingChanged)
        return emailfiled
    }()
    
    let passwordBar: UITextField = {
        let pwfield = UITextField()
        pwfield.placeholder = "Enter Password"
        pwfield.textAlignment = .center
        pwfield.borderStyle = .roundedRect
        pwfield.font = UIFont.systemFont(ofSize: 22)
        pwfield.addTarget(self, action: #selector(handelPasswordChanges), for: .editingChanged)
        return pwfield
    }()
    
    let loginbtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("LOGIN", for: .normal)
        btn.setTitleColor(.white, for: .normal)
//        btn.backgroundColor = .white
        btn.heightAnchor.constraint(equalToConstant: 44).isActive = true
        btn.addTarget(self , action: #selector(openHomepage), for: .touchUpInside)
        return btn
    }()
    
    var isEmailValid = false
    var isPasswordValid = false
    
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
    
    @objc func handelEmailChanges(_ textField: UITextField){
        let email = textField.text ?? ""
        isEmailValid = checkEmail(with: email)
//        print(isEmailValid)
        checkValidity()
    }
    
    @objc func handelPasswordChanges(_ textField: UITextField) {
        let pw = textField.text ?? ""
        isPasswordValid = checkPassword(with: pw)
//        print(isPasswordValid)
        checkValidity()
    }
    
    private func checkPassword(with text:String) -> Bool {
        let pwregex = "\\A(?=[^a-z]*[a-z])(?=[^0-9]*[0-9])[a-zA-Z0-9!@#$%^&*]{8,}\\z"
        let pwpredicate = NSPredicate(format: "SELF MATCHES %@", pwregex)
        return pwpredicate.evaluate(with: text)
    }
    
    
    private func checkEmail(with text:String) -> Bool{
        let emailregex = #"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,64}"#
        let emailpredicate = NSPredicate(format: "SELF MATCHES %@", emailregex)
        return emailpredicate.evaluate(with: text)
    }
    
    private func checkValidity() {
        if isEmailValid == true && isPasswordValid == true {
            loginbtn.isEnabled = true
            loginbtn.backgroundColor = .systemBlue
        } else {
            loginbtn.isEnabled = false
            loginbtn.backgroundColor = .systemGray
        }
    }
    
}
