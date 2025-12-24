//
//  CartViewModel.swift
//  PizzaShop
//
//  Created by Юрий Феткуллин on 24.12.2025.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var positions = [Position]()

    func addPosition(_ position: Position) {
        self.positions.append(position)
    }
}
