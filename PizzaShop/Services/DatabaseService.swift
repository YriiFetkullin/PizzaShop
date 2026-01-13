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

    private var ordersRef: CollectionReference {
        return db.collection("orders")
    }

    private init() { }

    func getOrders(by userID: String?,
                   completion: @escaping (Result<[Order], Error>) -> ()) {
        self.ordersRef.getDocuments { qSnap, error in
            if let qSnap = qSnap {
                var orders = [Order]()
                for doc in qSnap.documents {
                    if let userID {
                        if let order = Order(doc: doc), order.userID == userID {
                            orders.append(order)
                        }
                    } else { // ветка админа
                        if let order = Order(doc: doc) {
                            orders.append(order)
                        }
                    }
                }
                completion(.success(orders))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }

    func setOrder(order: Order,
                  completion: @escaping (Result<Order, Error>) -> ()) {
        ordersRef.document(order.id).setData(order.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                self.setPositions(to: order.id, positions: order.positions) { result in
                    switch result {
                    case .success(let positions):
                        print(positions.count)
                        completion(.success(order))
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }

    func setPositions(to orderId: String,
                     positions: [Position],
                     completion: @escaping (Result<[Position], Error>) -> ()) {
        let positionRef = ordersRef.document(orderId).collection("positions")

        for position in positions {
            positionRef.document(position.id).setData(position.representation)
        }
        completion(.success(positions))
    }

    func setProfile(user: UserModel, completion: @escaping (Result<UserModel, Error>) -> ()) {
        usersRef.document(user.id).setData(user.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
    }

    func getProfile(completion: @escaping (Result<UserModel, Error>) -> ()) {
        usersRef.document(AuthService.shared.currentUser!.uid).getDocument { docSnapshot, error in

            guard let snap = docSnapshot else { return }
            guard let data = snap.data() else { return }
            guard let id = data["id"] as? String else { return }
            guard let name = data["name"] as? String else { return }
            guard let phone = data["phone"] as? Int else { return }
            guard let address = data["address"] as? String else { return }

            let user = UserModel(id: id, name: name, phone: phone, address: address)

            completion(.success(user))

        }
    }
}
