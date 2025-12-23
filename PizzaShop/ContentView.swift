//
//  ContentView.swift
//  PizzaShop
//
//  Created by Юрий Феткуллин on 22.12.2025.
//

import SwiftUI

struct ContentView: View {

    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Авторизация")
                .padding()
                .padding(.horizontal, 30)
                .font(.title2.bold())
                .background(Color("whiteAlpha"))
                .cornerRadius(10)

            VStack {
                TextField("Введите e-mail", text: $email)
                    .padding()
                    .background(Color("whiteAlpha"))
                    .cornerRadius(12)
                    .padding(8)
                    .padding(.horizontal, 12)

                SecureField("Введите ваш пароль", text: $password)
                    .padding()
                    .background(Color("whiteAlpha"))
                    .cornerRadius(12)
                    .padding(8)
                    .padding(.horizontal, 12)

                Button {
                    print("Авторизация")
                } label: {
                    Text("Войти")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(colors: [Color("myYellow"), Color("myOrange")], startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(12)
                        .padding(8)
                        .padding(.horizontal, 12)
                        .font(.title3.bold())
                        .foregroundStyle(Color("darkBrown"))
                }

                Button {
                    print("Ещё не с нами?")
                } label: {
                    Text("Ещё не с нами?")
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(12)
                        .padding(8)
                        .padding(.horizontal, 12)
                        .font(.title3.bold())
                        .foregroundStyle(Color("darkBrown"))
                }
            }
            .padding()
            .padding(.top, 20)
            .background(Color("whiteAlpha"))
            .cornerRadius(24)
            .padding(30)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("bg").ignoresSafeArea())
    }
}

#Preview {
    ContentView()
}
