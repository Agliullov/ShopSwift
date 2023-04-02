//
//  CategoriesView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 14.03.2023.
//

import SwiftUI
import AGLUI

struct CategoriesView: View {
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15.0) {
                ForEach(Categories.allCases, id: \.self) { category in
                    VStack(alignment: .center, spacing: 15.0) {
                        Image(category.value.imageName)
                            .frame(width: 42.0, height: 38.0, alignment: .center)
                        Text(category.value.name)
                            .font(.custom(Montserrat.light, size: 12.0))
                    }
                }
            }
            .padding(.horizontal, 16.0)
        }
        .padding(.top, 10.0)
    }
}

private extension CategoriesView {
    
    struct Category: Hashable {
        let name: String
        let imageName: String
    }
    
    enum Categories: CaseIterable {
        case phones
        case headphones
        case games
        case cars
        case furniture
        case kids
        
        var value: Category {
            switch self {
            case .phones:
                return Category(name: "Phones", imageName: "Category 1")
            case .headphones:
                return Category(name: "Headphones", imageName: "Category 2")
            case .games:
                return Category(name: "Games", imageName: "Category 3")
            case .cars:
                return Category(name: "Cars", imageName: "Category 4")
            case .furniture:
                return Category(name: "Furniture", imageName: "Category 5")
            case .kids:
                return Category(name: "Kids", imageName: "Category 6")
            }
        }
    }
}
