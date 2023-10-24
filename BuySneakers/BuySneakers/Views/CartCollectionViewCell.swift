//
//  CartCollectionViewCell.swift
//  BuySneakers
//
//  Created by Alikhan Tangirbergen on 22.10.2023.
//

import UIKit

class CartCollectionViewCell: UICollectionViewCell {
    public static let identifier = "CartCollectionViewCell"
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [shoeImageView, quantityButton, brandLabel, descriptionLabel, priceLabel].forEach { self.addSubview($0) }
        applyConstraints()
    }
    
    public var shoe : Shoe? {
        didSet {
            guard let shoe = shoe else {return}
            shoeImageView.image = shoe.image
            descriptionLabel.text = shoe.description
            brandLabel.text = shoe.brand
            priceLabel.text = "$\(shoe.price)"
        }
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
        button.setTitle("-+", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 12
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    func applyConstraints() {
        shoeImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(16)
            make.width.equalTo(140)
            make.height.equalTo(140)
        }
        
        brandLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-18)
            make.left.equalTo(shoeImageView.snp.right).offset(16)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(brandLabel.snp.bottom)
            make.right.equalToSuperview().offset(-18)
            make.left.equalTo(shoeImageView.snp.right).offset(16)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(4)
            make.right.equalToSuperview().offset(-18)
            make.left.equalTo(shoeImageView.snp.right).offset(16)
        }
        
        quantityButton.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(10)
            make.left.equalTo(shoeImageView.snp.right).offset(16)
            make.height.equalTo(36)
            make.width.equalTo(160)
        }
    }
}
