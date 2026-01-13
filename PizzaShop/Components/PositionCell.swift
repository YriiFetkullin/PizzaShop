//
//  PositionCell.swift
//  PizzaShop
//
//  Created by Юрий Феткуллин on 25.12.2025.
//

import SwiftUI

struct PositionCell: View {

    let position: Position

    var body: some View {
        HStack {
            Text(position.product.title)
                .fontWeight(.bold)

            Spacer()

            Text("\(position.count) шт.")
            Text("\(position.cost) ₽")
                .frame(width: 85, alignment: .trailing)
        }
        .padding(.horizontal)
    }
}

#Preview {
    PositionCell(position: Position(
            id: UUID().uuidString,
            product: Product(
                id: UUID().uuidString,
                title: "Name",
                imageUrl: "pizzaBg",
                price: 200,
                description: "nil"
            ),
            count: 1
        )
    )
}

