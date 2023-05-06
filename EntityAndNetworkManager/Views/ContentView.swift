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
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            self.viewModel.translate(sentence: "You are what you eat")
            print("Test:\(self.viewModel.translation)")
            print("self.viewModel.$ent:\(self.viewModel.ent)")
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
