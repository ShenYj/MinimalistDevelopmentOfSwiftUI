//
//  BMIReferenceItemView.swift
//  BMI
//
//  Created by EZen on 2025/04/15.
//

import SwiftUI

struct BMIReferenceItemView: View {
    
    var bmiColor: Color
    var bmiResult: String
    var bmiScope: String
    
    var body: some View {
        HStack(spacing: 20) {
            /// 色块
            Rectangle()
                .fill()
                .frame(width: 60, height: 20)
                .cornerRadius(4)
            /// 参考结果
            Text(bmiResult)
                .foregroundColor(bmiColor)
            
            Spacer()
            
            /// BMI 范围
            Text(bmiScope)
        }
    }
}

#Preview {
    BMIReferenceItemView(bmiColor: .red, bmiResult: "test", bmiScope: "0~100")
}
