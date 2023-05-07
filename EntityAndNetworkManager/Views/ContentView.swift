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
    @State var inputText:String = ""
    @State var sentence:String = "Hello, World"
    
    var body: some View {
        VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    
                    TextField("Enter English Text", text: $inputText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button("Translate to Yoda Speak") {
                        viewModel.fetchTranslationText(sentence: inputText)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    Text("Yoda Speak Output:")
                        .font(.headline)
                    
            Text(viewModel.sentence)
                        .padding()
                        .multilineTextAlignment(.center)
                }
                .padding()
        /** VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            Text(viewModel.sentence)
                            .padding()
            
            TextField("Enter Sentence", text: Binding(
                get: {
                    viewModel.sentence
                },
                set: {
                    viewModel.sentence = $0
                }
            ))
            
                            
        }  ***/
        .padding()
        .onAppear {
           /// viewModel.fetchTranslationText(sentence: "You are what you eat.")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
