//
//  DailyItemView.swift
//  TodayInHistory
//
//  Created by EZen on 2025/04/17.
//

import SwiftUI

struct DailyItemView: View {
    
    var id: Int
    var year: Int
    var content: String
    
    var body: some View {
        
        HStack(spacing: 5) {
            /// 年
            Text("\(year)")
                .font(.system(size: 16))
                .bold()
                .foregroundColor(.black)
                .frame(minWidth: 60, maxHeight: .infinity)
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(10)
            
            /// 描述
            Text("\(content)")
                .font(.system(size: 16))
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.systemGray5))
                .cornerRadius(10)
        }
        //.frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.vertical, 0)
    }
}


#Preview {
    DailyItemView(id: 1, year: 2000, content: "此时，需要从网络上请求返回数据到本地，第10章分享的实现方式是在当前视图上创建并调用网络请求方法，本章转向使用视图模型来分离视图和方法的代码。")
}
