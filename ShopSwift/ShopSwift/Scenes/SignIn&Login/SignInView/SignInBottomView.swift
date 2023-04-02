//
//  SignInBottomView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 02.04.2023.
//

import SwiftUI

struct SignInBottomView: View {
    
    @EnvironmentObject private var viewRouter: TabBarRouterViewModel
    @EnvironmentObject private var authService: AuthorizationService
    
    var body: some View {
        VStack {
            HStack(spacing: 8.0) {
                Text("Already have an account?")
                    .font(.footnote)
                    .foregroundColor(Color(uiColor: .secondaryLabel))
                
                Button {
                    authService.isShowLogInSheetView.toggle()
                } label: {
                    Text("Log in")
                        .foregroundColor(Color(uiColor: .systemBlue))
                        .font(.footnote)
                }
                .sheet(isPresented: $authService.isShowLogInSheetView, onDismiss: nil) {
                    LoginView()
                        .environmentObject(viewRouter)
                        .environmentObject(authService)
                }
                Spacer()
            }
        }
        .padding(.horizontal, 43.0)
        .padding(.top, 16.0)
        
        VStack(alignment: .leading, spacing: 45.0) {
            HStack(spacing: 10.0) {
                Image("icon_google")
                Text("Sign in with Google")
                    .font(.body)
                    .foregroundColor(Color(uiColor: .label))
            }
            HStack(spacing: 10.0) {
                Image("icon_apple")
                Text("Sign in with Apple")
                    .font(.body)
                    .foregroundColor(Color(uiColor: .label))
            }
        }
        .padding(.top, 70.0)
    }
}
