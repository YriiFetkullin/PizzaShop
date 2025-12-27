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

    @ObservedObject var viewModel: ProfileViewModel

    var body: some View {
        VStack(alignment: .center) {
            HStack(spacing: 16) {
                Image("user")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .background(Color("bgUser"))
                    .clipShape(.circle)
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
                    TextField("Имя", text: $viewModel.profile.name)
                        .font(.body.bold())
                    HStack {
                        Text("+7")
                        TextField("Телефон", value: $viewModel.profile.phone, format: .number)
                    }
                }
            }
            .padding(.leading)
            .padding(.bottom)

            VStack(alignment: .leading, spacing: 8) {
                Text("Адрес доставки:")
                    .bold()
                TextField("Ваш адрес", text: $viewModel.profile.address)
            }
            .padding(.horizontal)

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
        .onSubmit {
            self.viewModel.setProfile()
        }
        .onAppear {
            self.viewModel.getProfile()
        }
    }
}

#Preview {
    ProfileView(viewModel: ProfileViewModel(profile: UserModel(id: "",
                                                               name: "Ivan",
                                                               phone: 899999999,
                                                               address: "street pain")))
}
