//
//  MainTabBar.swift
//  PizzaShop
//
//  Created by Юрий Феткуллин on 23.12.2025.
//

import SwiftUI

struct MainTabBar: View {

    var viewModel: MainTabBarViewModel

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

            CartView(viewModel: CartViewModel.shared)
                .tabItem {
                    VStack {
                        Image(systemName: "cart")
                        Text("Корзина")
                    }
                }

            ProfileView(viewModel: ProfileViewModel(profile: UserModel(id: "",
                                                                       name: "",
                                                                       phone: 0000000,
                                                                       address: "")))
                .tabItem {
                    VStack {
                        Image(systemName: "person.circle")
                        Text("Профиль")
                    }
                }
        }
    }
}
