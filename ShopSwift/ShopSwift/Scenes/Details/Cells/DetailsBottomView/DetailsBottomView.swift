//
//  DetailsBottomView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 31.03.2023.
//

import SwiftUI
import AGLUI

struct DetailsBottomView: View {
    
    @EnvironmentObject var viewModel: DetailsViewModel
    
    var body: some View {
        ZStack {
            HStack {
                DetailsBottomButtonView().environmentObject(viewModel)
                DetailsCartButtonView().environmentObject(viewModel).padding()
            }
            .padding(.bottom, 10.0)
            .frame(width: UIScreen.main.bounds.width, height: 100.0)
            .background(Color(hex: "#181726"))
            .cornerRadius(20.0, corners: [.topLeft, .topRight])
        }
        .padding(.top, -25.0)
    }
}
