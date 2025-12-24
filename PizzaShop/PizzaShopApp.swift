//
//  PizzaShopApp.swift
//  PizzaShop
//
//  Created by Юрий Феткуллин on 22.12.2025.
//

import SwiftUI

// хранит размеры экрана устройства на котором запущено приложение
let screen = UIScreen.main.bounds

@main
struct PizzaShopApp: App {
    var body: some Scene {
        WindowGroup {
            AuthView()
        }
    }
}
