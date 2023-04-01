//
//  NetworkDataFetcher.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 11.03.2023.
//

import Foundation

protocol NetworkDataFetcherDelegate {
    func getDataUrlFromJson<T>(urlString: String) async -> T? where T : Codable
}

final class NetworkDataFetcher {
    
    private let networking: Networking
    
    init(networking: Networking = NetworkService()) {
        self.networking = networking
    }
}

private extension NetworkDataFetcher {
    
    func decodeJSONData<T>(type: T.Type, from: Data?) -> T? where T : Decodable {
        guard let data = from else { return nil }
        let decoder = JSONDecoder()
        
        do {
            let objects = try decoder.decode(type, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON: \(jsonError.localizedDescription)")
            return nil
        }
    }
}

extension NetworkDataFetcher: NetworkDataFetcherDelegate {
    
    func getDataUrlFromJson<T>(urlString: String) async -> T? where T : Codable {
        
        let result = await networking.request(urlString: urlString)
        
        switch result {
        case .success(let data):
            if let decoded = self.decodeJSONData(type: T.self, from: data) {
                return decoded
            }
            return nil
        case .failure(let error):
            print("Error received requesting data: \(error.localizedDescription)")
            return nil
        }
    }
}
