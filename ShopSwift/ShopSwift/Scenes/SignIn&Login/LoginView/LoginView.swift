//
//  LoginViewController.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 13.03.2023.
//

import SwiftUI
import AGLUI

struct LoginView: View {
    
    @EnvironmentObject private var viewRouter: TabBarRouterViewModel
    @EnvironmentObject private var authService: AuthorizationService
    
    var body: some View {
        if authService.authenticated {
            CustomTabBarView(viewRouter: viewRouter).environmentObject(authService)
        } else {
            LoginTextFieldsView().environmentObject(authService)
        }
    }
}
