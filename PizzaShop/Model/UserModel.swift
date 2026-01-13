//
//  UserModel.swift
//  PizzaShop
//
//  Created by Юрий Феткуллин on 25.12.2025.
//

import Foundation
import FirebaseFirestore

struct UserModel:Identifiable {

    var id: String
    var name: String
    var phone: Int
    var address: String

    var representation: [String: Any] {
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["name"] = self.name
        repres["phone"] = self.phone
        repres["address"] = self.address

        return repres
    }
}
