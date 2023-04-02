//
//  ProfileActionView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 31.03.2023.
//

import SwiftUI
import AGLUI

struct ProfileActionView: View {
    
    @EnvironmentObject private var authService: AuthorizationService
    
    var body: some View {
        if !authService.authenticated {
            SignInView()
        } else {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 25.0) {
                    ProfileActionHStackView(model: .init(iconName: "icon_balance", title: "Trade store", selectionType: .arrow))
                    ProfileActionHStackView(model: .init(iconName: "icon_balance", title: "Payment method", selectionType: .arrow))
                    ProfileActionHStackView(model: .init(iconName: "icon_balance", title: "Balance", selectionType: .text("$ 1593")))
                    ProfileActionHStackView(model: .init(iconName: "icon_balance", title: "Trade history", selectionType: .arrow))
                    ProfileActionHStackView(model: .init(iconName: "icon_refresh", title: "Restore Purchase", selectionType: .arrow))
                    ProfileActionHStackView(model: .init(iconName: "icon_about", title: "Help", selectionType: .none))
                    ProfileActionHStackView(model: .init(iconName: "icon_logout", title: "Log out", selectionType: .logOut))
                }
                .padding(.vertical)
                .padding(.horizontal, 35.0)
            }
        }
    }
}
