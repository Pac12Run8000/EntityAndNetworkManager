//
//  NetworkingError.swift
//  EntityAndNetworkManager
//
//  Created by Michelle Grover on 5/5/23.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
}

enum ResponseError:Error {
    case noData
    case noUrl
    case badStatusCode
    case badResponse
    case invalidUrl
    case unknownError
    case serverNotMatchingHostname
}
