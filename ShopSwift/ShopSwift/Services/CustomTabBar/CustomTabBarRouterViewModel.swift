//
//  CustomTabBarRouterViewModel.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 22.03.2023.
//

import SwiftUI

class TabBarRouterViewModel: ObservableObject {
    
    @Published var currentPage: Page = .home
    
    enum Page {
        case home
        case favorite
        case shop
        case message
        case profile
    }
}
