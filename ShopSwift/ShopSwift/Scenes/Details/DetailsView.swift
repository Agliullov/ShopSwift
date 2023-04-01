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
        if viewModel.isLoading {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    // MARK: - Image carousel & Like-Share buttons
                    DetailsImageCarouselView().environmentObject(self.viewModel)
                    // MARK: - Name, price, description and rating
                    DetailsTextView().environmentObject(self.viewModel)
                }
            }
            
            Spacer()
            
            DetailsBottomView().environmentObject(self.viewModel)
        } else {
            ProgressView()
        }
    }
    
}
