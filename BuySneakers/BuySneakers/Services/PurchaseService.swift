//
//  PurchaseService.swift
//  BuySneakers
//
//  Created by Alikhan Tangirbergen on 28.10.2023.
//

import Foundation
import UIKit

class PurchaseService {
    static let shared = PurchaseService()
    
    private var purchases : [Purchase] = [
        Purchase(shoes: [Shoe(image: UIImage(named: "shoe1")!, brand: "Dolce & Gabbana", description: "Кеды с принтом граффити", price: 1251),], date: Date()),
        Purchase(shoes: [
            Shoe(image: UIImage(named: "shoe1")!, brand: "Dolce & Gabbana", description: "Кеды с принтом граффити", price: 1251),
            
            Shoe(image: UIImage(named: "shoe2")!, brand: "Off-White", description: "Кроссовки Off-Court 3.0", price: 551)],
                 date: Date())
    ]
    
    public func getAllPurchases() -> [Purchase] {
        return purchases
    }
    
    public func didPurchase(_ purchase : Purchase) {
        purchases.append(purchase)
    }
    
}
