//
//  Purchase.swift
//  BuySneakers
//
//  Created by Alikhan Tangirbergen on 25.10.2023.
//

import Foundation

class Purchase {
    private var id : String
    public var shoes : [Shoe]
    public var date : Date
    init(shoes: [Shoe], date: Date) {
        self.id = UUID().uuidString
        self.shoes = shoes
        self.date = date
    }
}
