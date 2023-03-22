//
//  DeferredViewModifier.swift
//  
//
//  Created by Ильдар Аглиуллов on 22.03.2023.
//

import SwiftUI

public struct DeferredViewModifier: ViewModifier {
    
    @State private var shouldRender = false
    
    let threshold: Double
    
    public func body(content: Content) -> some View {
        _content(content).onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + threshold) {
                self.shouldRender = true
            }
        }
    }
    
    @ViewBuilder private func _content(_ content: Content) -> some View {
        if shouldRender {
            content
        } else {
            content
                .hidden()
        }
    }
}
