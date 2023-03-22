//
//  CustomTabBarView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 22.03.2023.
//

import SwiftUI

struct CustomTabBarView: View {
    
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                switch viewRouter.currentPage {
                case .home:
                    MainView()
                case .favorite:
                    Text("favorite")
                    ProgressView()
                case .shop:
                    Text("shop")
                    ProgressView()
                case .message:
                    Text("message")
                    ProgressView()
                case .profile:
                    ProfileView()
                }
                
                Spacer()
                
                ZStack {
                    HStack {
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .home, width: geometry.size.width / 5, iconName: "home")
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .favorite, width: geometry.size.width / 5,  iconName: "favorite")
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .shop, width: geometry.size.width / 5,  iconName: "shop")
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .message, width: geometry.size.width / 5,  iconName: "message")
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .profile, width: geometry.size.width / 5,  iconName: "profile")
                    }
                    .padding(.bottom, 10.0)
                    .frame(width: geometry.size.width, height: geometry.size.height / 12)
                    .cornerRadius(20.0, corners: [.topLeft, .topRight])
                }
                .padding(.top, -20)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct TabBarIcon: View {
    
    @StateObject var viewRouter: ViewRouter
    
    let assignedPage: ViewRouter.Page
    
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
