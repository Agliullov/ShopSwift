//
//  NetworkDataFetcher.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 11.03.2023.
//

import Foundation

protocol NetworkDataFetcherDelegate {
    func getDataUrlFromJson<T: Codable>(urlString: String, response: @escaping (T?) -> Void)
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
    
    func getDataUrlFromJson<T>(urlString: String, response: @escaping (T?) -> Void) where T : Codable {
        networking.request(urlString: urlString) { data, error in
            if let data = data {
                let decoded = self.decodeJSONData(type: T.self, from: data)
                response(decoded)
            } else if let error = error {
                print("Error received requesting data: \(error.localizedDescription)")
                response(nil)
            }
        }
    }
}
