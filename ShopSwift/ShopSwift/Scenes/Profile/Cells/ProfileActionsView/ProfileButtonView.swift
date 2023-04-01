//
//  ProfileButtonView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 31.03.2023.
//

import SwiftUI
import AGLUI

struct ProfileButtonView: View {
    
    var body: some View {
        VStack {
            Text("Satria Adhi Pradana")
                .font(.custom(Montserrat.bold, size: 18.0))
                .foregroundColor(Color(uiColor: .label))
                .padding(.top, 10.0)
                .padding(.bottom, 20.0)
            HStack {
                HStack {
                    Image("icon_upload")
                        .foregroundColor(Color.white)
                        .padding(.trailing, 30.0)
                    Text("Upload item")
                        .foregroundColor(Color.white)
                        .padding(.trailing, 40.0)
                }
                .padding(.horizontal, 50.0)
                .padding(.vertical, 10.0)
                .background(RoundedRectangle(cornerRadius: 20.0).fill(Color(uiColor: .systemIndigo)))
            }
        }
    }
}
