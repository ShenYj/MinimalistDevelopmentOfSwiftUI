//
//  ProfileView.swift
//  TodayInHistory
//
//  Created by EZen on 2025/04/18.
//

import SwiftUI
import StoreKit

struct ProfileView: View {
    
    @State private var isBellSlash: Bool = UserDefaults.standard.bool(forKey: "isBellSlash")
    /**
     @AppStorage 是 SwiftUI 提供的一个属性包装器，用于在应用的 UserDefaults 中存储和读取少量数据，非常适合保存用户偏好设置或简单的应用状态。
     
     @AppStorage 是 UserDefaults 的 SwiftUI 集成版本，它提供了响应式的能力 - 当存储的值改变时，所有使用该值的视图都会自动更新
     */
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    @State private var selectedColor: Color = .white
    @State private var selectedLanguage: String = "简体中文"
    @State private var languages = ["简体中文", "繁体中文", "英文"]
    
    @State private var selectedNumber: Int = 17
    
    var body: some View {
        NavigationStack {
            
            Form {
                /// 常规设置
                Section {
                    notificationToggleView
                    darkModeToggleView
                } header: {
                    Text("常规设置")
                }
                .padding(.vertical, 3)
                
                /// 个性化
                Section {
                    colorPickerView
                    languagePickerView
                    fontSizeStepperView
                } header: {
                    Text("个性化")
                }
                .padding(.vertical, 6)
                
                /// 关于我们
                Section {
                    feedbackBtnView
                    appReviewBtnView
                    aboutAsBtnView
                } header: {
                    Text("关于我们")
                }
                .padding(.vertical, 8)
            }
            .navigationTitle("我的")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    /// 消息通知
    private var notificationToggleView: some View {
        Toggle(isOn: $isBellSlash) {
            HStack {
                Image(systemName: "bell")
                    .font(.system(size: 20))
                Text("消息通知")
            }
        }
        .onChange(of: isBellSlash) { oldValue, newValue in
            UserDefaults.standard.set(newValue, forKey: "isBellSlash")
            UserDefaults.standard.synchronize()
        }
    }
    /// 暗黑模式
    private var darkModeToggleView: some View {
        Toggle(isOn: $isDarkMode) {
            HStack {
                Image(systemName: "moon.stars")
                    .font(.system(size: 20))
                Text("深色模式")
            }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
    
    /// 主题颜色
    private var colorPickerView: some View {
        ColorPicker(selection: $selectedColor) {
            HStack {
                Image(systemName: "paintbrush")
                    .font(.system(size: 20))
                Text("主题颜色")
            }
        }
    }
    /// 系统语言
    private var languagePickerView: some View {
        Picker(selection: $selectedLanguage) {
            ForEach(languages, id: \.self) { language in
                Text(language)
            }
        } label: {
            HStack {
                Image(systemName: "waveform")
                    .font(.system(size: 20))
                Text("系统语言")
            }
        }
        .pickerStyle(.automatic)
    }
    
    /// 字体大小
    private var fontSizeStepperView: some View {
        Stepper(value: $selectedNumber, in: 1...48) {
            HStack {
                Image(systemName: "a.circle")
                    .font(.system(size: 20))
                Text("字体大小: " + "\(selectedNumber)")
            }
        }
    }
    
    /// 意见反馈
    private var feedbackBtnView: some View {
        Button {
            
        } label: {
            HStack {
                Image(systemName: "ellipsis.message")
                    .font(.system(size: 20))
                Text("意见反馈")
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
    /// 去Apple Store 评分
    private var appReviewBtnView: some View {
        Button {
            self._appReview()
        } label: {
            HStack {
                Image(systemName: "star")
                    .font(.system(size: 20))
                Text("去Apple Store评分")
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
    /// 关于应用
    private var aboutAsBtnView: some View {
        Button {
            self._appReview()
        } label: {
            HStack {
                Image(systemName: "person")
                    .font(.system(size: 20))
                Text("关于应用")
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    ProfileView()
}

extension ProfileView {
    
    private func _appReview() {
        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            AppStore.requestReview(in: scene)
        }
    }
}
