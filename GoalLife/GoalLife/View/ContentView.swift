//
//  ContentView.swift
//  GoalLife
//
//  Created by EZen on 2025/04/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var goalViewModel: GoalViewModel
    @State var showMainPage: Bool = false
    @State var showCreateGoalView: Bool = false
    
    var body: some View {
        ZStack {
            Color(.systemGray4).ignoresSafeArea()
            
            if showMainPage {
                VStack {
                    topBarView
                    goalCardListView
                }
            }
            else {
                OnboardingView(enterMainPage: $showMainPage)
            }
        }
        .onAppear() {
            goalViewModel.fetchData()
        }
        .sheet(isPresented: $showCreateGoalView) {
            CreateGoalView(goalViewModel: goalViewModel)
                .presentationDetents([.height(UIScreen.main.bounds.height / 3 * 2)])
        }
    }
    
    /// 目标卡片列表
    private var goalCardListView: some View {
        TabView {
            ForEach(goalViewModel.goals) { goal in
                GoalCardView(goalText: goal.goalText, targetDate: goal.targetDate, currentProress: goal.currentProgress)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
    
    /// 界面标题&新增操作
    private var topBarView: some View {
        HStack {
            Text("目标人生")
                .font(.title)
                .bold()
            Spacer()
            Button {
                self.showCreateGoalView.toggle()
            } label: {
                Label("新增", systemImage: "plus")
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                    .background(.black)
                    .clipShape(Capsule())
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ContentView(goalViewModel: GoalViewModel())
}
