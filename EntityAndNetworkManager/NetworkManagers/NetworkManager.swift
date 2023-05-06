//
//  NetworkManager.swift
//  EntityAndNetworkManager
//
//  Created by Michelle Grover on 5/5/23.
//

import Foundation
import Combine

class NetworkManager {
    
    
    public static let shared = NetworkManager()
    private var cancellables:Set<AnyCancellable> = []
    
    private init() {}
    
    public func fetchAPIResponse(url:URL) -> Future<Data, Error> {
        return Future<Data, Error> { [weak self] promise in
            
            URLSession.shared.dataTaskPublisher(for: url)
//                .subscribe(on: DispatchQueue.global(qos: .background))
                .receive(on: DispatchQueue.main)
                .tryMap { (data, response) -> Data in
                    guard let statusCode = (response as? HTTPURLResponse)?.statusCode, (200...300) ~= statusCode else {
                        throw ResponseError.badStatusCode
                    }
                    return data
                }
                .sink(receiveCompletion: { (completion) in
                    if case let .failure(error) = completion {
                        switch error {
                        case let urlError as URLError:
                            promise(.failure(urlError))
                        default:
                            promise(.failure(ResponseError.unknownError))
                        }
                    }

                }, receiveValue: { data in
                    promise(.success(data))
                })
                .store(in: &self!.cancellables)
        }
    }
}




