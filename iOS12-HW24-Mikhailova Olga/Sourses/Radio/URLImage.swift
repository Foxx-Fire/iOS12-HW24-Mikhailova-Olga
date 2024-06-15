//
//  URLImage.swift
//  iOS12-HW24-Mikhailova Olga
//
//  Created by FoxxFire on 15.06.2024.
//

import SwiftUI

struct URLImage: View {
    let url: String
    let someRadio: String
    
    @ObservedObject var imageLoader = ImageLoader()
    
    init(url: String, someRadio: String = "radio") {
        self.url = url
        self.someRadio = someRadio
        self.imageLoader.downloadImage(url: self.url)
    }
    
    var body: some View {
        if let data = self.imageLoader.downloadedData {
            return Image(uiImage: UIImage(data: data) ?? UIImage()).renderingMode(.original).resizable()
        } else {
            return Image("radio").renderingMode(.original).resizable()
        }
    }
}

#Preview {
    URLImage(url: "https://fyrafix.files.wordpress.com/2011/08/url-8.jpg")
}

