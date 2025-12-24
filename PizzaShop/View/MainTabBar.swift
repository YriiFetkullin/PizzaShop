//
//  MainTabBar.swift
//  PizzaShop
//
//  Created by Юрий Феткуллин on 23.12.2025.
//

import SwiftUI

struct MainTabBar: View {
    var body: some View {
        TabView {
            NavigationView {
                CatalogView()
            }
            .tabItem {
                VStack {
                    Image(systemName: "menucard")
                    Text("Каталог")
                }
            }

            CartView(viewModel: CartViewModel())
                .tabItem {
                    VStack {
                        Image(systemName: "cart")
                        Text("Корзина")
                    }
                }

            ProfileView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.circle")
                        Text("Профиль")
                    }
                }
        }
    }
}

#Preview {
    MainTabBar()
}
