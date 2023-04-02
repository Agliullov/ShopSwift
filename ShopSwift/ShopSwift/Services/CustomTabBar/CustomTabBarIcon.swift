//
//  CustomTabBarIcon.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 02.04.2023.
//

import SwiftUI

struct CustomTabBarIcon: View {
    
    @StateObject var viewRouter: TabBarRouterViewModel
    
    let assignedPage: TabBarRouterViewModel.Page
    
    let width: CGFloat
    let iconName: String
    
    var body: some View {
        VStack {
            Image(iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: 15.0)
        }
        .padding(.horizontal, -4.0)
        .onTapGesture {
            withAnimation {
                viewRouter.currentPage = assignedPage
            }
        }
        .background(viewRouter.currentPage == assignedPage ? Circle().frame(width: width + 15.0, height: 30.0) : nil)
        .scaleEffect(viewRouter.currentPage == assignedPage ? 1.25 : 1.0)
        .foregroundColor(Color(uiColor: .secondarySystemBackground))
    }
}
