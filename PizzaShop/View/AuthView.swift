//
//  ContentView.swift
//  PizzaShop
//
//  Created by Юрий Феткуллин on 22.12.2025.
//

import SwiftUI

struct AuthView: View {

    @State private var isAuth = true
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""

    @State private var isTabViewShow = false

    var body: some View {
        VStack(spacing: 20) {
            Text(isAuth ? "Авторизация" : "Регистрация")
                .padding(isAuth ? 16 : 24)
                .padding(.horizontal, 30)
                .font(.title2.bold())
                .background(Color("whiteAlpha"))
                .cornerRadius(isAuth ? 30 : 60)

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

                if !isAuth {
                    SecureField("Повторите ваш пароль", text: $confirmPassword)
                        .padding()
                        .background(Color("whiteAlpha"))
                        .cornerRadius(12)
                        .padding(8)
                        .padding(.horizontal, 12)
                }

                Button {
                    if isAuth {
                        print("Авторизация пользователя")
                        isTabViewShow.toggle()
                    } else {
                        print("Регистрация пользователя")
                        self.email = ""
                        self.password = ""
                        self.confirmPassword = ""
                        self.isAuth.toggle()
                    }
                } label: {
                    Text(isAuth ? "Войти" : "Создать аккаунт")
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
                    isAuth.toggle()
                } label: {
                    Text(isAuth ? "Ещё не с нами?" : "Уже есть аккаунт!")
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
            .padding(isAuth ? 30 : 12)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("bg")
            .ignoresSafeArea()
            .blur(radius: isAuth ? 0 : 6)
        )
        .animation(Animation.easeInOut(duration: 0.2), value: isAuth)
        .fullScreenCover(isPresented: $isTabViewShow) {
            MainTabBar()
        }
    }
}

#Preview {
    AuthView()
}
