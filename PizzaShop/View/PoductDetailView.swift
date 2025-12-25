//
//  PoductDetailView.swift
//  PizzaShop
//
//  Created by Юрий Феткуллин on 24.12.2025.
//

import SwiftUI

struct ProductDetailView: View {

    var viewModel: ProductDetailViewModel
    @State var size = "Маленькая"
    @State var count = 1

//    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Image("pizzaBg")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 260)
                HStack {
                    Text("\(viewModel.product.title)!")
                        .font(.title2.bold())
                        .padding(.top, 8)

                    Spacer()

                    Text("\(viewModel.getPrice(size: self.size))₽")
                        .font(.title2)
                }
                .padding(.horizontal)

                Text("\(viewModel.product.description)")
                    .padding(.leading, 20)
                    .padding(.top, 4)

                HStack {
                    Stepper("Количество", value: $count, in: 1...10)

                    Text("\(self.count)")
                        .padding(.leading, 32)
                }
                .padding(.horizontal, 20)

                Picker("Размер пицца", selection: $size) {
                    ForEach(viewModel.sizes, id: \.self) { item in
                        Text(item)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.vertical, 8)
                .padding(.horizontal, 20)

            }
            Button {
                var position = Position(id: UUID().uuidString,
                                        product: viewModel.product,
                                        count: self.count)

                position.product.price = viewModel.getPrice(size: self.size)

                CartViewModel.shared.addPosition(position)
//                presentationMode.wrappedValue.dismiss()
                dismiss.callAsFunction()

            } label: {
                Text("В корзину")
                    .padding()
                    .padding(.horizontal, 60)
                    .background(LinearGradient(colors: [Color("myYellow"), Color("myOrange")], startPoint: .leading, endPoint: .trailing))
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .foregroundStyle(Color("darkBrown"))
                    .font(.title3.bold())
            }

            Spacer()
        }
    }
}

#Preview {
    ProductDetailView(viewModel: ProductDetailViewModel(product: Product(id: "1",
                                                                         title: "Title",
                                                                         imageUrl: "Not found",
                                                                         price: 100,
                                                                         description: "Oh, know!")))
}
