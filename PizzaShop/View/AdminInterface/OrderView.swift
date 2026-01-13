//
//  OrderView.swift
//  PizzaShop
//
//  Created by Юрий Феткуллин on 13.01.2026.
//

import SwiftUI

struct OrderView: View {

    @StateObject var viewModel: OrderViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("\(viewModel.user.name)")
                .fontWeight(.bold)
                .font(.title3)
            Text("\(viewModel.user.phone)")
                .fontWeight(.bold)
            Text("\(viewModel.user.address)")

            List {
                ForEach(viewModel.order.positions, id: \.id) { position in
                    PositionCell(position: position)
                }
                Text("Итого: \(viewModel.order.cost) ₽")
                    .fontWeight(.bold)
            }
        }
        .padding()
        .onAppear {
            viewModel.getUserData()
        }
    }
}

#Preview {
    OrderView(viewModel: OrderViewModel(order: Order(userID: "",
                                                     date: Date(),
                                                     status: "Новый")))
}
