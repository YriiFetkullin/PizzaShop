//
//  CartView.swift
//  PizzaShop
//
//  Created by Юрий Феткуллин on 23.12.2025.
//

import SwiftUI

struct CartView: View {

    var viewModel: CartViewModel

    var body: some View {
        Text("Cart")
    }
}

#Preview {
    CartView(viewModel: CartViewModel())
}
