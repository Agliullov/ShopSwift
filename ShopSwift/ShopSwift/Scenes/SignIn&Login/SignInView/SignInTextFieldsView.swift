//
//  SignInTextFieldsView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 02.04.2023.
//

import SwiftUI
import AGLUI

struct SignInTextFieldsView: View {
    
    @EnvironmentObject private var authService: AuthorizationService
    
    var body: some View {
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
    }
}
