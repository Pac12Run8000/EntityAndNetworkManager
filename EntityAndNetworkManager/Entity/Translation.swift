//
//  Translation.swift
//  EntityAndNetworkManager
//
//  Created by Michelle Grover on 5/5/23.
//


import SwiftUI

struct TranslationResponse: Codable {
    let success: Success
    let contents: TranslationContents
}

struct Success: Codable {
    let total: Int
}

struct TranslationContents: Codable {
    let translated: String
    let text: String
    let translation: String
}


