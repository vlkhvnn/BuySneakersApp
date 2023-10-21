//
//  WelcomeViewController.swift
//  BuySneakers
//
//  Created by Alikhan Tangirbergen on 13.10.2023.
//

import UIKit
import SnapKit

class WelcomeViewController: UIViewController {

    private let leftSneakerImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "welc3")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let rightSneakerImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "welc2")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let topVectorImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "welcvector")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let welcomeText : UILabel = {
       let label = UILabel()
        label.text = "Welcome to the biggest sneakers store app"
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    private let signUpButton : UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 24
        button.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        return button
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        // Create a dictionary with text attributes, including the font weight
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16, weight: .semibold),
            .foregroundColor: UIColor.black
        ]
        // Create an attributed string with the specified attributes
        let attributedText = NSAttributedString(string: "I already have an account", attributes: attributes)
        button.setAttributedTitle(attributedText, for: .normal)
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 24
        button.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.hidesBackButton = true
        [leftSneakerImageView, rightSneakerImageView, topVectorImageView, welcomeText, signUpButton, signInButton].forEach {
            view.addSubview($0)
        }
        applyConstraints()
    }
    
    private func applyConstraints() {
        topVectorImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        leftSneakerImageView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalToSuperview().offset(312)
        }
        rightSneakerImageView.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.top.equalToSuperview().offset(247)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(54)
            make.bottom.equalToSuperview().offset(-120)
        }
        
        welcomeText.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(signUpButton.snp.top).offset(-24)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc
    private func signUp() {
        let vc = RegistrationViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    private func signIn() {
        let vc = AuthorizationViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
