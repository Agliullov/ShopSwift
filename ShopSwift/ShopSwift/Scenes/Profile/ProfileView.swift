//
//  ProfileView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 15.03.2023.
//

import SwiftUI
import AGLUI
import PhotosUI

struct ProfileView: View {
    
    @StateObject var authService = AuthorizationService()
    @StateObject var viewRouter = ViewRouter()
    
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
    
    var body: some View {
        if !authService.authenticated {
            SignInView()
        } else {
            
            VStack {
                //MARK: - Navigation title, profile image, change photo button
                VStack {
                    VStack(alignment: .center, spacing: 5.0) {
                        Text("Profile")
                            .font(.custom(Montserrat.bold, size: 18.0))
                            .foregroundColor(Color(uiColor: .label))
                            .padding(.top, 20.0)
                            .padding(.bottom, 10.0)
                        
                        Image(uiImage: self.image)
                            .resizable()
                            .scaledToFill()
                            .cornerRadius(15.0)
                            .frame(width: 60.0, height: 60.0, alignment: .center)
                        Button {
                            self.isShowPhotoLibrary = true
                        } label: {
                            Text("Change photo")
                                .font(.custom(Montserrat.regular, size: 10.0))
                                .foregroundColor(Color(uiColor: .secondaryLabel))
                        }
                    }
                    .sheet(isPresented: $isShowPhotoLibrary) {
                        ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                    }
                }
                
                //MARK: - User name, upload item button
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
                
                //MARK: - Actions
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .center, spacing: 25.0) {
                        
                        //MARK: - Trade story
                        HStack {
                            Image("icon_balance")
                            Text("Trade story")
                                .font(.custom(Montserrat.regular, size: 18.0))
                            Spacer()
                            Button {
                                print("tradeStoreButtonDidTap")
                            } label: {
                                Image("arrow_right")
                            }
                            .padding()
                        }
                        
                        //MARK: - Payment method
                        HStack {
                            Image("icon_balance")
                            Text("Payment method")
                                .font(.custom(Montserrat.regular, size: 18.0))
                            Spacer()
                            Button {
                                print("paymentMethodButtonDidTap")
                            } label: {
                                Image("arrow_right")
                            }
                            .padding()
                        }
                        
                        //MARK: - Balance
                        HStack {
                            Image("icon_balance")
                            Text("Balance")
                                .font(.custom(Montserrat.regular, size: 18.0))
                            Spacer()
                            Button {
                                
                            } label: {
                                Text("$ 1593")
                                    .font(.custom(Montserrat.regular, size: 18.0))
                                    .foregroundColor(Color(uiColor: .label))
                            }
                            .padding()
                        }
                        
                        //MARK: - Trade history
                        HStack {
                            Image("icon_balance")
                            Text("Trade history")
                                .font(.custom(Montserrat.regular, size: 18.0))
                            Spacer()
                            Button {
                                print("paymentMethodButtonDidTap")
                            } label: {
                                Image("arrow_right")
                            }
                            .padding()
                        }
                        
                        //MARK: - Restore Purchase
                        HStack {
                            Image("icon_refresh")
                            Text("Restore Purchase")
                                .font(.custom(Montserrat.regular, size: 18.0))
                            Spacer()
                            Button {
                                print("paymentMethodButtonDidTap")
                            } label: {
                                Image("arrow_right")
                            }
                            .padding()
                        }
                        
                        //MARK: - Help
                        HStack {
                            Button {
                                print("paymentMethodButtonDidTap")
                            } label: {
                                Image("icon_about")
                            }
                            Text("Help")
                                .font(.custom(Montserrat.regular, size: 18.0))
                            Spacer()
                        }
                        
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
            .onAppear {
                guard let image = UIImage(named: "profile_image") else { return }
                self.image = image
            }
        }
    }
}
