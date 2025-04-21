//
//  OnboardingView.swift
//  GoalLife
//
//  Created by EZen on 2025/04/21.
//

import SwiftUI

struct OnboardingView: View {
    
    @Binding var enterMainPage: Bool
    
    var body: some View {
        VStack(spacing: 48) {
            tabPageView
            startBtnView
        }
    }
    
    private var startBtnView: some View {
        Button {
            self.enterMainPage.toggle()
        } label: {
            Label("开始使用", systemImage: "paperplane")
                .foregroundColor(.white)
                .bold()
                .frame(width: 150, height: 50)
                .background(.black)
                .clipShape(Capsule())
        }

    }
    
    private var tabPageView: some View {
        TabView {
            OnboardingPageView(imageName: "onboarding1", title: "目标打卡", description: "看见每一天的改变")
            OnboardingPageView(imageName: "onboarding2", title: "每日计划", description: "养成自律好习惯")
            OnboardingPageView(imageName: "onboarding3", title: "自我管理", description: "认真对待每一个目标")
            OnboardingPageView(imageName: "onboarding4", title: "付诸行动", description: "聚焦你的目标")
            OnboardingPageView(imageName: "onboarding5", title: "重启人生", description: "成为更好得自己")
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

#Preview {
    OnboardingView(enterMainPage: .constant(false))
}
