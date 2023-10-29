//
//  OrderViewController.swift
//  BuySneakers
//
//  Created by Alikhan Tangirbergen on 29.10.2023.
//

import UIKit

class OrderViewController: UIViewController {
    
    public var purchase : Purchase?

    private var totalView = CartTotalView()
    
    private var orderedView = OrderAndDateView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Order #123"
        view.backgroundColor = Colors.grayMainBackground
        [totalView, orderedView].forEach { self.view.addSubview($0)}
        totalView.cartTotalLabel.text = "\(calculateItems()) items: Total(Including Delivery))"
        totalView.cartTotalPrice.text = "$\(calculatePrice())"
        orderedView.date = (purchase?.date.formatted())!
        applyConstraints()
    }
    
    private func applyConstraints() {
        
        orderedView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(50)
        }
        
        totalView.snp.makeConstraints { make in
            make.top.equalTo(orderedView.snp.bottom).offset(16)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(50)
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
