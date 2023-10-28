//
//  ShoeSizeViewController.swift
//  BuySneakers
//
//  Created by Alikhan Tangirbergen on 28.10.2023.
//

import UIKit

class ShoeSizeViewController: UIViewController {

    private let saveChangesButton : UIButton = {
        let button = UIButton()
        button.setTitle("Save changes", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 24
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.grayMainBackground
        [saveChangesButton].forEach { self.view.addSubview($0) }
        navigationItem.title = "Shoe Size"
        navigationItem.backButtonTitle = ""
        applyConstraints()
    }
    
    private func applyConstraints() {
        saveChangesButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(54)
            make.bottom.equalToSuperview().offset(-120)
        }
    }
    
    @objc
    private func saveChanges() {
        
    }
}
