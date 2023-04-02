//
//  DetailsView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 15.03.2023.
//

import SwiftUI
import AGLUI
import AGLDomain

struct DetailsView: View {
    
    @StateObject private var viewModel = DetailsViewModel()
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                // MARK: - Image carousel & Like-Share buttons
                DetailsImageCarouselView().environmentObject(viewModel)
                // MARK: - Name, price, description and rating
                DetailsTextView().environmentObject(viewModel)
                Spacer()
            }
            .padding(.top, -30)
            
            // MARK: - Quantity & AddToCart buttons
            DetailsBottomView().environmentObject(viewModel)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: DetailsNavigationBackButtonView())
    }
}
