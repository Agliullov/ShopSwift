//
//  DetailsBottomButtonView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 02.04.2023.
//

import SwiftUI
import AGLUI

struct DetailsBottomButtonView: View {
    
    @EnvironmentObject var viewModel: DetailsViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12.0) {
            Text("Quantity:")
                .font(.custom(Montserrat.semiBold, size: 8.0))
                .foregroundColor(Color(uiColor: .secondaryLabel))
            HStack(alignment: .center, spacing: 21.0) {
                Button {
                    if self.viewModel.scaleSumCart != 0 {
                        self.viewModel.scaleSumCart -= 1
                    }
                } label: {
                    Image("details_minus")
                        .frame(width: 20, height: 20)
                }
                .frame(width: 38.0, height: 22.0, alignment: .center)
                .background(RoundedRectangle(cornerRadius: 8.0).fill(Color(uiColor: .systemIndigo)))
                Button {
                    if self.viewModel.scaleSumCart != 10 {
                        self.viewModel.scaleSumCart += 1
                    }
                } label: {
                    Image("details_plus")
                        .frame(width: 20, height: 20)
                }
                .frame(width: 38, height: 22, alignment: .center)
                .background(RoundedRectangle(cornerRadius: 8.0).fill(Color(uiColor: .systemIndigo)))
            }
        }
        .padding()
    }
}
