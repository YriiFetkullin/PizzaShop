//
//  CartView.swift
//  PizzaShop
//
//  Created by Юрий Феткуллин on 23.12.2025.
//

import SwiftUI

struct CartView: View {

    @StateObject var viewModel: CartViewModel

    var body: some View {
        VStack {
            List(viewModel.positions) { position in
                PositionCell(position: position)
                    .swipeActions {
                        Button {
                            viewModel.positions.removeAll(where: { $0.id == position.id })
                        } label: {
                            Text("Удалить")
                        }
                        .tint(.red)

                    }
            }
            .listStyle(.plain)
            .frame(maxHeight: .infinity)
            .navigationTitle("Корзина")

            HStack {
                Text("ИТОГО:")
                    .fontWeight(.bold)
                Spacer()
                Text("\(self.viewModel.cost)")
                    .fontWeight(.bold)
            }
            .padding()

            HStack(spacing: 24) {
                Button {
                    print("Отменить")
                } label: {
                    Text("Отменить")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundStyle(Color(.white))
                        .background(Color.red)
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                }

                Button {
                    print("Заказать")
                } label: {
                    Text("Заказать")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundStyle(Color(.white))
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                }
            }
            .padding()
        }
    }
}

#Preview {
    CartView(viewModel: CartViewModel.shared)
}
