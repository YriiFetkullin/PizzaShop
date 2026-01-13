//
//  PizzaShopApp.swift
//  PizzaShop
//
//  Created by Юрий Феткуллин on 22.12.2025.
//

import SwiftUI
import Firebase
import FirebaseAuth

// хранит размеры экрана устройства на котором запущено приложение
let screen = UIScreen.main.bounds

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()

        print("OK")
        return true
    }
}

@main
struct PizzaShopApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {

            if let user = AuthService.shared.currentUser {
                if user.uid == "fhCZQbICQ0aKdhjrxYJQ1GBsSOl2" {
                    AdminOrdersView()
                } else {
                    let viewModel = MainTabBarViewModel(user: user)
                    MainTabBar(viewModel: viewModel)
                }
            } else {
                AuthView()
            }
        }
    }
}
