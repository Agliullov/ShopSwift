//
//  DetailsMainImageView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 31.03.2023.
//

import SwiftUI
import AGLUI

struct DetailsMainImageView: View {
    
    @EnvironmentObject var viewModel: DetailsViewModel
    
    var body: some View {
        if let viewModel = self.viewModel.details {
            PagingView(index: $viewModel.currentImageIndex.animation(), maxIndex: viewModel.imageURLs.count - 1) {
                ForEach(viewModel.imageURLs, id: \.self) { imageURL in
                    AsyncImage(url: URL(string: imageURL)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        ProgressView()
                    }
                }
            }
            .aspectRatio(4/3, contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding()
        }
    }
}
