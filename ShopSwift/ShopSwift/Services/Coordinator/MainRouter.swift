//
//  MainRouter.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 22.03.2023.
//

import SwiftUI
import AGLDomain

public enum MainRouter: NavigationRouter {
    
    case signIn
    case logIn
    case main
    case details(viewModel: DetailsProductsModel)
    
    public var transition: NavigationTranisitionStyle {
        switch self {
        case .signIn:
            return .setInitial
        case .logIn:
            return .presentModally
        case .main:
            return .push
        case .details:
            return .push
        }
    }
    
    @ViewBuilder public func view() -> some View {
        switch self {
        case .signIn:
            SignInView()
        case .logIn:
            LoginView()
        case .main:
            MainView()
        case .details(viewModel: let viewModel):
            DetailsView(viewModel: viewModel)
        }
    }
}
