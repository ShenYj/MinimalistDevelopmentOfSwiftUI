//
//  TextCard.swift
//  FileManager
//
//  Created by EZen on 2025/04/21.
//

import SwiftUI

struct TextCard: View {
    
    var bgColor: Color
    var text: String
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(bgColor)
                .cornerRadius(16)
                .opacity(0.5)
            Text(text)
                .font(.system(size: 20))
                .foregroundColor(.white)
                .padding(32)
        }
        .frame(height: UIScreen.main.bounds.height / 3)
        .padding()
    }
}

#Preview {
    TextCard(bgColor: .red, text: "这理应是一个审美多元的年代，每个人都有爱美的权利。")
}
