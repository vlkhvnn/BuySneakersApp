//
//  CartTotalView.swift
//  BuySneakers
//
//  Created by Alikhan Tangirbergen on 25.10.2023.
//

import UIKit

class CartTotalView: UIView {
    
    public let cartTotalLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    } ()
    
    public let cartTotalPrice: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white.withAlphaComponent(0.98)
        self.isUserInteractionEnabled = true
        [cartTotalLabel, cartTotalPrice].forEach { self.addSubview($0) }
        applyConstraints()
    }
    
    private func applyConstraints() {
        cartTotalLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        cartTotalPrice.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.top.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
