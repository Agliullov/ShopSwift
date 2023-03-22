//
//  FlashSaleProductsModel.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 11.03.2023.
//

import Foundation

public struct FlashSaleProductsModel: Codable {
    public let flashSale: [FlashSale]
    
    enum CodingKeys: String, CodingKey {
        case flashSale = "flash_sale"
    }
}

public struct FlashSale: Codable, Hashable {
    public let category: String
    public let name: String
    public let price: Double
    public let discount: Int
    public let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case category
        case name
        case price
        case discount
        case imageURL = "image_url"
    }
}
