//
//  ContentView.swift
//  AiPaintSearch
//
//  Created by to on 2022/11/10.
//

import SwiftUI

struct ImageCard: View {

    var image:ImageItem
    
    var body: some View {
        
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: image.srcSmall)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
        }
        .frame(width: UIScreen.main.bounds.width / 2)
    }
            
    
}

struct ImageCard_Previews: PreviewProvider {
    static var previews: some View {
        ImageCard(image: imageList[0])
    }
}
