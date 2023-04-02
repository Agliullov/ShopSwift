//
//  SignInView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 11.03.2023.
//

import SwiftUI
import AGLUI

struct SignInView: View {
    
    @StateObject private var viewRouter: TabBarRouterViewModel = .init()
    @StateObject private var authService: AuthorizationService = .init()
    
    var body: some View {
        if authService.authenticated {
            CustomTabBarView(viewRouter: viewRouter).environmentObject(authService)
        } else {
            ScrollView {
                VStack(spacing: 35.0) {
                    SignInTextFieldsView().environmentObject(authService)
                    SignInButtonView().environmentObject(authService)
                }
                .padding(.horizontal, 43.0)
                
                SignInBottomView()
                    .environmentObject(viewRouter)
                    .environmentObject(authService)
            }
            .navigationBarHidden(true)
            .background(Color(uiColor: .systemBackground))
        }
    }
}
