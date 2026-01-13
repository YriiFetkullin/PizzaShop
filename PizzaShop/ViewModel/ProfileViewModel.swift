//
//  ProfileViewModel.swift
//  PizzaShop
//
//  Created by Юрий Феткуллин on 27.12.2025.
//

import Foundation

class ProfileViewModel: ObservableObject {

    @Published var profile: UserModel
    @Published var orders: [Order] = [Order]()

    init(profile: UserModel) {
        self.profile = profile
    }

    func getOrders() {
        DatabaseService.shared.getOrders(by: AuthService.shared.currentUser!.accessibilityHint) { result in
            switch result {
                
            case .success(let orders):
                self.orders = orders
                print("Всего заказов: \(orders.count)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func setProfile() {
        DatabaseService.shared.setProfile(user: self.profile) { result in
            switch result {

            case .success(let user):
                print(user.name)
            case .failure(let error):
                print("Ошибка отпарвки данных \(error.localizedDescription)")
            }
        }
    }

    func getProfile() {
        DatabaseService.shared.getProfile { result in
            switch result {

            case .success(let user):
                self.profile = user
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
