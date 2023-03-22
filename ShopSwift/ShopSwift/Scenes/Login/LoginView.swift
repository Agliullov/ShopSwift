//
//  LoginViewController.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 13.03.2023.
//

import SwiftUI
import AGLUI

struct LoginView: View {
    
    @StateObject var viewRouter = ViewRouter()
    @StateObject var authService = AuthorizationService()
    
    @State private var isSecured: Bool = true
    
    var body: some View {
        if authService.authenticated {
            CustomTabBarView(viewRouter: viewRouter)
        } else {
            ScrollView {
                VStack(spacing: 35.0) {
                    Spacer()
                    Text("Welcome back")
                        .font(.largeTitle.bold())
                    Spacer()
                    TextField("First name", text: $authService.inputFirstName)
                        .textContentType(.name)
                        .multilineTextAlignment(.center)
                        .frame(height: 29.0)
                        .font(.footnote)
                        .background(RoundedRectangle(cornerRadius: 14.5)
                                        .fill(Color(uiColor: .secondarySystemBackground)))
                    HStack() {
                        if isSecured {
                            SecureField("Password", text: $authService.password)
                                .multilineTextAlignment(.center)
                                .font(.footnote)
                                .foregroundColor(Color(uiColor: .secondaryLabel))
                                .frame(height: 29.0)
                                .padding(.leading, 16.0 + 20.0)
                        } else {
                            TextField("Password", text: $authService.password)
                                .multilineTextAlignment(.center)
                                .font(.footnote)
                                .foregroundColor(Color(uiColor: .secondaryLabel))
                                .frame(height: 29.0)
                                .padding(.leading, 16.0 + 20.0)
                        }
                        Button {
                            isSecured.toggle()
                        } label: {
                            Image(systemName: self.isSecured ? "eye.slash" : "eye")
                                .frame(width: 13.5, height: 13.5, alignment: .center)
                                .accentColor(.gray)
                        }
                        .padding(.trailing, 16.0)
                    }
                    .background(RoundedRectangle(cornerRadius: 14.5)
                                    .fill(Color(uiColor: .secondarySystemBackground)))
                    .padding(.bottom, 70.0)
                    Button() {
                        authService.logInAuthenticate()
                    } label: {
                        Text("Login")
                            .foregroundColor(Color(uiColor: .systemBackground))
                            .font(.body)
                    }
                    .frame(height: 50.0)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 20.0)
                                    .fill(Color(uiColor: .systemIndigo)))
                    .alert(isPresented: $authService.invalid) {
                        Alert(title: Text("Ошибка авторизации"), message: Text("Неправильный логин или пароль"), dismissButton: .default(Text("ОК")))
                    }
                }
                .padding(.horizontal, 43.0)
            }
            .background(Color(uiColor: .systemBackground))
        }
    }
}
