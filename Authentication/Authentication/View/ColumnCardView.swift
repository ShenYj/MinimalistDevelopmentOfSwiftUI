//
//  ColumnCardView.swift
//  Authentication
//
//  Created by EZen on 2025/04/18.
//

import SwiftUI

struct ColumnCardView: View {
    
    var title: String
    var desc: String
    var columnImage: UIImage
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .font(.title2)
                    .bold()
                Text(desc)
                    .foregroundColor(.gray)
            }
            Spacer()
            Image(uiImage: columnImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .clipped()
        }
        .padding(.horizontal, 32)
        .frame(maxWidth: .infinity, maxHeight: 160)
        .background(.white)
        .cornerRadius(16)
    }
}

#Preview {
    ColumnCardView(title: "身份证正面", desc: "上传身份证人像面", columnImage: UIImage(named: "portrait")!)
}
