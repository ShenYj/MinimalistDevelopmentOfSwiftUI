//
//  NoteCard.swift
//  FileManager
//
//  Created by EZen on 2025/04/21.
//

import SwiftUI

struct NoteCard: View {
 
    var sentence: String
    var create_time: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(sentence)
                    .lineLimit(2)
                Spacer()
                Text(create_time)
                    .foregroundColor(.gray)
            }
        }
        .frame(maxWidth: .infinity, minHeight: 60, maxHeight: 80)
        .padding()
        .background(.white)
        .cornerRadius(16)
        .padding(.horizontal)
    }
}

#Preview {
    NoteCard(sentence: "这理应是一个审美多元的年代，每个人都有爱美的权利。", create_time: "1999-10-10")
}
