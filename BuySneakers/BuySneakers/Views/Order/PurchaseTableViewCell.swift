//
//  PurchaseTableViewCell.swift
//  BuySneakers
//
//  Created by Alikhan Tangirbergen on 28.10.2023.
//

import UIKit

class PurchaseTableViewCell: UITableViewCell {
    
    static let identifier = "PurchaseTableViewCell"
    
    public var purchase : Purchase? {
        didSet {
            guard let shoe = purchase else {return}
            itemAndPriceLabel.text = "\(calculateItems()) items • $\(calculatePrice())"
            dateLabel.text = "\(purchase!.date.formatted())"
        }
    }
    
    private let itemAndPriceLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 1)
        return label
    }()
    
    private let nextImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let separatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = Colors.grayMainBackground
        return separatorView
    }()
    
    private let orderLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .black
        label.text = "Order #123"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [itemAndPriceLabel, dateLabel, nextImage, separatorView, orderLabel].forEach { self.addSubview($0) }
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func applyConstraints() {
        
        orderLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(orderLabel.snp.bottom)
            make.left.equalToSuperview().offset(16)
        }
        
        itemAndPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
        }
        
        nextImage.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
            make.height.equalTo(15)
            make.width.equalTo(9)
        }
        
        separatorView.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(16)
        }
    }
    private func calculateItems() -> Int {
        var count = 0
        for shoe in purchase!.shoes {
            if shoe.quantity == nil {
                count += 1
            } else {
                count += shoe.quantity!
            }
        }
        return count
    }
    
    private func calculatePrice() -> Int {
        var price = 0
        for shoe in purchase!.shoes {
            price += shoe.price
        }
        return price
    }
}
