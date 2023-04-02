//
//  DetailsViewModel.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 31.03.2023.
//

import Foundation
import AGLDomain

final class DetailsViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var currentImageIndex: Int = 0
    @Published var scaleSumCart: Int = 1
    
    var details: DetailsProductsModel?
    
    private var networkManager: NetworkManager
    
    init() {
        self.networkManager = .init()
        getDetailsData()
    }
}

private extension DetailsViewModel {
    func getDetailsData() {
        Task {
            self.details = await self.networkManager.getDetailsItems(MainViewModel.EndPoints.details.url)
            executeInMainQueue {
                self.isLoading = true
            }
        }
    }
}

extension DetailsViewModel {
    func updateIndex(index: Int) {
        self.currentImageIndex = index
    }
}
