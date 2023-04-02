//
//  ProfileActionHStackView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 31.03.2023.
//

import SwiftUI
import AGLUI
import AGLDomain

struct ProfileActionHStackView: View {
    
    @EnvironmentObject private var authService: AuthorizationService
    
    @State var model: ProfileActionModel
    
    var body: some View {
        HStack {
            switch model.selectionType {
            case .arrow:
                Button {
                    
                } label: {
                    Image(model.iconName)
                }
                Text(model.title)
                    .font(.custom(Montserrat.regular, size: 18.0))
                Spacer()
                Image("arrow_right")
            case .text(let text):
                Button {
                    
                } label: {
                    Image(model.iconName)
                }
                Text(model.title)
                    .font(.custom(Montserrat.regular, size: 18.0))
                Spacer()
                Text(text)
                    .font(.custom(Montserrat.regular, size: 18.0))
                    .foregroundColor(Color(uiColor: .label))
            case .none:
                Button {} label: {
                    Image(model.iconName)
                }
                Text(model.title)
                    .font(.custom(Montserrat.regular, size: 18.0))
                    .foregroundColor(Color(uiColor: .label))
                Spacer()
            case .logOut:
                Button {
                    self.authService.logOut()
                } label: {
                    Image(model.iconName)
                    Text(model.title)
                        .font(.custom(Montserrat.regular, size: 18.0))
                        .foregroundColor(Color(uiColor: .label))
                    Spacer()
                }
            }
        }
    }
}
