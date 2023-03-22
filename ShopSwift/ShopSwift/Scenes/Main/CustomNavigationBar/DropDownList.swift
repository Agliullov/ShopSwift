//
//  DropDownList.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 17.03.2023.
//

import SwiftUI
import AGLUI

struct DropDownList: View {
    
    @State var expand = false
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10.0) {
                HStack {
                    Text("Location")
                        .foregroundColor(Color(uiColor: .secondaryLabel))
                        .font(.custom(Montserrat.regular, size: 14.0))
                    Image(expand ? "arrow_down" : "arrow_up")
                    
                        .foregroundColor(Color(uiColor: .secondaryLabel))
                }.onTapGesture {
                    withAnimation(.spring()) {
                        self.expand.toggle()
                    }
                }
                
                if expand {
                    Button {
                        withAnimation(.spring()) {
                            self.expand.toggle()
                        }
                    } label: {
                        VStack(alignment: .leading, spacing: 15.0) {
                            Text("Location 1")
                                .foregroundColor(Color(uiColor: .label))
                            Divider()
                            Text("Location 2")
                                .foregroundColor(Color(uiColor: .label))
                            Divider()
                            Text("Location 3")
                                .foregroundColor(Color(uiColor: .label))
                        }
                    }
                    .padding()
                    .background(Color(uiColor: .systemBackground))
                    .cornerRadius(8.0)
                    .shadow(color: Color(uiColor: .label).opacity(0.06), radius: 15.0, x: 0.0, y: 20.0)
                }
            }
        }
    }
}
