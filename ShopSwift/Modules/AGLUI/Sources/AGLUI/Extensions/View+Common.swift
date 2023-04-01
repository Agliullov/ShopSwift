//
//  File.swift
//  
//
//  Created by Ильдар Аглиуллов on 13.03.2023.
//

import SwiftUI

public extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
    
    func deferredRendering(for seconds: Double) -> some View {
        modifier(DeferredViewModifier(threshold: seconds))
    }
}

public extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        let a, r, g, b: UInt64
        
        Scanner(string: hex).scanHexInt64(&int)
        
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(.sRGB, red: Double(r) / 255, green: Double(g) / 255, blue:  Double(b) / 255, opacity: Double(a) / 255)
    }
}

public extension NSError {
    static func emptyError() -> NSError {
        return NSError(domain: "AGLShopSwift.NetworkService", code: 1111, userInfo: nil)
    }
    
    static func emptyData() -> NSError {
        return NSError(domain: "AGLShopSwift.NetworkService", code: 1001, userInfo: nil)
    }
    
    static func badRequest() -> NSError {
        return NSError(domain: "AGLShopSwift.NetworkService", code: 1002, userInfo: nil)
    }
}
