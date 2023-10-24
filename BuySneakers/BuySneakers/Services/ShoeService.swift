//
//  ShoeService.swift
//  BuySneakers
//
//  Created by Alikhan Tangirbergen on 15.10.2023.
//

import UIKit

protocol ShoeServiceDelegate: AnyObject {
    func didUpdateShoes()
}

class ShoeService {
    
    static let shared = ShoeService()
    
    public var delegate: ShoeServiceDelegate?
    
    public var cart : [Shoe] = []
    
    public func getAllShoes() -> [Shoe] {
        return [
            Shoe(image: UIImage(named: "shoe1")!, brand: "Dolce & Gabbana", description: "Кеды с принтом граффити", price: 1251),
            
            Shoe(image: UIImage(named: "shoe2")!, brand: "Off-White", description: "Кроссовки Off-Court 3.0", price: 551),
            
            Shoe(image: UIImage(named: "shoe3")!, brand: "Jordan", description: "Кеды с принтом граффити", price: 1251),
            
            Shoe(image: UIImage(named: "shoe4")!, brand: "Jordan", description: "Кеды с принтом граффити", price: 1251),
            
            Shoe(image: UIImage(named: "shoe5")!, brand: "New Balance", description: "Кроссовки 993 Brown из\nколлаборации с Aimé Leon Dore", price: 325),
        ]

    }
    
    public func addToCart(_ shoe : Shoe) {
        if let shoeIndex = cart.firstIndex(where: { $0.equals(shoe) }) {
            cart[shoeIndex].quantity! += 1
        } else {
            shoe.quantity = 1
            cart.append(shoe)
        }
        DispatchQueue.main.async {
            self.delegate?.didUpdateShoes()
        }
        
    }
    
    public func removeFromCart(_ shoe : Shoe) {
        if let shoeIndex = cart.firstIndex(where: { $0.equals(shoe) }) {
            if cart[shoeIndex].quantity! > 1 {
                cart[shoeIndex].quantity! -= 1
            } else {
                cart.remove(at: shoeIndex)
            }
        }
        DispatchQueue.main.async {
            self.delegate?.didUpdateShoes()
        }
    }
}
