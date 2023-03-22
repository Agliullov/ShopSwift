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
        
    @State var viewModel: DetailsProductsModel
    @State private var scaleSumCart: Int = 1
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ZStack {
                        
                        AsyncImage(url: URL(string: viewModel.imageURLs.first ?? "")) { image in
                            image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: 330.0, maxHeight: 280.0)
                        } placeholder: {
                            ProgressView()
                        }
                        
                        
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                VStack(alignment: .center) {
                                    Spacer()
                                    Button {
                                        addToFavoriteButtonDidTap()
                                    } label: {
                                        Image("like")
                                    }
                                    Spacer()
                                    RoundedRectangle(cornerRadius: 2).frame(width: 15.0, height: 0.5, alignment: .center)
                                    Spacer()
                                    Button {
                                        shareButtonDidTap()
                                    } label: {
                                        Image("share_icon")
                                    }
                                    Spacer()
                                }
                                
                                .frame(width: 42, height: 95, alignment: .center)
                                .background(RoundedRectangle(cornerRadius: 8.0).fill(Color(uiColor: .systemGroupedBackground)))
                                
                            }
                        }.padding(.vertical, 50)
                        
                    }
                    .frame(width: 330, height: 280, alignment: .center)
                    HStack(alignment: .center, spacing: 5.0) {
                        ForEach(Array(viewModel.imageURLs.enumerated()), id: \.element) { _, url in
                            AsyncImage(url: URL(string: url)) { image in
                                image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: 65.0, maxHeight: 37.0)
                            } placeholder: {
                                ProgressView()
                            }
                        }
                    }
                    VStack {
                        HStack(alignment: .top) {
                            Text(viewModel.name)
                                .lineLimit(2)
                                .font(.custom(Montserrat.bold, size: 20.0))
                                .foregroundColor(Color(uiColor: .label))
                                .frame(width: 200, alignment: .leading)
                            Spacer()
                            Text("$ \(viewModel.price)")
                                .font(.custom(Montserrat.bold, size: 18.0))
                                .foregroundColor(Color(uiColor: .label))
                        }
                        .padding()
                        HStack {
                            Text("Features waterproof, fire, air resistant shoes. all changed when the country of fire attacked")
                                .lineLimit(3)
                                .font(.custom(Montserrat.regular, size: 16.0))
                                .foregroundColor(Color(uiColor: .secondaryLabel))
                                .frame(width: 300, alignment: .leading)
                            Spacer()
                        }
                        .padding()
                        
                        HStack {
                            Image("star")
                                .frame(width: 10.0, height: 10.0, alignment: .center)
                            Text("3.9")
                                .font(.custom(Montserrat.semiBold, size: 14.0))
                                .foregroundColor(Color(uiColor: .label))
                            Text("(4000 reviews")
                                .font(.custom(Montserrat.regular, size: 14.0))
                                .foregroundColor(Color(uiColor: .secondaryLabel))
                            Spacer()
                        }
                        .padding()
                        
                        
                        VStack {
                            HStack {
                                Text("Color:")
                                    .font(.custom(Montserrat.regular, size: 16.0))
                                    .foregroundColor(Color(uiColor: .secondaryLabel))
                                Spacer()
                            }
                            HStack {
                                RoundedRectangle(cornerRadius: 20.0, style: .circular).fill(Color(uiColor: .red))
                                    .frame(width: 32, height: 24, alignment: .center)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(.blue, lineWidth: 2)
                                    )
                                RoundedRectangle(cornerRadius: 20.0, style: .circular).fill(Color(uiColor: .yellow))
                                    .frame(width: 32, height: 24, alignment: .center)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(.blue, lineWidth: 2)
                                    )
                                RoundedRectangle(cornerRadius: 20.0, style: .circular).fill(Color(uiColor: .black))
                                    .frame(width: 32, height: 24, alignment: .center)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(.blue, lineWidth: 2)
                                    )
                                Spacer()
                            }
                        }
                        .padding()
                    }
                    .padding()
                }
            }
            
            
            
            ZStack {
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Text("Quantity:")
                            .font(.custom(Montserrat.regular, size: 8.0))
                            .foregroundColor(Color(uiColor: .secondaryLabel))
                        HStack {
                            Button {
                                if scaleSumCart != 0 {
                                    self.scaleSumCart -= 1
                                }
                            } label: {
                                Image("details_minus")
                            }
                            .frame(width: 32, height: 22, alignment: .center)
                            .background(RoundedRectangle(cornerRadius: 15.0).fill(Color(uiColor: .systemIndigo)))
                            Button {
                                if scaleSumCart != 10 {
                                    self.scaleSumCart += 1
                                }
                            } label: {
                                Image("details_plus")
                            }
                            .frame(width: 32, height: 22, alignment: .center)
                            .background(RoundedRectangle(cornerRadius: 15.0).fill(Color(uiColor: .systemIndigo)))
                        }
                    }
                    
                    Spacer()
                    
                    HStack {
                        Text("#\(2500 * scaleSumCart)")
                            .font(.custom(Montserrat.italic, size: 10.0))
                            .foregroundColor(Color(uiColor: .label))
                            .padding(.trailing, 10.0)
                        Button {
                            print("add to cart")
                        } label: {
                            Text("ADD TO CART")
                                .font(.custom(Montserrat.semiBold, size: 10.0))
                                .foregroundColor(Color.white)
                        }
                    }.padding()
                        .frame(width: 170, height: 44, alignment: .center)
                        .background(RoundedRectangle(cornerRadius: 15.0).fill(Color(uiColor: .systemIndigo)))
                }
                .padding()
            }
            .padding(.bottom, 10.0)
            .background(Color(uiColor: .tertiaryLabel))
            .cornerRadius(20.0, corners: [.topLeft, .topRight])
        }
        .onAppear {
            fetchDetails { detailsModel in
                if let detailsModel = detailsModel {
                    self.viewModel = detailsModel
                }
            }
        }
    }
}

extension DetailsView {
    
    func addToFavoriteButtonDidTap() {
        print(#function)
    }
    
    func shareButtonDidTap() {
        print(#function)
    }
    
    func fetchDetails(completion: @escaping (DetailsProductsModel?) -> Void) {
        let url = "https://run.mocky.io/v3/f7f99d04-4971-45d5-92e0-70333383c239"
        let network = NetworkDataFetcher()
        network.getDataUrlFromJson(urlString: url, response: completion)
    }
}
