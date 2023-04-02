//
//  LatestView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 30.03.2023.
//

import SwiftUI
import AGLUI

struct LatestView: View {
    
    @EnvironmentObject private var viewModel: MainViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            HStack(alignment: .center, spacing: 12.0) {
                Text("Latest")
                    .font(.custom(Montserrat.semiBold, size: 18.0))
                    .foregroundColor(Color(uiColor: .label))
                Spacer()
                Button {
                    print("View all Latest")
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
                            NavigationLink(destination: DetailsView()) {
                                LatestElementView(viewModel: model)
                            }
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
