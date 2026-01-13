//
//  AdminOrdersView.swift
//  PizzaShop
//
//  Created by Юрий Феткуллин on 13.01.2026.
//

import SwiftUI

struct AdminOrdersView: View {

    @StateObject var viewModel = AdminOrdersViewModel()
    @State var isOrderViewShow = false
    @State var isShowAuthView = false

    var body: some View {

        VStack {
            HStack {
                Button {
                    AuthService.shared.signOut()
                    isShowAuthView.toggle()
                } label: {
                    Text("Выход")
                        .foregroundStyle(Color.red)
                }

                Spacer()

                Button {
                    print("Добавить товар")
                } label: {
                    Text("Добавить товар")
                        .foregroundStyle(Color.white)
                        .padding()
                        .background(Color.green)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }

                Spacer()

                Button {
                    viewModel.getOrders()
                } label: {
                    Text("Обновить")
                }
            }
            .padding()

            List {
                ForEach(viewModel.orders, id: \.id) { order in
                    OrderCell(order: order)
                        .onTapGesture {
                            viewModel.currentOrder = order
                            isOrderViewShow.toggle()
                        }
                }
            }
            .listStyle(.plain)
            .onAppear {
                viewModel.getOrders()
            }
            .sheet(isPresented: $isOrderViewShow) {
                let orderViewModel = OrderViewModel(order: viewModel.currentOrder)
                OrderView(viewModel: orderViewModel)
            }
        }
        .fullScreenCover(isPresented: $isShowAuthView) {
            AuthView()
        }
    }
}

#Preview {
    AdminOrdersView()
}
