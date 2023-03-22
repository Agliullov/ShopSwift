//
//  CategoriesView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 14.03.2023.
//

import SwiftUI
import AGLUI

struct CategoriesView: View {
    
    private let categories: [Category] = [
        Category(name: "Phones", imageName: "Category 1"),
        Category(name: "Headphones", imageName: "Category 2"),
        Category(name: "Games", imageName: "Category 3"),
        Category(name: "Cars", imageName: "Category 4"),
        Category(name: "Furniture", imageName: "Category 5"),
        Category(name: "Kids", imageName: "Category 6")
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15.0) {
                ForEach(categories, id: \.self) { category in
                    VStack(alignment: .center, spacing: 15.0) {
                        Image(category.imageName)
                            .frame(width: 42.0, height: 38.0, alignment: .center)
                        Text(category.name)
                            .font(.custom(Montserrat.light, size: 12.0))
                    }
                }
            }
            .padding(.horizontal, 16.0)
        }
        .padding(.top, 10.0)
    }
}

extension CategoriesView {
    struct Category: Hashable {
        let name: String
        let imageName: String
    }
}
