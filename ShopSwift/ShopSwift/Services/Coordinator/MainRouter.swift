//
//  MainRouter.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 22.03.2023.
//

import SwiftUI
import AGLDomain

enum MainRouter: NavigationRouter {
    
    case signIn
    
    var transition: NavigationTranisitionStyle {
        switch self {
        case .signIn:
            return .setInitial
        }
    }
    
    @ViewBuilder func view() -> some View {
        switch self {
        case .signIn:
            SignInView()
        }
    }
}
