//
//  WallpaperGridView.swift
//  WallpaperRecommendation
//
//  Created by EZen on 2025/04/17.
//

import SwiftUI

struct WallpaperGridView: View {
    
    // 数据源
    @State private var wallpapers: [Wallpaper] = []
    
    // 网格布局参数
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        NavigationView {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: gridItemLayout, spacing: 10) {
                    ForEach(wallpapers,id: \.id) { wallpaper in
                        WebImageView(imageURL: wallpaper.urls.small)
                    }
                }
            }
            .padding(.horizontal)
            .navigationTitle("壁纸推荐")
        }
        .onAppear(perform: _fetchPhotos)
    }
}

#Preview {
    WallpaperGridView()
}


extension WallpaperGridView {
    
    private func _fetchPhotos() {
        Task {
            /// 模拟网络请求
            self.wallpapers = [
                Wallpaper(id: "1", urls:
                    UnsplashPhotoUrls(small: "https://gd-hbimg.huaban.com/b01dee9036b36e70b37971e93dbf1b715200fd2e1d437-M3tcyP_fw240jpeg")),
                Wallpaper(id: "2", urls:
                    UnsplashPhotoUrls(small: "https://gd-hbimg.huaban.com/98d313007f57934d4b13ee7420ae151468cee4454e945-Tzoy32_fw240jpeg")),
                Wallpaper(id: "3", urls:
                    UnsplashPhotoUrls(small: "https://gd-hbimg.huaban.com/ed180413ac0dc30d7a67b91560802176baf6506026848-TCIFO6_fw240jpeg")),
                Wallpaper(id: "4", urls:
                    UnsplashPhotoUrls(small: "https://gd-hbimg.huaban.com/e8ff706bec1046d7841eeecb1178313e8af20e642b0abb-BCIs6O_fw240jpeg")),
                Wallpaper(id: "5", urls:
                    UnsplashPhotoUrls(small: "https://gd-hbimg.huaban.com/f811ea1f1b69343e5fe38a503fb814e1db3a767d1b20a3-145xeU_fw240jpeg")),
                Wallpaper(id: "6", urls:
                    UnsplashPhotoUrls(small: "https://gd-hbimg.huaban.com/839a57b9a06072898ec11f3feb4b0bf1855dd89310b1f-Gvh4wp_fw240jpeg")),
            ]
        }
    }
}
