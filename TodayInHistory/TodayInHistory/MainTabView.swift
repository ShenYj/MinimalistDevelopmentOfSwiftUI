//
//  MainTabView.swift
//  TodayInHistory
//
//  Created by EZen on 2025/04/18.
//

import SwiftUI

struct MainTabView: View {
    
    enum MainTabType {
        case home
        case calendar
        case mine
    }
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @State private var selectedTabIndex: MainTabType = .home
    
    @State private var personUnReadFlag: Bool = true
    
    var body: some View {
        
        TabView(selection: $selectedTabIndex) {
            /// 首页
            Tab("首页", systemImage: "house", value: .home) {
                DailyView()
            }
            .badge(0)
            
            /// 日历
            Tab("日历", systemImage: "calendar", value: .calendar) {
                CalendarView()
            }
            .badge("")
            
            /// 我的
            Tab("我的", systemImage: "person", value: .mine) {
                ProfileView()
            }
            .badge(personUnReadFlag ? "!" : "")
        }
        .tabViewStyle(.tabBarOnly)
        .onChange(of: horizontalSizeClass, initial: true) { oldValue, newValue in
            
            if let oldValue, let newValue {
                print("horizontalSizeClass oldValue: \(oldValue) newValue: \(newValue)")
            }
        }
        
    }
}

#Preview {
    MainTabView()
}



