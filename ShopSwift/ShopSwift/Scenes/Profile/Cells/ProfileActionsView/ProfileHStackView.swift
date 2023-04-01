//
//  ProfileHStackView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 31.03.2023.
//

import SwiftUI
import AGLUI

struct ProfileHStackView: View {
    
    let imageName: String
    let title: String
    let buttonPrint: String
    let buttonImage: String
    
    let isButtonImage: Bool
    let buttonText: String
    
    let isBottomButton: Bool
    
    var body: some View {
        if !isBottomButton {
            HStack {
                Image(imageName)
                Text(title)
                    .font(.custom(Montserrat.regular, size: 18.0))
                Spacer()
                Button {
                    print(buttonPrint)
                } label: {
                    if isButtonImage {
                        Image(buttonImage)
                    } else {
                        Text(buttonText)
                            .font(.custom(Montserrat.regular, size: 18.0))
                            .foregroundColor(Color(uiColor: .label))
                    }
                }
                .padding()
            }
        } else {
            
            HStack {
                Button {
                    print(buttonPrint)
                } label: {
                    Image(buttonImage)
                }
                Text(buttonText)
                    .font(.custom(Montserrat.regular, size: 18.0))
                Spacer()
            }
        }
    }
}
