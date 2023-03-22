//
//  NetworkDataBlockOperationLoader.swift
//  ShopSwift
//
//  Created by Ильдар Аглиуллов on 16.03.2023.
//

import Foundation
import AGLDomain

final class NetworkDataBlockOperationLoader {
    
    private let downloadQueue: OperationQueue = {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 5
        queue.qualityOfService = .userInteractive
        return queue
    }()
    
    var networkFetcher: NetworkDataFetcher
    
    init(networkFetcher: NetworkDataFetcher = NetworkDataFetcher()) {
        self.networkFetcher = networkFetcher
    }
    
    func getLatestItems(completion: @escaping ((_ items: LatestProductsModel?) -> Void)) {
        let url = "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
        networkFetcher.getDataUrlFromJson(urlString: url, response: completion)
    }
    
    func getFlashSaleItems(completion: @escaping ((_ items: FlashSaleProductsModel?) -> Void)) {
        let url = "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
        networkFetcher.getDataUrlFromJson(urlString: url, response: completion)
    }
    
    func loadData(completion: @escaping (_ latestModel: LatestProductsModel?, _ flashModel: FlashSaleProductsModel?) -> Void) {
        self.downloadQueue.cancelAllOperations()
        
        var loadedLatest: LatestProductsModel?
        var loadedFlashSale: FlashSaleProductsModel?
        
        var operations: [BlockOperation] = []
        let semaphore = DispatchSemaphore(value: 0)
        
        let loadLatestItemsOperation = BlockOperation()
        loadLatestItemsOperation.addExecutionBlock { [weak self, loadLatestItemsOperation] in
            guard let self = self else {
                loadLatestItemsOperation.cancel()
                return
            }
            
            self.getLatestItems { latestModel in
                loadedLatest = latestModel
                semaphore.signal()
            }
            semaphore.wait()
        }
        operations.append(loadLatestItemsOperation)
        
        let loadFlashSaleItemsOperation = BlockOperation()
        loadFlashSaleItemsOperation.addExecutionBlock { [weak self, loadFlashSaleItemsOperation] in
            guard let self = self else {
                loadFlashSaleItemsOperation.cancel()
                return
            }
            
            self.getFlashSaleItems { flashModel in
                loadedFlashSale = flashModel
                semaphore.signal()
            }
            semaphore.wait()
        }
        operations.append(loadFlashSaleItemsOperation)
        
        
        let finishOperation = BlockOperation()
        finishOperation.addExecutionBlock {
            completion(loadedLatest, loadedFlashSale)
        }
        
        operations.forEach({ finishOperation.addDependency($0) })
        
        operations.append(finishOperation)
        
        self.downloadQueue.addOperations(operations, waitUntilFinished: false)
    }
}
