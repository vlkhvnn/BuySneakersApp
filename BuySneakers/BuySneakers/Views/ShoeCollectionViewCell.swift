//
//  ShoeCollectionViewCell.swift
//  BuySneakers
//
//  Created by Alikhan Tangirbergen on 15.10.2023.
//

import UIKit

class ShoeCollectionViewCell: UICollectionViewCell {
    static let identifier = "ShoeCollectionViewCell"
    
    public var shoe : Shoe? {
        didSet {
            guard let shoe = shoe else {return}
            shoeImageView.image = shoe.image
            descriptionLabel.text = shoe.description
            brandLabel.text = shoe.brand
            priceLabel.text = "$\(shoe.price)"
        }
    }
    
    public var isAddedToCart: Bool? = false {
        didSet {
            guard let isAddedToCart = isAddedToCart else { return }
            guard let shoe = shoe else { return }
            
            if isAddedToCart && shoe.quantity ?? 0 > 0 {
                addOrRemoveButton.setTitle("Remove", for: .normal)
                addOrRemoveButton.backgroundColor = .black.withAlphaComponent(0.8)
                priceLabel.text = "1 • $\(shoe.price)"
            } else {
                addOrRemoveButton.setTitle("Add to cart", for: .normal)
                addOrRemoveButton.backgroundColor = .black
                priceLabel.text = "$\(shoe.price)"
            }
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

    private let addOrRemoveButton : UIButton = {
        let button = UIButton()
        button.setTitle("Add to cart", for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.layer.cornerRadius = 12
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [shoeImageView, addOrRemoveButton, brandLabel, descriptionLabel, priceLabel].forEach { self.addSubview($0) }
        self.backgroundColor = .white
        self.layer.cornerRadius = 4
        applyConstraints()
    }
    
    @objc
    public func buttonAction() {
        if let isAddedToCart = self.isAddedToCart {
            guard let shoe = self.shoe else { return }
            switch isAddedToCart {
            case true:
                ShoeService.shared.removeFromCart(shoe)
            case false:
                ShoeService.shared.addToCart(shoe)
            }
        }
        self.isAddedToCart = !self.isAddedToCart!
    }
    
    private func applyConstraints() {
        shoeImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.equalToSuperview().offset(-4)
            make.left.equalToSuperview().offset(4)
            make.height.equalTo(156)
        }
        
        brandLabel.snp.makeConstraints { make in
            make.top.equalTo(shoeImageView.snp.bottom).offset(2)
            make.right.equalToSuperview().offset(-4)
            make.left.equalToSuperview().offset(4)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(brandLabel.snp.bottom).offset(2)
            make.right.equalToSuperview().offset(-4)
            make.left.equalToSuperview().offset(4)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(2)
            make.right.equalToSuperview().offset(-4)
            make.left.equalToSuperview().offset(4)
        }
        
        addOrRemoveButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-12)
            make.right.equalToSuperview().offset(-4)
            make.left.equalToSuperview().offset(4)
            make.height.equalTo(40)
        }
    }
    
}
