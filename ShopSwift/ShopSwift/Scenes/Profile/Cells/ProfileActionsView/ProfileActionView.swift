//
//  ProfileActionView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 31.03.2023.
//

import SwiftUI
import AGLUI

struct ProfileActionView: View {
    
    @StateObject var authService = AuthorizationService()
    
    var body: some View {
        if !authService.authenticated {
            SignInView()
        } else {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 25.0) {
                    
                    //MARK: - Trade story
                    ProfileHStackView(imageName: "icon_balance", title: "Trade store",
                                      buttonPrint: "tradeStoreButtonDidTap", buttonImage: "arrow_right",
                                      isButtonImage: true, buttonText: "", isBottomButton: false)
                    
                    //MARK: - Payment method
                    ProfileHStackView(imageName: "icon_balance", title: "Payment method",
                                      buttonPrint: "paymentMethodButtonDidTap", buttonImage: "arrow_right",
                                      isButtonImage: true, buttonText: "", isBottomButton: false)
                    
                    //MARK: - Balance
                    ProfileHStackView(imageName: "icon_balance", title: "Balance",
                                      buttonPrint: "balanceButtonDidTap", buttonImage: "",
                                      isButtonImage: false, buttonText: "$ 1593", isBottomButton: false)
                    
                    //MARK: - Trade history
                    ProfileHStackView(imageName: "icon_balance", title: "Trade history",
                                      buttonPrint: "tradeHistoryButtonDidTap", buttonImage: "arrow_right",
                                      isButtonImage: true, buttonText: "", isBottomButton: false)
                    
                    //MARK: - Restore Purchase
                    
                    ProfileHStackView(imageName: "icon_refresh", title: "Restore Purchase",
                                      buttonPrint: "restorePurchaseButtonDidTap", buttonImage: "arrow_right",
                                      isButtonImage: true, buttonText: "", isBottomButton: false)
                    
                    //MARK: - Help
                    ProfileHStackView(imageName: "", title: "",
                                      buttonPrint: "helpButtonDidTap", buttonImage: "icon_about",
                                      isButtonImage: false, buttonText: "Help", isBottomButton: true)
                    
                    //MARK: - Log out
                    HStack {
                        Button {
                            print("logOutButtonDidTap")
                            self.authService.logOut()
                        } label: {
                            Image("icon_logout")
                        }
                        Text("Log out")
                            .font(.custom(Montserrat.regular, size: 18.0))
                        Spacer()
                    }
                }
                .padding(.vertical)
                .padding(.horizontal, 35.0)
            }
        }
    }
}
