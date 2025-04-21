//
//  CreateGoalView.swift
//  GoalLife
//
//  Created by EZen on 2025/04/21.
//

import SwiftUI

struct CreateGoalView: View {
    
    @ObservedObject var goalViewModel: GoalViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State var goalText: String = ""
    @State var targetDate: Date = Date()
    
    var body: some View {
        
        NavigationStack {
            VStack(spacing: 15) {
                goalTextView
                targetDatePickerView
            }
            .padding(.vertical, 32)
            .navigationBarItems(leading: closeBtnView, trailing: commitBtnView)
        }
    }
    
    /// 目标名称
    private var goalTextView: some View {
        TextField("写下你的目标", text: $goalText)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(16)
            .padding(.horizontal)
    }
    /// 达成日期
    private var targetDatePickerView: some View {
        VStack {
            HStack {
                Text("达成日期")
                Spacer()
                Text(targetDate.toString())
            }
            DatePicker("", selection: $targetDate, in: Date()..., displayedComponents: .date)
                .datePickerStyle(.wheel)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(16)
        .padding(.horizontal)
    }
    
    /// 关闭按钮
    private var closeBtnView: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
            
        } label: {
            Image(systemName: "x.circle.fill")
                .font(.title)
                .foregroundColor(Color(.systemGray3))
        }
    }
    /// 提交按钮
    private var commitBtnView: some View {
        Button {
            
            guard !goalText.isEmpty else {
                return
            }
            goalViewModel.add(GoalText: goalText, targetDate: targetDate)
            presentationMode.wrappedValue.dismiss()
            
        } label: {
            Text("确定")
                .bold()
                .foregroundColor(.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(.green)
                .clipShape(Capsule())
        }
    }
}

#Preview {
    CreateGoalView(goalViewModel: GoalViewModel())
}
