//
//  AuthorizationViewController.swift
//  BuySneakers
//
//  Created by Alikhan Tangirbergen on 13.10.2023.
//

import UIKit

class AuthorizationViewController: UIViewController {
    
    private let signInButton : UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 24
        button.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        return button
    }()
    
    private var usernameTextField : UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Username"
        textfield.layer.cornerRadius = 6
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        textfield.setLeftPaddingPoints(16)
        return textfield
    }()
    
    private var passwordTextField : UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Password"
        textfield.layer.cornerRadius = 6
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        textfield.setLeftPaddingPoints(16)
        return textfield
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        [usernameTextField, signInButton, passwordTextField].forEach {
            view.addSubview($0)
        }
        view.backgroundColor = .systemBackground
        navigationItem.title = "Welcome back!"
        navigationItem.backButtonTitle = ""
        applyConstratints()
    }
    
    func applyConstratints() {
        usernameTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(48)
        }
        signInButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-58)
            make.height.equalTo(54)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(48)
        }
    }
    
    @objc
    private func signIn() {
        
    }
}
