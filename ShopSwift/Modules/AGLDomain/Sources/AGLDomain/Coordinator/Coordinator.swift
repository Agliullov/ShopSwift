//
//  Coordinator.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 22.03.2023.
//

import SwiftUI

open class Coordinator<Router: NavigationRouter>: ObservableObject {
    
    public var navigationController: UINavigationController?
    public var startingRoute: Router?
        
    public init(startingRoute: Router? = nil) {
        if let rootView = startingRoute?.view() {
            let viewController = UIHostingController(rootView: rootView)
            self.navigationController = UINavigationController(rootViewController: viewController)
        }
        self.startingRoute = startingRoute
    }
    
    public func start() {
        guard let route = startingRoute else { return }
        show(route)
    }
    
    public func show(_ route: Router, animated: Bool = true) {
        let view = route.view()
        let viewWithCoordinator = view.environmentObject(self)
        
        let viewController = UIHostingController(rootView: viewWithCoordinator)
        
        switch route.transition {
        case .push:
            navigationController?.isNavigationBarHidden = false
            navigationController?.pushViewController(viewController, animated: animated)
        case .presentModally:
            viewController.modalPresentationStyle = .formSheet
            navigationController?.present(viewController, animated: animated)
        case .presentFullscreen:
            viewController.modalPresentationStyle = .fullScreen
            navigationController?.present(viewController, animated: animated)
        case .setInitial:
            navigationController?.setViewControllers([viewController], animated: true)
        }
    }
    
    public func pop(animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }
    
    public func popToRoot(animated: Bool = true) {
        navigationController?.popToRootViewController(animated: animated)
    }
    
    open func dismiss(animated: Bool = true) {
        navigationController?.dismiss(animated: true) { [weak self] in
            self?.navigationController?.viewControllers = []
        }
    }
}
