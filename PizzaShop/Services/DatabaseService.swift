//
//  DatabaseService.swift
//  PizzaShop
//
//  Created by Юрий Феткуллин on 25.12.2025.
//

import Foundation
import FirebaseFirestore

class DatabaseService {
    static let shared = DatabaseService()

    private let db = Firestore.firestore()
    private var usersRef: CollectionReference {
        return db.collection("users")
    }

    private init() { }

    func setupUser(user: UserModel, completion: @escaping (Result<UserModel, Error>) -> ()) {
        usersRef.document(user.id).setData(user.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
    }
}
