//
//  DetailsNavigationBackButtonView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 02.04.2023.
//

import SwiftUI

struct DetailsNavigationBackButtonView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Image("icon_back")
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
        }
    }
}
