//
//  OrderStatus.swift
//  PizzaShop
//
//  Created by Юрий Феткуллин on 29.12.2025.
//

import Foundation

enum OrderStatus: String, CaseIterable {

    case new = "Новый"
    case cooking = "Готовится"
    case delivery = "Доставляется"
    case complete = "Выполнен"
    case cancel = "Отменен"
}
