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
        @Published var ent:String = "Norbert"
        
        var cancellables:Set<AnyCancellable> = []
        
        public func translate(sentence:String) {
            
            guard let url = URLUtility.buildURL(with: sentence) else {return}
            
            let promise = NetworkManager.shared.fetchAPIResponse(url: url)
            let translation = promise.decode(type: TranslationResponse.self, decoder: JSONDecoder())
            print("translation:\(translation)")
            translation.sink { (completion) in
                
                if case let .failure(error) = completion {
                    print("ViewModelCompletion: \(error.localizedDescription)")
                }
                
            } receiveValue: { [weak self] sentence in
                guard let strongself = self else {return}
                print("sentence:\(sentence.contents.translated)")
                strongself.sentence = sentence.contents.translated
            }.store(in: &cancellables)
        }
        
}
    
    
    
    

