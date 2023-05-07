//
//  ContentView.swift
//  EntityAndNetworkManager
//
//  Created by Michelle Grover on 5/5/23.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    @State var sentence:String = "Hello, World"
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            TextField("Enter Sentence", text: Binding(
                get: {
                    viewModel.sentence
                },
                set: {
                    viewModel.sentence = $0
                }
            ))
                            
        }
        .padding()
        .onAppear {
            viewModel.fetchTranslationText(sentence: "You are what you eat.")
            
            print("viewModel.sentence:[\(viewModel.sentence)]")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
