//
//  OrderAndDateView.swift
//  BuySneakers
//
//  Created by Alikhan Tangirbergen on 29.10.2023.
//

import UIKit

class OrderAndDateView: UIView {
    
    public var date = "" {
        didSet {
            dateLabel.text = date
        }
    }
    
    private let dateLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private let orderedLabel : UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.text = "Ordered"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.layer.cornerRadius = 12
        [orderedLabel, dateLabel].forEach { self.addSubview($0) }
        applyConstraints()
    }
    
    private func applyConstraints() {
        orderedLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        
        dateLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
