//
//  DetailsCartButtonView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 02.04.2023.
//

import SwiftUI
import AGLUI

struct DetailsCartButtonView: View {
    
    @EnvironmentObject private var viewModel: DetailsViewModel
    
    var body: some View {
        HStack {
            Text("#\(2500 * self.viewModel.scaleSumCart)")
                .font(.custom(Montserrat.semiBold, size: 10.0))
                .foregroundColor(Color(uiColor: .secondaryLabel))
                .padding(.leading)
            Button { } label: {
                Text("ADD TO CART")
                    .font(.custom(Montserrat.bold, size: 10.0))
                    .foregroundColor(Color.white)
            }
            .padding()
        }
        .frame(width: 200, height: 50)
        .background(RoundedRectangle(cornerRadius: 15.0).fill(Color(uiColor: .systemIndigo)))
    }
}
