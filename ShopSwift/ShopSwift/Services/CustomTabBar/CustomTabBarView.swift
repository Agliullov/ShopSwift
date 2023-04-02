//
//  CustomTabBarView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 22.03.2023.
//

import SwiftUI

struct CustomTabBarView: View {
    
    @EnvironmentObject private var authService: AuthorizationService
    
    @StateObject private var mainViewModel: MainViewModel = .init()
    @StateObject private var profileViewModel: ProfileViewModel = .init()
    
    @StateObject var viewRouter: TabBarRouterViewModel
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack {
                    Spacer()
                    switch viewRouter.currentPage {
                    case .home:
                        MainView()
                            .environmentObject(mainViewModel)
                            .environmentObject(profileViewModel)
                    case .favorite:
                        Text("favorite")
                        ProgressView()
                            .navigationBarHidden(true)
                    case .shop:
                        Text("shop")
                        ProgressView()
                            .navigationBarHidden(true)
                    case .message:
                        Text("message")
                        ProgressView()
                            .navigationBarHidden(true)
                    case .profile:
                        ProfileView()
                            .environmentObject(profileViewModel)
                            .environmentObject(authService)
                    }
                    Spacer()
                }
                
                ZStack {
                    HStack {
                        CustomTabBarIcon(viewRouter: viewRouter, assignedPage: .home, width: geometry.size.width / 5,
                                         iconName: "home")
                        CustomTabBarIcon(viewRouter: viewRouter, assignedPage: .favorite, width: geometry.size.width / 5,
                                         iconName: "favorite")
                        CustomTabBarIcon(viewRouter: viewRouter, assignedPage: .shop, width: geometry.size.width / 5,
                                         iconName: "shop")
                        CustomTabBarIcon(viewRouter: viewRouter, assignedPage: .message, width: geometry.size.width / 5,
                                         iconName: "message")
                        CustomTabBarIcon(viewRouter: viewRouter, assignedPage: .profile, width: geometry.size.width / 5,
                                         iconName: "profile")
                    }
                    .padding(.bottom, 10.0)
                    .frame(width: geometry.size.width, height: geometry.size.height / 12)
                    .background(.white)
                    .cornerRadius(20.0, corners: [.topLeft, .topRight])
                }
                .padding(.top, -25.0)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}
