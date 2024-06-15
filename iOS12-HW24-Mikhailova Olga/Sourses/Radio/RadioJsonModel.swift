//
//  RadioJsonModel.swift
//  iOS12-HW24-Mikhailova Olga
//
//  Created by FoxxFire on 15.06.2024.
//

import Foundation

struct RSS: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let results: [Result]
}

struct Result: Decodable, Hashable{
    let id, name, kind, url, artworkUrl100: String
}

final class RadioJsonModel: ObservableObject {
    @Published var results = [Result]()
    
    func getRadio() {
        guard let url = URL(string: "https://rss.applemarketingtools.com/api/v2/us/music/most-played/25/playlists.json") else {fatalError("Incorrect URL")}
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            do {
                let response = try JSONDecoder().decode(RSS.self, from: data)
                self.results = response.feed.results
            } catch {
                print("Failed to decode \(error)")
            }
        }.resume()
    }
}
