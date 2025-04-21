//
//  MainTabView.swift
//  FileManager
//
//  Created by EZen on 2025/04/21.
//

import SwiftUI

struct MainTabView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(.white)
    }
    
    var body: some View {
        TabView {
            Tab("推荐", systemImage: "square.filled.on.square") {
                ContentView()
            }
            Tab("笔记", systemImage: "note.text") {
                NoteView()
            }
        }
    }
}


#Preview {
    MainTabView()
        .environmentObject(ViewModel())
}
