//
//  OrderHistoryViewController.swift
//  BuySneakers
//
//  Created by Alikhan Tangirbergen on 28.10.2023.
//

import UIKit

class OrderHistoryViewController: UIViewController {
    
    public var purchases = PurchaseService.shared.getAllPurchases()
    
    public let tableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = Colors.grayMainBackground
        tableView.register(PurchaseTableViewCell.self, forCellReuseIdentifier: PurchaseTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.isUserInteractionEnabled = true
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.grayMainBackground
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        view.isUserInteractionEnabled = true
        navigationItem.title = "Order History"
        navigationItem.backButtonTitle = ""
        applyConstraints()
    }
    
    private func applyConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

extension OrderHistoryViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return purchases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PurchaseTableViewCell.identifier, for: indexPath) as? PurchaseTableViewCell else {
            return UITableViewCell()
        }
        cell.purchase = purchases[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = OrderViewController()
        vc.purchase = purchases[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

