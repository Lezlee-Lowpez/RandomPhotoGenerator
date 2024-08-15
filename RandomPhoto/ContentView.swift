//
//  ContentView.swift
//  RandomPhoto
//
//  Created by Lesley Lopez on 8/14/24.
//

import SwiftUI

struct ContentView: View {
    
    var dataService = DataService()
    @State var photo = ""
    
    var body: some View {
        
        VStack {
            
            Text("This is a random photo generator")
                .font(.title)
                .bold()
            
            if photo == "" {
                Text("Are you ready for a random photo?")
            } else {
                RandomPhotoView(imageUrl: photo)
            }
            
            
            Button(action: {
                Task{
                    photo = await dataService.getRandomPhoto()
                }
            }, label: {
                Text("Real button")
                    .foregroundStyle(.white)
                    .padding()
            })
            .background(.blue)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
            
            
        }
            
    }
        
}


#Preview {
    ContentView()
}
