//
//  CartTableViewCell.swift
//  BuySneakers
//
//  Created by Alikhan Tangirbergen on 24.10.2023.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    static let identifier = "CartTableViewCell"
    
    public var shoe : Shoe? {
        didSet {
            guard let shoe = shoe else {return}
            shoeImageView.image = shoe.image
            descriptionLabel.text = shoe.description
            brandLabel.text = shoe.brand
            priceLabel.text = "$\(shoe.price)"
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white.withAlphaComponent(0.98)
        [shoeImageView, brandLabel, descriptionLabel, priceLabel, quantityButton, separatorView].forEach { self.addSubview($0) }
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private let shoeImageView : UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let brandLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private let descriptionLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = Colors.lightGray
        return label
    }()
    
    private let priceLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }()

    private let quantityButton : UIButton = {
        let button = UIButton()
        button.setTitle("+-", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 12
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    private let separatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = Colors.grayMainBackground
        return separatorView
    }()
    
    private func applyConstraints() {
        shoeImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(16)
            make.width.equalTo(140)
            make.height.equalTo(140)
        }
        
        brandLabel.snp.makeConstraints { make in
            make.top.equalTo(shoeImageView.snp.top)
            make.left.equalTo(shoeImageView.snp.right).offset(16)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(brandLabel.snp.bottom)
            make.left.equalTo(shoeImageView.snp.right).offset(16)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(4)
            make.left.equalTo(shoeImageView.snp.right).offset(16)
        }
        
        quantityButton.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(10)
            make.left.equalTo(shoeImageView.snp.right).offset(16)
            make.width.equalTo(160)
            make.height.equalTo(36)
        }
        
        separatorView.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(16)
        }
    }

}
