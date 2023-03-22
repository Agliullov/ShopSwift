//
//  SignInView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 11.03.2023.
//

import SwiftUI
import AGLUI

struct SignInView: View {
    
    @StateObject private var viewRouter = ViewRouter()
    @StateObject private var authService = AuthorizationService()
    
    @State var isShowLogInSheetView: Bool = false
    
    var body: some View {
        if authService.authenticated {
            CustomTabBarView(viewRouter: viewRouter)
        } else {
            ScrollView {
                VStack(spacing: 35.0) {
                    Text("Sign in")
                        .font(.custom(Montserrat.semiBold, size: 24.0))
                        .padding(.top, 100.0)
                        .padding(.bottom, 65.0)
                    TextField("First name", text: $authService.inputFirstName)
                        .textContentType(.name)
                        .multilineTextAlignment(.center)
                        .frame(height: 29.0)
                        .font(.footnote)
                        .background(RoundedRectangle(cornerRadius: 14.5)
                                        .fill(Color(uiColor: .secondarySystemBackground)))
                    TextField("Last name", text: $authService.inputLastname)
                        .textContentType(.middleName)
                        .multilineTextAlignment(.center)
                        .frame(height: 29.0)
                        .font(.footnote)
                        .background(RoundedRectangle(cornerRadius: 14.5)
                                        .fill(Color(uiColor: .secondarySystemBackground)))
                    TextField("Email", text: $authService.inputEmail)
                        .textContentType(.emailAddress)
                        .multilineTextAlignment(.center)
                        .frame(height: 29.0)
                        .font(.footnote)
                        .background(RoundedRectangle(cornerRadius: 14.5)
                                        .fill(Color(uiColor: .secondarySystemBackground)))
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
                        Alert(title: Text("Ошибка авторизации"), message: Text("Пользователь с такими данными уже есть"), dismissButton: .default(Text("OK")))
                    }
                }
                .padding(.horizontal, 43.0)
                
                if authService.authenticated {
                    CustomTabBarView(viewRouter: viewRouter)
                }
                
                VStack {
                    HStack(spacing: 8.0) {
                        Text("Already have an account?")
                            .font(.footnote)
                            .foregroundColor(Color(uiColor: .secondaryLabel))
                        Button {
                            isShowLogInSheetView.toggle()
                        } label: {
                            Text("Log in")
                                .foregroundColor(Color(uiColor: .systemBlue))
                                .font(.footnote)
                        }
                        .sheet(isPresented: $isShowLogInSheetView, onDismiss: nil) {
                            LoginView()
                        }
                        Spacer()
                    }
                }
                .padding(.horizontal, 43.0)
                .padding(.top, 16.0)
                
                VStack(alignment: .center, spacing: 45.0) {
                    HStack(spacing: 10.0) {
                        Image("icon_google", bundle: nil)
                        Text("Sign in with Google")
                            .font(.body)
                            .foregroundColor(Color(uiColor: .label))
                    }
                    HStack(spacing: 10.0) {
                        Image("icon_apple", bundle: nil)
                        Text("Sign in with Apple")
                            .font(.body)
                            .foregroundColor(Color(uiColor: .label))
                    }
                }
                .padding(.top, 70.0)
            }
            .background(Color(uiColor: .systemBackground))
        }
    }
}

