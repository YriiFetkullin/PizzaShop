//
//  ProductCell.swift
//  PizzaShop
//
//  Created by Юрий Феткуллин on 24.12.2025.
//

import SwiftUI

struct ProductCell: View {

    var product: Product

    var body: some View {
        VStack(spacing: 2) {
            Image("pizzaBg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: screen.width * 0.45)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 16))

            HStack {
                Text(product.title)
                    .font(.custom("AvenirNext-regular", size: 12))

                Spacer()

                Text("\(product.price)₽")
                    .font(.custom("AvenirNext-bold", size: 12))
            }
            .padding(.horizontal, 6)
            .padding(.bottom, 6)
        }
        .frame(width: screen.width * 0.45, height: screen.width * 0.55)
    }
}

#Preview {
    ProductCell(product: Product(id: "1",
                                 title: "Title",
                                 imageUrl: "Not found",
                                 price: 100,
                                 description: "Oh, know!"))
}
