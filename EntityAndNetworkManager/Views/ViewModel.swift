//
//  ContentView+ViewModel.swift
//  EntityAndNetworkManager
//
//  Created by Michelle Grover on 5/6/23.
//

import Foundation
import Combine
import SwiftUI


    
class ViewModel:ObservableObject {
        
        @Published var data:Data?
        @Published var translation:TranslationResponse?
        @Published var sentence:String = ""
    
        var cancellables:Set<AnyCancellable> = []
        
        
        public func fetchTranslationText(sentence:String) {
            guard let url = URLUtility.buildURL(with: sentence) else {return}
            let promise = NetworkManager.shared.fetchAPIResponse(url: url)
            let translatedContent = promise.decode(type: TranslationResponse.self, decoder: JSONDecoder())
            translatedContent.sink { (completion) in
                
                if case let .failure(error) = completion {
                    print("ViewModelCompletion: \(error.localizedDescription)")
                }
                
            } receiveValue: { [weak self] acronym in
                guard let strongSelf = self else {return}
                strongSelf.sentence = acronym.contents.translated
            }.store(in: &cancellables)
            
        }
        
}
    
    
    
    

