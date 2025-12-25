//
//  CatalogViewModel.swift
//  PizzaShop
//
//  Created by Юрий Феткуллин on 24.12.2025.
//

import Foundation

class CatalogViewModel: ObservableObject {

    static let shared = CatalogViewModel()

    var popularProducts = [
        Product(id: "1",
                title: "Пеперони",
                imageUrl: "Not found",
                price: 100,
                description: "Oh, know!"),
        Product(id: "2",
                title: "Гавайская",
                imageUrl: "Not found",
                price: 200,
                description: "Oh, not know!"),
        Product(id: "3",
                title: "Малевич",
                imageUrl: "Not found",
                price: 300,
                description: "Oh, know!"),
        Product(id: "4",
                title: "Домашняя",
                imageUrl: "Not found",
                price: 400,
                description: "Oh, not know!")
    ]

    var pizza = [
        Product(id: "1",
                title: "Пеперони",
                imageUrl: "Not found",
                price: 100,
                description: "Oh, know!"),
        Product(id: "2",
                title: "Гавайская",
                imageUrl: "Not found",
                price: 200,
                description: "Oh, not know!"),
        Product(id: "3",
                title: "Малевич",
                imageUrl: "Not found",
                price: 300,
                description: "Oh, know!"),
        Product(id: "4",
                title: "Домашняя",
                imageUrl: "Not found",
                price: 400,
                description: "Oh, not know!")
    ]
}
