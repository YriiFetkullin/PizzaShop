//
//  Catalog.swift
//  PizzaShop
//
//  Created by Юрий Феткуллин on 23.12.2025.
//

import SwiftUI

struct CatalogView: View {

    let layoutForPopular = [GridItem(.adaptive(minimum: screen.width / 2.2))]
    let layoutForPizza = [GridItem(.adaptive(minimum: screen.width / 2.4))]
    @StateObject var viewModel = CatalogViewModel()

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {

            Section("Рекомендуемые") {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: layoutForPopular, spacing: 12) {
                        ForEach(viewModel.popularProducts, id: \.id) { item in
                            NavigationLink {
                                let viewModel = ProductDetailViewModel(product: item)
                                ProductDetailView(viewModel: viewModel)
                            } label: {
                                ProductCell(product: item)
                                    .foregroundStyle(Color(.black))
                            }
                        }
                    }
                    .padding()
                }
            }

            Section("Пицца") {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: layoutForPizza, spacing: 60) {
                        ForEach(viewModel.pizza, id: \.id) { item in
                            NavigationLink {
                                let viewModel = ProductDetailViewModel(product: item)
                                ProductDetailView(viewModel: viewModel)
                            } label: {
                                ProductCell(product: item)
                                    .foregroundStyle(Color(.black))
                            }
                        }
                    }
                    .padding()
                }
                .navigationTitle("Каталог")
                .onAppear {
                    viewModel.getProducts()
                }
            }
        }
    }
}

#Preview {
    CatalogView()
}
