//
//  MainView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 14.03.2023.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject private var mainViewModel: MainViewModel
    @EnvironmentObject private var profileViewModel: ProfileViewModel
    
    var body: some View {
        NavigationView {
            if mainViewModel.isLoading {
                VStack {
                    //MARK: - Navigation bar
                    CustomNavigationBarView()
                        .environmentObject(mainViewModel)
                        .environmentObject(profileViewModel)
                    
                    //MARK: - Categories stack
                    CategoriesView()
                    Spacer()
                    
                    //MARK: - Latest & Flash sale & Brands items
                    ScrollView(.vertical, showsIndicators: false) {
                        LatestView().environmentObject(mainViewModel)
                        Spacer()
                        FlashView().environmentObject(mainViewModel)
                        Spacer()
                        BrandView().environmentObject(mainViewModel)
                    }
                }
            } else {
                ProgressView()
            }
        }
        .navigationBarHidden(true)
    }
}
