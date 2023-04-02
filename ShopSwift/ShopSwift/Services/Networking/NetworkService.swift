//
//  NetworkService.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 11.03.2023.
//

import Foundation
import AGLUI

protocol Networking: AnyObject {
    func request(urlString: String) async -> Result<Data?, Error>
}

final class NetworkService {
    
    private let queue: DispatchQoS
    
    init(queue: DispatchQoS = .utility) {
        self.queue = queue
    }
}

private extension NetworkService {
    
    func createDataTask(from request: URLRequest) async throws -> Result<Data?, Error> {
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { return .failure(NSError.badRequest() as Error) }
        return .success(data)
    }
}

extension NetworkService: Networking {
    
    func request(urlString: String) async -> Result<Data?, Error> {
        guard let url = URL(string: urlString) else { return .failure(NSError.emptyData() as Error)}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        do {
            let result = try await self.createDataTask(from: request)
            return result
        } catch (let error) {
            return .failure(error)
        }
    }
}
