//
//  DetailsMainImageButtonsView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 31.03.2023.
//

import SwiftUI

struct DetailsMainImageButtonsView: View {
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Button { } label: {
                Image("like")
            }
            Spacer()
            RoundedRectangle(cornerRadius: 2).frame(width: 15.0, height: 0.5, alignment: .center)
            Spacer()
            Button { } label: {
                Image("share_icon")
            }
            Spacer()
        }
        .frame(width: 42.0, height: 95.0)
        .background(RoundedRectangle(cornerRadius: 8.0).fill(Color(uiColor: .systemGroupedBackground)))
    }
}
