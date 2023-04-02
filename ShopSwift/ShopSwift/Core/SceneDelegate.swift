//
//  SceneDelegate.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 10.03.2023.
//

import UIKit
import AGLDomain
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    private let coordinator: Coordinator<MainRouter> = .init(startingRoute: .signIn)
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: scene)
        window?.rootViewController = coordinator.navigationController
        window?.makeKeyAndVisible()
        coordinator.start()
    }
}

