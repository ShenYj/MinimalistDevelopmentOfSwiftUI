//
//  ContentView.swift
//  AsyncImage
//
//  Created by EZen on 2025/04/17.
//

import SwiftUI

struct ContentView: View {
    
    private let imageLink = "https://images.unsplash.com/photo-1516822477961-1427b7790e80?w=375"
    
    @State private var imageID: UUID = UUID()
    
    var body: some View {
        VStack(spacing: 20) {
            webImageView.id(imageID)
            refreshBtnView
        }
        .cornerRadius(16)
        .padding(.horizontal, 50)
        .padding(.vertical, 40)
    }
}

#Preview {
    ContentView()
}

extension ContentView {
    
    private var webImageView: some View {
        AsyncImage(url: URL(string: imageLink)) { phase in
            switch phase {
            case .empty:
                Text("Loading")
            case .success(let image):
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8)
                    .padding()
            case .failure(let error):
                Text("加载失败")
            @unknown default:
                Spacer()
            }
        }

    }
    
    private var refreshBtnView: some View {
        
        Button {
            self.imageID = UUID()
        } label: {
            HStack {
                Image(systemName: "gobackward")
                Text("重新加载")
            }
            .foregroundColor(.white)
            .padding()
            .background(.green)
            .cornerRadius(8)
            .padding()
        }

    }
}
