//
//  Shoe.swift
//  BuySneakers
//
//  Created by Alikhan Tangirbergen on 15.10.2023.
//

import UIKit

class Shoe {
    private var id: String
    public var image: UIImage
    public var brand: String
    public var description: String
    public var price: Int
    public var quantity: Int?
    
    public init(image: UIImage, brand: String, description: String, price: Int) {
        self.id = UUID().uuidString
        self.image = image
        self.brand = brand
        self.description = description
        self.price = price
    }
    
    public func equals(_ shoe: Shoe) -> Bool {
        return self.id == shoe.id
    }
}
