//
//  PoductDetailView.swift
//  PizzaShop
//
//  Created by Юрий Феткуллин on 24.12.2025.
//

import SwiftUI

struct ProductDetailView: View {

    var product: Product

    var body: some View {
        Text("\(product.title)!")
    }
}

#Preview {
    ProductDetailView(product: Product(id: "1",
                                      title: "Маргарита",
                                      imageUrl: "Not found",
                                      price: 100,
                                      description: "Oh, know!"))
}
