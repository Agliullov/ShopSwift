//
//  ProfileImageView.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 31.03.2023.
//

import SwiftUI
import AGLUI
import PhotosUI

struct ProfileImageView: View {
    
    @ObservedObject var viewModel = ProfileViewModel()
    
    @State private var isShowPhotoLibrary = false
    @State private var boolPerm = PHPhotoLibrary.authorizationStatus()
    
    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 5.0) {
                Text("Profile")
                    .font(.custom(Montserrat.bold, size: 18.0))
                    .foregroundColor(Color(uiColor: .label))
                    .padding(.top, 20.0)
                    .padding(.bottom, 10.0)
                
                ZStack {
                    self.viewModel.selectedImage
                        .resizable()
                        .frame(width: 60.0, height: 60.0)
                        .clipShape(Circle())
                    if !viewModel.isLoadIndicatorHidden {
                        ProgressView()
                            .tint(Color.white)
                    }
                    
                }

                Button {
                    self.isShowPhotoLibrary = true
                    viewModel.accessHandler?()
                } label: {
                    Text("Change photo")
                        .font(.custom(Montserrat.regular, size: 10.0))
                        .foregroundColor(Color(uiColor: .secondaryLabel))
                        .alert(isPresented: $viewModel.isNeedShowAlert) {
                            Alert(title: Text("Сук дай разрешение"), message: Text("Обэма ебаный"), primaryButton: .default(Text("На бля"), action: {
                                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!,
                                                          options: [UIApplication.OpenExternalURLOptionsKey : Any](),
                                                          completionHandler: nil)
                                self.viewModel.isNeedShowAlert = false
                            }), secondaryButton: .cancel(Text("Пшол ты")))
                        }
                }
            }
//            .sheet(isPresented: $isShowPhotoLibrary) {
//                if boolPerm == PHAuthorizationStatus.authorized {
//                    ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
//                }
//            }
        }
    }
}

extension ProfileImageView {
    func checkForPermissions() {
        switch PHPhotoLibrary.authorizationStatus(for: .readWrite) {
        case .authorized:
            break
        case .notDetermined:
            break
        default:
            break
        }
    }
}
