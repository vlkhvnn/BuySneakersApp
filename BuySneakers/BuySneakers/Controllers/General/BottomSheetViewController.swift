//
//  BottomSheetViewController.swift
//  BuySneakers
//
//  Created by Alikhan Tangirbergen on 25.10.2023.
//

import UIKit

protocol BottomSheetViewControllerDelegate : AnyObject {
    func didTapBackToShopping()
}

class BottomSheetViewController: UIViewController {

    weak var delegate : BottomSheetViewControllerDelegate?
    
    private var backgroundView: UIView = {
        let background = UIView()
        background.backgroundColor = .white
        background.layer.cornerRadius = 24
        return background
    } ()
    
    private let successLabel : UILabel = {
       let label = UILabel()
        label.text = "Your order is successfully\n placed. Thanks!"
        label.font = .systemFont(ofSize: 28, weight: .semibold)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let backToShoppingButton : UIButton = {
        let button = UIButton()
        button.setTitle("Get back to shopping", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(backToShopping), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundView)
        view.addSubview(backToShoppingButton)
        view.addSubview(successLabel)
        applyConstraints()
    }
    
    private func applyConstraints() {
        backToShoppingButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-60)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(54)
        }
        
        successLabel.snp.makeConstraints { make in
            make.bottom.equalTo(backToShoppingButton.snp.top).offset(-24)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        backgroundView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalTo(300)
        }
    }
    
    @objc private func backToShopping() {
        dismiss(animated: true)
        delegate?.didTapBackToShopping()
    }
}
