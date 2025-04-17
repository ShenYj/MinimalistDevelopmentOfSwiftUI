//
//  BMIResultView.swift
//  BMI
//
//  Created by EZen on 2025/04/15.
//

import SwiftUI

struct BMIResultView: View {
    
    @Binding var height: Float
    @Binding var weight: Float
    @Binding var bmiNum: Float
    @Binding var bmiResult: String
    @Binding var bmiColor: Color
    
    //@Binding var showBMIResultView: Bool
    /// SwiftUI可以访问presentationMode环境值，该环境值用于管理视图的显示和关闭
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            computeResultView
            Spacer()
            reComputeBtnView
        }
        .navigationBarHidden(true)
    }
    
    /// 计算结果
    private var computeResultView: some View {
        
        VStack(spacing: 20) {
            Text("你的 BMI 是")
                .font(.system(size: 17))
                .foregroundColor(.gray)
            Text(String(format: "%.2f", bmiNum))
                .font(.system(size: 48))
                .bold()
                .foregroundColor(.green)
            
            Text(bmiResult)
                .font(.system(size: 23))
                .bold()
                .foregroundColor(.white)
                .padding(.vertical, 6)
                .padding(.horizontal, 30)
                .background(bmiColor)
                .cornerRadius(32)
            
            HStack {
                Text(String(format: "%.0f", height) + "cm")
                Text("|")
                Text(String(format: "%.0f", weight) + "kg")
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemGray6))
        .cornerRadius(16)
        .padding()
    }
    
    /// 重新计算按钮
    private var reComputeBtnView: some View {
        Button {
            height = 0
            weight = 0
            bmiNum = 0
            bmiResult = ""
            bmiColor = .gray
            presentationMode.wrappedValue.dismiss()
        } label: {
            HStack {
                Image(systemName: "gobackward")
                Text("重新计算")
            }
            .font(.system(size: 17))
            .foregroundColor(.white)
            .frame(width: 200, height: 48)
            .background(Color.blue)
            .cornerRadius(8)
            .padding(.horizontal)
        }

    }
}

#Preview {
    BMIResultView(height: .constant(10), weight: .constant(10), bmiNum: .constant(10), bmiResult: .constant("-"), bmiColor: .constant(.gray))
}
