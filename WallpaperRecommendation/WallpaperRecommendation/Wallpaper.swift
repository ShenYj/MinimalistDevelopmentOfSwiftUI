//
//  Wallpaper.swift
//  WallpaperRecommendation
//
//  Created by EZen on 2025/04/17.
//

import Foundation

struct Wallpaper: Codable {
    
    let id: String
    let urls: UnsplashPhotoUrls
}


struct UnsplashPhotoUrls: Codable {
    let small: String
}
