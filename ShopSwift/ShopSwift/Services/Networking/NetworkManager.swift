//
//  NetworkManager.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 16.03.2023.
//

import Foundation
import AGLDomain

protocol NetworkManagerProtocol: AnyObject {
    func getLatestItems(_ url: String) async -> LatestProductsModel?
    func getFlashSaleItems(_ url: String) async -> FlashSaleProductsModel?
    func getDetailsItems(_ url: String) async -> DetailsProductsModel?
    func getSearchItems(_ url: String) async -> SearchProductsModel?
}

final class NetworkManager {
    
    private var networkFetcher: NetworkDataFetcher
    
    init(networkFetcher: NetworkDataFetcher = NetworkDataFetcher()) {
        self.networkFetcher = networkFetcher
    }
}

extension NetworkManager: NetworkManagerProtocol {
    func getLatestItems(_ url: String) async -> LatestProductsModel? {
        return await networkFetcher.getDataUrlFromJson(urlString: url)
    }
    
    func getFlashSaleItems(_ url: String) async -> FlashSaleProductsModel? {
        return await networkFetcher.getDataUrlFromJson(urlString: url)
    }
    
    func getDetailsItems(_ url: String) async -> DetailsProductsModel? {
        return await networkFetcher.getDataUrlFromJson(urlString: url)
    }
    
    func getSearchItems(_ url: String) async -> SearchProductsModel? {
        return await networkFetcher.getDataUrlFromJson(urlString: url)
    }
}
