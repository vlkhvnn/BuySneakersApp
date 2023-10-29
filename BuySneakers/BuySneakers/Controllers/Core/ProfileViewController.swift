//
//  ProfileViewController.swift
//  BuySneakers
//
//  Created by Alikhan Tangirbergen on 12.10.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let accountInfo = ProfileSectionView()

    private let orderHistory = ProfileSectionView()
    
    private let shoeSize = ProfileSectionView()
    
    private let signOutButton = {
        let button = UIButton()
        button.setTitle("Sign out", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(signOut), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 24
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.grayMainBackground
        navigationItem.title = "Profile"
        accountInfo.titleLabel.text = "Account Information"
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(accInfNav))
        accountInfo.addGestureRecognizer(tapGesture)
        orderHistory.titleLabel.text = "Order History"
        orderHistory.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(orderHistoryNav)))
        shoeSize.titleLabel.text = "Shoe Size"
        shoeSize.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(shoeSizeNav)))
        [signOutButton, accountInfo, orderHistory, shoeSize].forEach { view.addSubview($0)}
        applyConstraints()
        navigationItem.backButtonTitle = ""
    }
    
    private func applyConstraints() {
        signOutButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-100)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(54)
        }
        
        accountInfo.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.height.equalTo(52)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        orderHistory.snp.makeConstraints { make in
            make.top.equalTo(accountInfo.snp.bottom).offset(16)
            make.height.equalTo(52)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        shoeSize.snp.makeConstraints { make in
            make.top.equalTo(orderHistory.snp.bottom).offset(16)
            make.height.equalTo(52)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
        }
    }

    @objc 
    private func accInfNav() {
        let vc = AccountInformationViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc 
    private func orderHistoryNav() {
        let vc = OrderHistoryViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    private func shoeSizeNav() {
        let vc = ShoeSizeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    private func signOut() {
        let alert = UIAlertController(title: "Are you sure you want to sign out?", message: nil, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { _ in
            self.signOutNav()
        }
        
        alert.addAction(cancelAction)
        alert.addAction(confirmAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    private func signOutNav() {
        if let navigationController = self.navigationController,
           let window = UIApplication.shared.windows.first {
            // Create a new instance of WelcomeViewController or obtain an existing one
            let welcomeVC = WelcomeViewController() // Replace with your instantiation logic

            // Create a new navigation controller with the WelcomeVC as the root
            let newNavigationController = UINavigationController(rootViewController: welcomeVC)

            // Set the new navigation controller as the root of the window
            window.rootViewController = newNavigationController

            // Optionally, release or dismiss any existing view controllers or perform additional cleanup
            navigationController.viewControllers = [] // Empty the previous navigation stack
        }
    }
}
