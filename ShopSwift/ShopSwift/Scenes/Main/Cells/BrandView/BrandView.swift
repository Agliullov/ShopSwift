//
//  BrandView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 31.03.2023.
//

import SwiftUI
import AGLUI

struct BrandView: View {
    
    @StateObject private var viewModel = MainViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            HStack(alignment: .center, spacing: 12.0) {
                Text("Brands")
                    .font(.custom(Montserrat.semiBold, size: 18.0))
                    .foregroundColor(Color(uiColor: .label))
                Spacer()
                Button {
                    print("View all Brands")
                } label: {
                    Text("View all")
                        .font(.custom(Montserrat.regular, size: 12.0))
                        .foregroundColor(Color(uiColor: .systemGray))
                }
            }
            ScrollView(.horizontal, showsIndicators: false) {
                if let latestModel = viewModel.latest {
                    HStack {
                        ForEach(Array(latestModel.latest.enumerated()), id: \.element) { _, model in
                            LatestElementView(viewModel: model)
                        }
                    }
                } else {
                    HStack {
                        ForEach(1..<5) { _ in
                            LatestDelayView()
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 12.0)
    }
}
