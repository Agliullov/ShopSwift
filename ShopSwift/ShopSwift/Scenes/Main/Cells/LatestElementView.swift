//
//  LatestElementView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 15.03.2023.
//

import SwiftUI
import AGLUI
import AGLDomain

struct LatestElementView: View {
    
    @State var viewModel: LatestModel
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: viewModel.imageURL)) { image in
                image.resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 150.0, maxHeight: 200.0)
            } placeholder: {
                ProgressView()
            }
            
            ZStack {
                VStack(alignment: .leading) {
                    Spacer()
                    
                    Text(viewModel.category)
                        .foregroundColor(Color(uiColor: .label))
                        .font(.custom(Montserrat.medium, size: 10.0))
                        .padding(.horizontal, 8.0)
                        .padding(.vertical, 4.0)
                        .background(RoundedRectangle(cornerRadius: 10.0).fill(Color(uiColor: .opaqueSeparator)))
                    Text(viewModel.name)
                        .font(.custom(Montserrat.bold, size: 12.0))
                        .foregroundColor(Color(uiColor: .systemBackground))
                    HStack(alignment: .firstTextBaseline) {
                        Text("$ " + "\(viewModel.price)")
                            .foregroundColor(Color(uiColor: .systemBackground))
                            .font(.custom(Montserrat.bold, size: 10.0))
                        Spacer()
                        Button {
                            
                        } label: {
                            Image("icon_plus")
                                .scaledToFit()
                                .tint(Color(uiColor: .label.withAlphaComponent(0.5)))
                                .frame(width: 25, height: 25, alignment: .center)
                                .background(RoundedRectangle(cornerRadius: 20.0).fill(Color(uiColor: .opaqueSeparator)))
                        }
                    }
                    .padding(.trailing, 6.0)
                }
                .padding(.leading, 8.0)
                .padding(.bottom, 8.0)
            }
        }
        .cornerRadius(15.0)
        .frame(width: 150.0, height: 200.0, alignment: .center)
    }
}
