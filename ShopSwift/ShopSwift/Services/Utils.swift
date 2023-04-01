//
//  Utils.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 01.04.2023.
//

import Foundation

func executeInMainQueue(_ block: @escaping () -> Void) {
    if Thread.isMainThread {
        block()
    } else {
        DispatchQueue.main.async {
            block()
        }
    }
}
