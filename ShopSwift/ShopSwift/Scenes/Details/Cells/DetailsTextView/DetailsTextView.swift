//
//  DetailsTextView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 31.03.2023.
//

import SwiftUI
import AGLUI

struct DetailsTextView: View {
    
    @EnvironmentObject var viewModel: DetailsViewModel
    
    var body: some View {
        if let viewModel = viewModel.details {
            VStack {
                HStack(alignment: .top) {
                    Text(viewModel.name)
                        .lineLimit(2)
                        .font(.custom(Montserrat.bold, size: 18.0))
                        .foregroundColor(Color(uiColor: .label))
                        .frame(width: 200.0, alignment: .leading)
                    Spacer()
                    Text("$ \(viewModel.price, specifier: "%.2f")")
                        .font(.custom(Montserrat.bold, size: 16.0))
                        .foregroundColor(Color(uiColor: .label))
                }
                .padding()
                
                HStack {
                    Text(viewModel.description)
                        .lineLimit(3)
                        .font(.custom(Montserrat.regular, size: 14.0))
                        .foregroundColor(Color(uiColor: .secondaryLabel))
                        .frame(width: 300.0, alignment: .leading)
                    Spacer()
                }
                .padding(.leading)
                
                HStack {
                    Image("star")
                    Text("\(viewModel.rating, specifier: "%.1f")")
                        .font(.custom(Montserrat.semiBold, size: 14.0))
                        .foregroundColor(Color(uiColor: .label))
                    Text("(\(viewModel.numberOfReviews) reviews)")
                        .font(.custom(Montserrat.regular, size: 14.0))
                        .foregroundColor(Color(uiColor: .secondaryLabel))
                    Spacer()
                }
                .padding(.leading)
                
                VStack {
                    HStack {
                        Text("Color:")
                            .font(.custom(Montserrat.semiBold, size: 14.0))
                            .foregroundColor(Color(uiColor: .secondaryLabel))
                        Spacer()
                    }
                    HStack {
                        ForEach(Array((viewModel.colors.enumerated())), id: \.element) { _, color in
                            RoundedRectangle(cornerRadius: 10.0, style: .circular).fill(Color(hex: color))
                                .frame(width: 32.0, height: 24.0, alignment: .center)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(color == "#ffffff" ? .gray : .clear, lineWidth: 2)
                                )
                        }
                        Spacer()
                    }
                }
                .padding(.leading)
            }
            .padding()
        }
    }
}
