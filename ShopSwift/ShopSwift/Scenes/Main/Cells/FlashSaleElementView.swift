//
//  FlashSaleElementView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 15.03.2023.
//

import SwiftUI
import AGLUI
import AGLDomain

struct FlashSaleElementView: View {
    
    @State var viewModel: FlashSale
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: viewModel.imageURL)) { image in
                image.resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 175.0, maxHeight: 220.0)
            } placeholder: {
                ProgressView()
            }
            
            ZStack {
                VStack {
                    //MARK: - Trader and discount
                    HStack(alignment: .top) {
                        Image("image_trader")
                            .frame(width: 24.0, height: 24.0, alignment: .leading)
                        Spacer()
                        Text("\(viewModel.discount)" + "% off")
                            .font(.custom(Montserrat.bold, size: 10.0))
                            .foregroundColor(Color.white)
                            .padding(5.0)
                            .background(RoundedRectangle(cornerRadius: 15.0).fill().foregroundColor(Color.red))
                    }
                    .padding(.top, 10.0)
                    .padding(.horizontal, 5.0)
                    
                    Spacer()
                    
                    //MARK: - Category
                    HStack {
                        Text(viewModel.category)
                            .font(.custom(Montserrat.bold, size: 10.0))
                            .foregroundColor(Color(uiColor: .label))
                            .padding(.horizontal, 12.0)
                            .padding(.vertical, 4.0)
                            .background(RoundedRectangle(cornerRadius: 20.0).fill(Color(uiColor: .opaqueSeparator)).opacity(0.8))
                        Spacer()
                    }
                    .padding(.leading, 10.0)
                    
                    HStack {
                        Text(viewModel.name)
                            .lineLimit(2)
                            .font(.custom(Montserrat.bold, size: 15.0))
                            .foregroundColor(Color(uiColor: .systemBackground))
                        Spacer()
                    }
                    .padding(.leading, 10.0)
                    .padding(.bottom, -10.0)
                    
                    HStack {
                        Text("$ " + "\(viewModel.price)")
                            .font(.custom(Montserrat.bold, size: 12.0))
                            .foregroundColor(Color(uiColor: .systemBackground))
                            .padding(.horizontal, 10.0)
                            .padding(.vertical, 5.0)
                        Spacer()
                        HStack(alignment: .firstTextBaseline, spacing: 5.0) {
                            Button {
                                addToFavoriteButtonDidTap()
                            } label: {
                                Image("like")
                                    .frame(width: 28.0, height: 28.0, alignment: .center)
                                    .background(RoundedRectangle(cornerRadius: 20.0).fill(Color(uiColor: .systemGray5)))
                            }
                            
                            Button {
                                addToCartButtonDidTap()
                            } label: {
                                Image("plus")
                                    .frame(width: 35.0, height: 35.0, alignment: .center)
                                    .background(RoundedRectangle(cornerRadius: 20.0).fill(Color(uiColor: .systemGray5)))
                            }
                        }
                        .padding(.horizontal, 5.0)
                        .padding(.bottom, 5.0)
                    }
                }
            }
        }
        .cornerRadius(15.0)
        .frame(width: 175.0, height: 220.0, alignment: .center)
    }
}

extension FlashSaleElementView {
    
    func addToFavoriteButtonDidTap() {
        print(#function)
    }
    
    func addToCartButtonDidTap() {
        print(#function)
    }
}
