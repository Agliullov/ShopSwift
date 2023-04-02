//
//  SignInButtonView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 02.04.2023.
//

import SwiftUI

struct SignInButtonView: View {
    
    @EnvironmentObject private var authService: AuthorizationService
    
    var body: some View {
        Button {
            authService.signInAuthenticate()
        } label: {
            Text("Sign in")
                .foregroundColor(Color(uiColor: .systemBackground))
                .font(.body)
        }
        .opacity(authService.isSignUpComplete ? 1 : 0.6)
        .disabled(!authService.isSignUpComplete)
        .frame(height: 50.0)
        .frame(maxWidth: .infinity)
        .background(RoundedRectangle(cornerRadius: 20.0)
                        .fill(Color(uiColor: .systemIndigo)))
        .alert(isPresented: $authService.isUserAlreadyExist) {
            Alert(
                title: Text("Ошибка авторизации"),
                message: Text("Пользователь с такими данными уже есть"),
                dismissButton: .default(Text("OK")))
        }
    }
}
