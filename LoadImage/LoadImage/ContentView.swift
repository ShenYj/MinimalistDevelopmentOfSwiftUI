//
//  ContentView.swift
//  LoadImage
//
//  Created by EZen on 2025/04/17.
//

import SwiftUI

struct ContentView: View {
    
    private let imageURL: String = "https://file.psd.cn/p/stock/20221014/ccemnih3yxg.jpg"
    
    @State private var image: UIImage? = nil
    
    var body: some View {
        
        VStack {
            if let image {
                webImageView(image: image)
            }
            else {
                emptyImageView
            }
        }
        .onAppear(perform: _loadImage)
    }
    
    private func webImageView(image: UIImage) -> some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(8)
            .padding()
    }
    
    private var emptyImageView: some View {
        VStack(spacing: 20) {
            ProgressView()
            Text("加载失败")
        }
    }
    
    private func _loadImage() {
        
        Task {
            guard let url = URL(string: imageURL),
                  let (data, response) = try? await URLSession(configuration: .default).data(from: url),
                  let httpResponse = response as? HTTPURLResponse else { return }
            
            guard httpResponse.statusCode == 200, let fetchedImage = UIImage(data: data) else { return }
            
            self.image = fetchedImage
        }
    }
}

#Preview {
    ContentView()
}
