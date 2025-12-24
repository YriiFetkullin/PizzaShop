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

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Section("Рекомендуемые") {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: layoutForPopular, spacing: 12) {
                        ForEach(CatalogViewModel.shared.popularProducts, id: \.id) { item in
                            NavigationLink {
                                ProductDetailView(product: item)
                            } label: {
                                ProductCell(product: item)
                                    .foregroundStyle(Color(.black))
                            }
                        }
                    }
                    .padding()
                }
            }

            Section("Рекомендуемые") {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: layoutForPizza, spacing: 60) {
                        ForEach(CatalogViewModel.shared.pizza, id: \.id) { item in
                            NavigationLink {
                                ProductDetailView(product: item)
                            } label: {
                                ProductCell(product: item)
                                    .foregroundStyle(Color(.black))
                            }
                        }
                    }
                    .padding()
                }
                .navigationTitle("Каталог")
            }
        }
    }
}

#Preview {
    CatalogView()
}
