//
//  AddProductView.swift
//  PizzaShop
//
//  Created by Юрий Феткуллин on 14.01.2026.
//

import SwiftUI

struct AddProductView: View {

    @State private var showImagePicker = false
    @State private var image = UIImage(named: "pizzaBg")!
    @State private var title: String = ""
    @State private var descr: String = ""
    @State private var price: Int? = nil
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            Text("Добавить товар")
                .font(.title2.bold())

            Image(uiImage: image)
                .resizable()
                .frame(maxWidth: .infinity, minHeight: 300, maxHeight: 320)
                .aspectRatio(contentMode: .fit)
                .onTapGesture {
                    showImagePicker.toggle()
                }
                .clipShape(RoundedRectangle(cornerRadius: 24))

            TextField("Название продукта", text: $title)
                .padding()
            TextField("Цена продукта", value: $price, format: .number)
                .padding()
                .keyboardType(.numberPad)
            TextField("Описание продукта", text: $descr)
                .padding()

            Button {
                guard let price = price else {
                    print("Невозможно извлечь цену из TextField")
                    return
                }
                let product = Product(id: UUID().uuidString, title: title, price: price, description: descr)
                guard let imageData = image.jpegData(compressionQuality: 0.15) else { return }
                DatabaseService.shared.setProduct(product: product, image: imageData) { result in
                    switch result {
                    case .success(let product):
                        print(product.title)
                        dismiss()
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            } label: {
                Text("Сохранить")
                    .padding()
                    .padding(.horizontal, 30)
                    .background(.blue)
                    .foregroundStyle(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }

            Spacer()

        }
        .padding()
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(sourceType: .photoLibrary, selectorImage: $image)
        }
    }
}

#Preview {
    AddProductView()
}
