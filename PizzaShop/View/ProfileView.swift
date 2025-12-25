//
//  ProfileView.swift
//  PizzaShop
//
//  Created by Юрий Феткуллин on 23.12.2025.
//

import SwiftUI

struct ProfileView: View {

    @State var isAvaAlertPresented: Bool = false
    @State var isQuitAlertPresented: Bool = false
    @State var isAuthViewPresented: Bool = false

    var body: some View {
        VStack(alignment: .center) {
            HStack(spacing: 16) {
                Image(systemName: "person.circle")
                    .onTapGesture {
                        isAvaAlertPresented.toggle()
                    }
                    .confirmationDialog("От куда взять фотку?", isPresented: $isAvaAlertPresented) {
                        Button {
                            print("Library")
                        } label: {
                            Text("Из галереи")
                        }

                        Button {
                            print("Camera")
                        } label: {
                            Text("С Камеры")
                        }

                    }
                VStack(alignment: .leading, spacing: 12) {
                    Text("First Name Second Name")
                        .bold()
                    Text("+7 9999999999")
                }
            }
            .padding(.bottom)

            VStack(alignment: .leading, spacing: 8) {
                Text("Adress")
                    .bold()
                Text("Russian Federation, Moskowski region, St. Petersburg city")
            }

            // Таблица с заказами
            List {
                Text("Ваши заказы будут тут!")
            }
            .listStyle(.plain)

            Button {
                isQuitAlertPresented.toggle()
            } label: {
                Text("Выйти")
                    .padding()
                    .padding(.horizontal, 30)
                    .background(Color(.red))
                    .foregroundStyle(Color(.white))
                    .clipShape(RoundedRectangle(cornerRadius: 24))
            }
            .padding()
            .confirmationDialog("Точно ли выйти?", isPresented: $isQuitAlertPresented, titleVisibility: .visible) {
                Button {
                    isAuthViewPresented.toggle()
                } label: {
                    Text("Да")
                }
            }
            .fullScreenCover(isPresented: $isAuthViewPresented, onDismiss: nil) {
                AuthView()
            }
        }
    }
}

#Preview {
    ProfileView()
}
