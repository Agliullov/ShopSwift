//
//  MainViewModel.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 30.03.2023.
//

import Foundation
import AGLDomain

final class MainViewModel: ObservableObject {
    
    @Published var searchBarText: String = ""
    @Published var isLoading: Bool = false
    
    var latest: LatestProductsModel?
    var flash: FlashSaleProductsModel?
    var search: SearchProductsModel?
    
    private var networkManager: NetworkManager
    
    static var mainURL = "https://run.mocky.io/v3/"
    
    enum EndPoints: String{
        case latest = "cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
        case flash = "a9ceeb6e-416d-4352-bde6-2203416576ac"
        case details = "f7f99d04-4971-45d5-92e0-70333383c239"
        case search = "4c9cd822-9479-4509-803d-63197e5a9e19"
        
        var url: String {
            return MainViewModel.mainURL + self.rawValue
        }
    }
    
    init() {
        self.networkManager = NetworkManager()
        getMainData()
    }
    
    private func getMainData() {
        Task {
            self.latest = await self.networkManager.getLatestItems(EndPoints.latest.url)
            self.flash = await self.networkManager.getFlashSaleItems(EndPoints.flash.url)
            
            executeInMainQueue {
                self.isLoading = true
            }
        }
    }
    
    func getSearchData() {
        Task {
            self.search = await self.networkManager.getSearchItems(EndPoints.search.url)
        }
    }
}
