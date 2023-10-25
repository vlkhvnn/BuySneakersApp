//
//  CartCellButtonView.swift
//  BuySneakers
//
//  Created by Alikhan Tangirbergen on 25.10.2023.
//

import UIKit

protocol CartCellButtonViewDelegate {
    func didPlusButtonTapped()
    func didMinusButtonTapped()
}

class CartCellButtonView: UIView {
    
    public var delegate: CartCellButtonViewDelegate?
    
    public var cellQuantity: Int? {
        didSet {
            guard let quantity = cellQuantity else { return }
            quantityLabel.text = "\(quantity)"
        }
    }
    
    private let quantityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "1"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private let minusButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(handleMinusButton), for: .touchUpInside)
        return button
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        button.setTitleColor(.white, for: .normal)
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(handlePlusButton), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
        [minusButton, quantityLabel, plusButton].forEach { self.addSubview($0) }
        self.backgroundColor = .black
        self.layer.cornerRadius = 18
        applyConstraints()
    }
    
    private func applyConstraints() {
        quantityLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        minusButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(quantityLabel.snp.left).offset(-14)
        }
        plusButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(quantityLabel.snp.right).offset(14)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @objc private func handleMinusButton() {
        print("minus")
        delegate?.didMinusButtonTapped()
    }
    
    @objc private func handlePlusButton() {
        delegate?.didPlusButtonTapped()
        print("plus")
    }
}
