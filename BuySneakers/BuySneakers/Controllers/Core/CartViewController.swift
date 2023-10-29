//
//  CartViewController.swift
//  BuySneakers
//
//  Created by Alikhan Tangirbergen on 12.10.2023.
//

import UIKit

protocol ShoeIsAddedDelegate {
    func updateIsAdded()
}

class CartViewController: UIViewController {
    
    public var cartItems = [Shoe]() {
        didSet {
            cartTotalView.cartTotalLabel.text = "\(cartItems.count) items: Total (Including Delivery)"
            cartTotalView.cartTotalPrice.text = "$\(getTotalPrice())"
        }
    }
    
    public var delegate : ShoeServiceDelegate?
    
    private let emptyCartLabel : UILabel = {
        let label = UILabel()
        label.text = "Cart is empty"
        label.font = .systemFont(ofSize: 28, weight: .semibold)
        return label
    }()
    
    private let findLabel : UILabel = {
        let label = UILabel()
        label.text = "Find interesting models in the Catalog"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    public let tableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = Colors.grayMainBackground
        tableView.register(CartTableViewCell.self, forCellReuseIdentifier: CartTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.isUserInteractionEnabled = true
        return tableView
    }()
    
    private let cartTotalView = CartTotalView()
    
    private let confirmButton = {
        let button = UIButton()
        button.setTitle("Confirm Order", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 24
        button.addTarget(self, action: #selector(confirmOrder), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        [tableView, confirmButton, cartTotalView, emptyCartLabel, findLabel].forEach { self.view.addSubview($0) }
        tableView.delegate = self
        tableView.dataSource = self
        ShoeService.shared.delegate = self
        view.backgroundColor = Colors.grayMainBackground
        navigationItem.title = "Cart"
        didUpdateShoes()
        applyConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        didUpdateShoes()
    }
    
    private func applyConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview().offset(-200)
        }
        
        confirmButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-100)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(54)
        }
        
        cartTotalView.snp.makeConstraints { make in
            make.bottom.equalTo(confirmButton.snp.top).offset(-8)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalTo(50)
        }
        emptyCartLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        findLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(emptyCartLabel.snp.bottom).offset(16)
        }
    }
    
    @objc
    private func confirmOrder() {
        let alert = UIAlertController(title: "Proceed with payment", message: "Are you sure you want to confirm?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { _ in
            self.confirmedOrder()
        }
        
        alert.addAction(cancelAction)
        alert.addAction(confirmAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func getTotalPrice() -> Int {
        var total = 0
        cartItems.forEach { shoe in
            total += shoe.price
        }
        return total
    }
    
    private func confirmedOrder() {
        PurchaseService.shared.didPurchase(Purchase(shoes: cartItems, date: Date()))
        for shoe in self.cartItems {
            ShoeService.shared.removeFromCart(shoe)
        }
        didUpdateShoes()
        let bottomsSheetVC = BottomSheetViewController()
        bottomsSheetVC.delegate = self
        let navigationController = UINavigationController(rootViewController: bottomsSheetVC)
        present(navigationController, animated: true, completion: nil)
    }
}

extension CartViewController : BottomSheetViewControllerDelegate {
    func didTapBackToShopping() {
        navigationController?.popToRootViewController(animated: true)
    }
}

extension CartViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.identifier, for: indexPath) as? CartTableViewCell else {
            return UITableViewCell()
        }
        cell.shoe = cartItems[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive,
                                        title: "Delete") { [weak self] (action, view, completionHandler) in
                                            self?.handleDeleteShoe(self?.cartItems[indexPath.row])
                                            completionHandler(true)
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    private func handleDeleteShoe(_ shoe : Shoe?) {
        ShoeService.shared.removeFromCart(shoe!)
        didUpdateShoes()
    }
}

extension CartViewController : ShoeServiceDelegate {
    func didUpdateShoes() {
        cartItems = ShoeService.shared.cart
        tableView.reloadData()
        if cartItems.isEmpty {
            confirmButton.isHidden = true
            cartTotalView.isHidden = true
            tableView.isHidden = true
            emptyCartLabel.isHidden = false
            findLabel.isHidden = false
        }
        else {
            confirmButton.isHidden = false
            cartTotalView.isHidden = false
            tableView.isHidden = false
            emptyCartLabel.isHidden = true
            findLabel.isHidden = true
        }
    }
}

