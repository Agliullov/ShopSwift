//
//  DetailsProductsModel.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 11.03.2023.
//

import Foundation

public struct DetailsProductsModel: Codable {
    public let name: String
    public let description: String
    public let rating: Double
    public let numberOfReviews: Int
    public let price: Int
    public let colors: [String]
    public let imageURLs: [String]
    
    enum CodingKeys: String, CodingKey {
        case name
        case description
        case rating
        case numberOfReviews = "number_of_reviews"
        case price
        case colors
        case imageURLs = "image_urls"
    }
}
