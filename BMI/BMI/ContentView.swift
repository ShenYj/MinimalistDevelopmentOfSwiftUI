//
//  ContentView.swift
//  BMI
//
//  Created by EZen on 2025/04/15.
//

import SwiftUI

struct ContentView: View {
    
    @State private var height: Float = 0
    @State private var weight: Float = 0
    @State private var bmiNum: Float = 0
    @State private var bmiResult: String = "正常"
    @State private var bmiColor: Color = .green
    
    @State private var showBMIResultView: Bool = false
    
    var body: some View {
        
        NavigationStack {
            
            ZStack(alignment: .bottom) {
                inputFormView
                VStack(spacing: 48) {
                    bmiReferenceView
                    computeBtnView
                }
            }
            .navigationTitle("BMI计算器")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(isPresented: $showBMIResultView) {
                BMIResultView(height: $height, weight: $weight, bmiNum: $bmiNum, bmiResult: $bmiResult, bmiColor: $bmiColor)
            }
        }
        
    }
    
    /// 信息录入
    private var inputFormView: some View {
        Form {
            LabeledContent("身高(cm)") {
                TextField("请输入", value: $height, format: .number)
                    .foregroundColor(.black)
            }
            LabeledContent("体重(kg)") {
                TextField("请输入", value: $weight, format: .number)
                    .foregroundColor(.black)
            }
        }
        .multilineTextAlignment(.trailing)
        .foregroundColor(.gray)
    }
    
    /// 参考标准
    private var bmiReferenceView: some View {
        VStack(spacing: 20) {
            HStack {
                Image(systemName: "paperplane")
                Text("参考标准")
                    .font(.title3)
                    .bold()
            }
            
            BMIReferenceItemView(bmiColor: .blue, bmiResult: "过轻", bmiScope: "BMI<=18.5")
            BMIReferenceItemView(bmiColor: .green, bmiResult: "正常", bmiScope: "18.5<BMI<=24")
            BMIReferenceItemView(bmiColor: .yellow, bmiResult: "过重", bmiScope: "24<BMI<=28")
            BMIReferenceItemView(bmiColor: .orange, bmiResult: "肥胖", bmiScope: "28<BMI<=32")
            BMIReferenceItemView(bmiColor: .red, bmiResult: "重度肥胖", bmiScope: "32<BMI")
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .padding(.horizontal)
    }
    
    /// 计算按钮
    private var computeBtnView: some View {
        Button {
            guard height > 0 && weight > 0 else {
                print("请填写身高和体重")
                return
            }
            self._computeBMIResult()
            self.showBMIResultView.toggle()
        } label: {
            Text("立即计算")
                .font(.system(size: 17))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 48)
                .background(Color.green)
                .cornerRadius(16)
                .padding(.horizontal)
        }

    }
}

#Preview {
    ContentView()
}


extension ContentView {
    
    private func _computeBMIResult() {
        let squaredHeight = (height / 100) * (height / 100)
        bmiNum = weight / squaredHeight
        _updateBMIResult()
    }
    
    private func _updateBMIResult() {
        switch bmiNum {
        case ...18.5:
            bmiResult = "过轻"
            bmiColor = .blue
        case 18.5 ..< 24:
            bmiResult = "正常"
            bmiColor = .green
        case 24 ..< 28:
            bmiResult = "过重"
            bmiColor = .yellow
        case 28 ..< 32:
            bmiResult = "肥胖"
            bmiColor = .orange
        default:
            bmiResult = "重度肥胖"
            bmiColor = .red
        }
    }
}
