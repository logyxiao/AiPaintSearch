//
//  ContentView.swift
//  AiPaintSearch
//
//  Created by to on 2022/11/10.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var imageModel = ImageModel()
    
    var body: some View {

        HStack(alignment: .top) {
            ScrollView {
                
                HStack(alignment: .top) {
                    VStack {
                        ForEach(Array(imageModel.images.enumerated()), id: \.offset) { index, image in
                            if(index % 2 == 0){
                                ImageCard(image: image)
                            }
                        }
                    }
                    
                    VStack {
                        ForEach(Array(imageModel.images.enumerated()), id: \.offset) { index, image in
                            if(index % 2 != 0){
                                ImageCard(image: image)
                            }
                        }
                    }
                    
                    Spacer()
         
                }
            }
           
        }
        .task {
          await  imageModel.fetchImages()
        }
            
        
    }
    

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
