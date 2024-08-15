//
//  RandomPhotoView.swift
//  RandomPhoto
//
//  Created by Lesley Lopez on 8/14/24.
//

import SwiftUI

struct RandomPhotoView: View {
    
    var imageUrl : String
    
    var body: some View {
        
        let url = URL(string: imageUrl)
        
        AsyncImage(url: url){ phase in
            
            if let image = phase.image {
                
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else if phase.error != nil {
                Text("Failed to load the image.")
            } else {
                ProgressView()
            }
            
        }
        .frame(width: 500, height: 500)
    }
}

#Preview {
    RandomPhotoView(imageUrl: "https://images.unsplash.com/photo-1722630810924-5cd9fbf45de7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w2NDM3MjV8MHwxfHJhbmRvbXx8fHx8fHx8fDE3MjM2NzMxMjl8&ixlib=rb-4.0.3&q=80&w=1080")
}
