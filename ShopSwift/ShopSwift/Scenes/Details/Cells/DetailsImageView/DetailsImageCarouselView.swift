//
//  DetailsImageCarouselView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 31.03.2023.
//

import SwiftUI

struct DetailsImageCarouselView: View {
    
    @EnvironmentObject var viewModel: DetailsViewModel
    
    var body: some View {
        ZStack {
            DetailsMainImageView()
                .environmentObject(self.viewModel)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    DetailsMainImageButtonsView()
                        .padding(.bottom, 45.0)
                        .padding(.trailing, 10.0)
                }
            }
        }
        
        HStack(alignment: .center, spacing: 15.0) {
            if let viewModel = viewModel.details {
                ForEach(Array((viewModel.imageURLs.enumerated())), id: \.element) { index, url in
                    AsyncImage(url: URL(string: url)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: 65.0, maxHeight: 37.0)
                    } placeholder: {
                        ProgressView()
                    }
                    .onTapGesture {
                        withAnimation {
                            self.viewModel.updateIndex(index: index)
                        }
                    }
                    .cornerRadius(5.0)
                    .scaleEffect(self.viewModel.currentImageIndex == index ? 1.25 : 1)
                    .shadow(color: Color(uiColor: .label).opacity(self.viewModel.currentImageIndex == index ? 0.2 : 0), radius: 5.0, x: 0.0, y: 10.0)
                }
            }
        }
    }
}
