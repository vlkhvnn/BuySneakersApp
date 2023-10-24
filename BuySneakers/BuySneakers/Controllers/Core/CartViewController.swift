//
//  CartViewController.swift
//  BuySneakers
//
//  Created by Alikhan Tangirbergen on 12.10.2023.
//

import UIKit

class CartViewController: UIViewController {
    
    public var cartItems = [Shoe]()
    
    public let tableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = Colors.grayMainBackground
        tableView.register(CartTableViewCell.self, forCellReuseIdentifier: CartTableViewCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private var confirmButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 24
        button.addTarget(self, action: #selector(confirmOrder), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.addSubview(confirmButton)
        tableView.delegate = self
        tableView.dataSource = self
        ShoeService.shared.delegate = self
        view.backgroundColor = Colors.grayMainBackground
        navigationItem.title = "Cart"
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
    }
    
    @objc
    private func confirmOrder() {
        
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
}

extension CartViewController : ShoeServiceDelegate {
    func didUpdateShoes() {
        print("Delegate successfully called")
        cartItems = ShoeService.shared.cart
        tableView.reloadData()
    }
}

