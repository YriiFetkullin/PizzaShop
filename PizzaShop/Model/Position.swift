//
//  Position.swift
//  PizzaShop
//
//  Created by Юрий Феткуллин on 24.12.2025.
//

import Foundation

struct Position: Identifiable {
    var id: String
    var product: Product
    var count: Int

    var cost: Int {
        return product.price * self.count
    }
}
