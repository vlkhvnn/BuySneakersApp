//
//  Purchase.swift
//  BuySneakers
//
//  Created by Alikhan Tangirbergen on 25.10.2023.
//

import Foundation

class Purchase {
    private var id : String
    private var shoes : [Shoe]
    private var date : Date
    init(id: String, shoes: [Shoe], date: Date) {
        self.id = UUID().uuidString
        self.shoes = shoes
        self.date = date
    }
}
