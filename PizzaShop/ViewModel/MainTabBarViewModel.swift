//
//  MainTabBarViewModel.swift
//  PizzaShop
//
//  Created by Юрий Феткуллин on 25.12.2025.
//

import Foundation
import FirebaseAuth

class MainTabBarViewModel: ObservableObject {

    @Published var user: User

    init(user: User) {
        self.user = user
    }
}
