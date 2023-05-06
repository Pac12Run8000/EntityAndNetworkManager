//
//  URLUtility.swift
//  EntityAndNetworkManager
//
//  Created by Michelle Grover on 5/6/23.
//

import Foundation


struct URLUtility {
    
    public static func buildURL(with sentence: String) -> URL? {
        var urlComponents = URLComponents(string: "https://api.funtranslations.com/translate/yoda.json")
        urlComponents?.queryItems = [URLQueryItem(name: "text", value: sentence)]
        return urlComponents?.url
    }
}

