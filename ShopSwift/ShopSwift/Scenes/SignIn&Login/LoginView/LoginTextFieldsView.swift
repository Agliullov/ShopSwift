//
//  LoginTextFieldsView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 02.04.2023.
//

import SwiftUI

struct LoginTextFieldsView: View {
    
    @EnvironmentObject private var authService: AuthorizationService
    
    @State private var isSecured: Bool = true
    
    var body: some View {
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
                
                HStack {
                    HStack {
                        if isSecured {
                            SecureField("Password", text: $authService.password)
                        } else {
                            TextField("Password", text: $authService.password)
                        }
                    }
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .foregroundColor(Color(uiColor: .secondaryLabel))
                    .frame(height: 29.0)
                    .padding(.leading, 36.0)
                    
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
                .opacity(authService.isLogInComplete ? 1 : 0.6)
                .disabled(!authService.isLogInComplete)
                .frame(height: 50.0)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 20.0)
                                .fill(Color(uiColor: .systemIndigo)))
                .alert(isPresented: $authService.isInvalidAuthorization) {
                    Alert(
                        title: Text("Ошибка авторизации"),
                        message: Text("Неправильный логин или пароль"),
                        dismissButton: .default(Text("ОК")))
                }
            }
            .padding(.horizontal, 43.0)
        }
        .background(Color(uiColor: .systemBackground))
    }
}
