//
//  MainView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 14.03.2023.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        if viewModel.isLoading {
            VStack {
                //MARK: - Navigation bar
                CustomNavigationBarView()
                
                //MARK: - Categories stack
                CategoriesView()
                Spacer()
                
                //MARK: - Latest & Flash sale & Brands items
                ScrollView(.vertical, showsIndicators: false) {
                    LatestView()
                    Spacer()
                    FlashView()
                    Spacer()
                    BrandView()
                }
            }
        } else {
            ProgressView()
        }
    }
}
