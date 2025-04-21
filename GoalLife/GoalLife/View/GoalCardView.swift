//
//  GoalCardView.swift
//  GoalLife
//
//  Created by EZen on 2025/04/21.
//

import SwiftUI

struct GoalCardView: View {
    
    var goalText: String
    var targetDate: Date
    var currentProress: Int
    
    var body: some View {
        VStack(spacing: 48) {
            VStack(spacing: 20) {
                goalTextView
                targetDateView
                untilTargetDaysView
            }
            subjectImageView
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
        .cornerRadius(16)
    }
    
    /// 目标
    private var goalTextView: some View {
        Text(goalText)
            .font(.system(size: 28))
            .bold()
            .lineLimit(1)
    }
    /// 达成日期
    private var targetDateView: some View {
        Label(targetDate.toString() + "前", systemImage: "calendar")
            .foregroundColor(.gray)
    }
    /// 剩余天数
    private var untilTargetDaysView: some View {
        Text("剩余\(Date().daysUntilDate(targetDate))天")
            .foregroundColor(.white)
            .bold()
            .padding()
            .background(.orange)
            .clipShape(Capsule())
    }
    /// 主题图片
    private var subjectImageView: some View {
        Image("onboarding1")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 320)
            .cornerRadius(8)
    }
}


#Preview {
    GoalCardView(goalText: "测试", targetDate: Date(), currentProress: 95)
}
