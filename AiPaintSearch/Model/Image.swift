//
//  Coin.swift
//  DesignCodeiOS15
//
//  Created by Meng To on 2022-02-24.
//

import SwiftUI

struct ImageResponse<T: Codable> : Codable {
    let images: T
}

struct ImageItem: Codable, Identifiable {
    var id: String
    var gallery: String
    var src: String
    var srcSmall: String
    var prompt: String
    var width: Int
    var height: Int
    var seed: String
    var grid: Bool
    var model: String
    var guidance: Int
    var promptid: String
    var nsfw: Bool
}

class ImageModel: ObservableObject {
    @Published var images: [ImageItem] = []
    
    @MainActor
    func fetchImages() async {
        do {
            let url = URL(string: "https://lexica.art/api/v1/search?q=%E5%BB%BA%E7%AD%91" )!
            let (data, _) = try await URLSession.shared.data(from: url)
          
            let result = try JSONDecoder().decode(ImageResponse<[ImageItem]>.self, from: data).images
            images = result
        } catch {
            print("---Error",error)
        }
    }
    

}

var imageList = [
    ImageItem(id: "te", gallery: "", src: "", srcSmall: "", prompt: "", width: 100, height: 100, seed: "", grid: true, model: "", guidance: 10, promptid: "", nsfw: true),
]
