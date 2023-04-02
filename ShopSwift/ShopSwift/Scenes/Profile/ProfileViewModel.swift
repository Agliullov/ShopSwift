//
//  ProfileViewModel.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 01.04.2023.
//

import Foundation
import PhotosUI
import UIKit
import SwiftUI

final class ProfileViewModel: NSObject, ObservableObject {
    
    @Published var selectedImage: Image = Image("profile_image")
    
    @Published var isNeedShowAlert: Bool = false
    @Published var isLoadIndicatorHidden: Bool = true
    
    var accessHandler: (() -> Void)?
    
    override init() {
        super.init()
        self.accessHandler = { [weak self] in
            self?.getPhotoLibraryAccess()
        }
    }
}

private extension ProfileViewModel {
    func getPhotoLibraryAccess() {
        PHPhotoLibrary.requestAuthorization(for: .addOnly) { status in
            executeInMainQueue {
                switch status {
                case .notDetermined:
                    self.showAlert()
                case .restricted:
                    self.showAlert()
                case .denied:
                    self.showAlert()
                case .authorized:
                    self.selectMediaFromLibrary()
                case .limited:
                    self.showAlert()
                @unknown default:
                    break
                }
            }
        }
    }
    
    func showAlert() {
        self.isNeedShowAlert = true
    }
    
    func selectMediaFromLibrary() {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 1
        
        let imagePicker = PHPickerViewController(configuration: configuration)
        imagePicker.delegate = self
        
        let viewController = UIApplication.shared.connectedScenes.flatMap { ($0 as? UIWindowScene)?.windows ?? [] }.first { $0.isKeyWindow }?.rootViewController
        viewController?.present(imagePicker, animated: true, completion: nil)
    }
}

extension ProfileViewModel: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        self.isLoadIndicatorHidden = false
        
        let imageItems = results.map { $0.itemProvider }.filter { $0.canLoadObject(ofClass: UIImage.self) }
        let dispatchGroup = DispatchGroup()
        var images = [UIImage]()
        
        for imageItem in imageItems {
            dispatchGroup.enter()
            
            imageItem.loadObject(ofClass: UIImage.self) { image, _ in
                if let image = image as? UIImage {
                    images.append(image)
                }
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            guard let image = images.first else { self.isLoadIndicatorHidden = true; return }
            
            self.selectedImage = Image(uiImage: image)
            self.isLoadIndicatorHidden = true
        }
        
        picker.dismiss(animated: true)
    }
}
