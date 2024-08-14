//
//  ContentView.swift
//  RandomPhoto
//
//  Created by Lesley Lopez on 8/14/24.
//

import SwiftUI

struct ContentView: View {
    
    var dataService = DataService()
    
    var body: some View {
        VStack {
            Text("This is a random photo generator")
        }.onAppear {
            Task {
                await dataService.getRandomPhoto()
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}
