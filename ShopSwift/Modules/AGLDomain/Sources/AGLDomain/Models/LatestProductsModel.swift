//
//  LatestProductsModel.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 11.03.2023.
//

import Foundation

public struct LatestProductsModel: Codable {
    public let latest: [LatestModel]
}

public struct LatestModel: Codable, Hashable {
    public let category: String
    public let name: String
    public let price: Int
    public let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case category
        case name
        case price
        case imageURL = "image_url"
    }
}
