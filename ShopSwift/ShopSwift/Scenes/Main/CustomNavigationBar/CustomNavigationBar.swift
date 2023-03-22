//
//  CustomNavigationBarView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 14.03.2023.
//

import SwiftUI
import AGLUI

struct CustomNavigationBarView: View {
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Button {
                    navigationLeftButtonDidTap()
                } label: {
                    Image("navigation_left_button")
                        .font(.custom(Montserrat.bold, size: 20.0))
                        .foregroundColor(Color(uiColor: .label))
                }
                
                Spacer()
                
                HStack {
                    (Text("Trade by ")
                        .font(.custom(Montserrat.bold, size: 20.0))
                        .foregroundColor(Color(uiColor: .label))
                     +
                     Text("bata")
                        .font(.custom(Montserrat.bold, size: 20.0))
                        .foregroundColor(Color(uiColor: .systemIndigo))
                    )
                }
                .padding(.leading, 50.0)
                
                Spacer()
                
                VStack(alignment: .center, spacing: 10.0) {
                    Image("profile_image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40.0, height: 40.0, alignment: .center)
                        .background(Color(uiColor: .label))
                        .cornerRadius(40.0)
                    DropDownList()
                }
                .padding(.trailing, 15.0)
            }
            .padding(.horizontal)
            .padding(.top)
            
            CustomSearchBar()
        }
        .navigationBarHidden(true)
    }
}

extension CustomNavigationBarView {
    enum Tab: String, CaseIterable {
        case phone
        case headphone
        case games
        case cars
        case furnityre
        case kids
    }
    
    func navigationLeftButtonDidTap() {
        print(#function)
    }
}
