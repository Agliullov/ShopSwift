//
//  FlashView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 31.03.2023.
//

import SwiftUI
import AGLUI

struct FlashView: View {
    
    @EnvironmentObject private var viewModel: MainViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            HStack(alignment: .center, spacing: 12.0) {
                Text("Flash sale")
                    .font(.custom(Montserrat.semiBold, size: 18.0))
                    .foregroundColor(Color(uiColor: .label))
                Spacer()
                Button {
                    print("View all Flash sale")
                } label: {
                    Text("View all")
                        .font(.custom(Montserrat.regular, size: 12.0))
                        .foregroundColor(Color(uiColor: .systemGray))
                }
            }
            ScrollView(.horizontal, showsIndicators: false) {
                if let flashModel = viewModel.flash {
                    HStack {
                        ForEach(Array(flashModel.flashSale.enumerated()), id: \.element) { _, model in
                            NavigationLink(destination: DetailsView()) {
                                FlashSaleElementView(viewModel: model)
                            }
                        }
                    }
                } else {
                    HStack {
                        ForEach(1..<5) { _ in
                            FlashSaleDelayView()
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 12.0)
    }
}
