//
//  ContentView.swift
//  iOS12-HW24-Mikhailova Olga
//
//  Created by FoxxFire on 15.06.2024.
//

import SwiftUI

struct RadioChapter: View {
    @ObservedObject var radios = RadioJsonModel()
    
    let rows = [ GridItem(.flexible(minimum: 200, maximum: 300), spacing: 10)]
    let columns = [ GridItem(.flexible(minimum: 300, maximum: 430), spacing: 18, alignment: .leading)]
    
    var body: some View {
        NavigationStack() {
            Divider()
            ScrollView {
                VStack {
                    ScrollView(.horizontal,
                               showsIndicators: false) {
                        LazyHGrid(rows: rows) {
                            ForEach(radios.results, id: \.id) { index in
                                NavigationLink(destination: Text(index.url)) {
                                    VStack(alignment: .leading) {
                                        Text(index.kind)
                                            .font(.system(size: 20))
                                            .foregroundStyle(.gray)
                                            .lineLimit(1)
                                        Text(index.name)
                                            .font(.system(size: 22))
                                            .foregroundStyle(.black)
                                            .lineLimit(1)
                                        Text(index.name).font(.system(size: 22))
                                            .foregroundStyle(.gray)
                                            .lineLimit(1)
                                        URLImage(url: index.artworkUrl100)
                                            .frame(width: 340, height: 260)
                                            .cornerRadius(6)
                                    } //VStack
                                } // NavigationLink
                            } // ForEach
                        } // LazyHGrid
                    } // ScrollView
                               .padding(.horizontal, 12)
                    Divider()
                    
                    Text("Станции")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: columns) {
                            ForEach(radios.results, id: \.id){ index in
                                HStack(){
                                    URLImage(url: index.artworkUrl100)
                                        .frame(width: 100, height: 100, alignment: .leading)
                                        .cornerRadius(8)
                                    VStack(alignment: .leading) {
                                        Text(index.name)
                                            .font(.system(size: 20))
                                            .lineLimit(1)
                                        Text(index.kind)
                                            .foregroundStyle(.gray)
                                            .font(.system(size: 18))
                                            .lineLimit(1)
                                    }
                                } // HStack
                                Divider()
                            } //ForEach
                        } // LazyVGrid
                    } // ScrollView .vertical stations
                    .padding(.horizontal, 12)
                } // VStack main
            } // ScrollView(.vertical) main
            .navigationTitle("Радио")
        }  // NavigationStack
        .onAppear {
            radios.getRadio()
        }
    }
}

#Preview {
    RadioChapter()
}

