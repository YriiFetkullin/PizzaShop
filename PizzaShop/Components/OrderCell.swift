//
//  OrderCell.swift
//  PizzaShop
//
//  Created by Юрий Феткуллин on 29.12.2025.
//

import SwiftUI
import FirebaseFirestore

struct OrderCell: View {

    var order: Order

    var body: some View {
        HStack {
            Text("\(order.date)")
            Text("\(order.cost)")
                .bold()
                .frame(width: 90)
            Text("\(order.status)")
                .frame(width: 100)
                .foregroundStyle(Color(.green))
        }
    }
}

//#Preview {
//    OrderCell()
//}
