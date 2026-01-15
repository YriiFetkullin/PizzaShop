//
//  ProductCell.swift
//  PizzaShop
//
//  Created by Юрий Феткуллин on 24.12.2025.
//

import SwiftUI

struct ProductCell: View {

    var product: Product
    @State private var uiImage: UIImage = UIImage(named: "pizzaBg") ?? UIImage()

    var body: some View {
        VStack(spacing: 2) {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: screen.width * 0.45)
                .clipped()

            HStack {
                Text(product.title)
                    .font(.custom("AvenirNext-regular", size: 12))

                Spacer()

                Text("\(product.price)₽")
                    .font(.custom("AvenirNext-bold", size: 12))
            }
            .padding(.horizontal, 6)
            .padding(.bottom, 6)
        }
        .frame(width: screen.width * 0.45, height: screen.width * 0.55)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 4)
        .onAppear {
            StorageService.shared.downloadImage(id: self.product.id) { result in
                switch result {
                case .success(let data):
                    if let img = UIImage(data: data) {
                        self.uiImage = img
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    ProductCell(product: Product(id: "1",
                                 title: "Title",
                                 imageUrl: "Not found",
                                 price: 100,
                                 description: "Oh, know!"))
}
