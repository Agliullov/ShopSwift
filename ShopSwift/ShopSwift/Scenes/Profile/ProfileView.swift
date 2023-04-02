//
//  ProfileView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 15.03.2023.
//

import SwiftUI
import AGLUI

struct ProfileView: View {
        
    @EnvironmentObject private var viewModel: ProfileViewModel
    @EnvironmentObject private var authService: AuthorizationService
    
    var body: some View {
        VStack {
            //MARK: - Navigation title, profile image, change photo button
            ProfileImageView()
                .environmentObject(viewModel)
            
            //MARK: - User name, upload item button
            ProfileButtonView()
            
            //MARK: - Actions
            ProfileActionView()
                .environmentObject(authService)
        }
        .navigationBarHidden(true)
    }
}
