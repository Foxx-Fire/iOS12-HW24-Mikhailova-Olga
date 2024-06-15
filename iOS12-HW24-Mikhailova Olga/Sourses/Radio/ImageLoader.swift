//
//  ImageLoader.swift
//  iOS12-HW24-Mikhailova Olga
//
//  Created by FoxxFire on 15.06.2024.
//

import Foundation

class ImageLoader: ObservableObject {
    @Published var downloadedData: Data?
    
    func downloadImage(url: String) {
        guard let imageURL = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            guard let data = data, error == nil else { return }
            self.downloadedData = data
        }.resume()
    }
}
