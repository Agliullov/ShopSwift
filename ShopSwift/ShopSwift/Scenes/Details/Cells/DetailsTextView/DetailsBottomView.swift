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
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text("Quantity:")
                        .font(.custom(Montserrat.regular, size: 8.0))
                        .foregroundColor(Color(uiColor: .secondaryLabel))
                    HStack {
                        Button {
                            if self.viewModel.scaleSumCart != 0 {
                                self.viewModel.scaleSumCart -= 1
                            }
                        } label: {
                            Image("details_minus")
                        }
                        .frame(width: 32, height: 22, alignment: .center)
                        .background(RoundedRectangle(cornerRadius: 15.0).fill(Color(uiColor: .systemIndigo)))
                        Button {
                            if self.viewModel.scaleSumCart != 10 {
                                self.viewModel.scaleSumCart += 1
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
                    Text("#\(2500 * self.viewModel.scaleSumCart)")
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
}

struct DetailsBottomView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsBottomView()
    }
}
