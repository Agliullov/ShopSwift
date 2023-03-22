//
//  NavigationRouter.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 22.03.2023.
//

import SwiftUI

public protocol NavigationRouter {
    
    associatedtype V: View
    
    var transition: NavigationTranisitionStyle { get }
    
    @ViewBuilder func view() -> V
}
