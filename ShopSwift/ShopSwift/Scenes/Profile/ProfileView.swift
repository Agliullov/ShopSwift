//
//  ProfileView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 15.03.2023.
//

import SwiftUI
import AGLUI

struct ProfileView: View {
        
    var body: some View {
        VStack {
            //MARK: - Navigation title, profile image, change photo button
            ProfileImageView()
            
            //MARK: - User name, upload item button
            ProfileButtonView()
            
            //MARK: - Actions
            ProfileActionView()
        }
    }
}
