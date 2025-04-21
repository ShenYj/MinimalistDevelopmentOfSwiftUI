//
//  ContentView.swift
//  FileManager
//
//  Created by EZen on 2025/04/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var selectedTabIndex = 0
    @State var sentence: String = ""
    
    @State var sentences: [(Color,String)] = [
        (.red,"在那些心情低落经历挫折的日子，幸好有这么一些图书能赶走阴霾，治愈伤痛。"),
        (.green,"这理应是一个审美多元的年代，每个人都有爱美的权利。"),
        (.blue,"这个世界有无数种可能，专注追寻一种可能，它终将会发生。"),
        (.pink,"最好的教育方式，是真诚诉说真实的故事。"),
        (.purple,"文艺感是一直潮流的东西，很多人只是想追随潮流而已。"),
    ]
    
    
    var body: some View {
        ZStack {
            Color(.systemGray6).edgesIgnoringSafeArea(.all)
            VStack(spacing: 48) {
                Text(sentence)
                slideCard
                collectBtnView
            }
        }
        .onAppear() {
            sentence = sentences[selectedTabIndex].1
            print("body appear sentence: \(sentence)")
        }
    }
    
    /// 滚动卡片
    private var slideCard: some View {
        TabView(selection: $selectedTabIndex) {
            ForEach(0..<sentences.count, id: \.self) { index in
                TextCard(bgColor: sentences[index].0, text: sentences[index].1)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .frame(height: UIScreen.main.bounds.height / 3)
        .onChange(of: selectedTabIndex) { oldValue, newValue in
            sentence = sentences[newValue].1
            print("slideCard appear sentence: \(sentence)")
        }
    }
    
    /// 收藏按钮
    private var collectBtnView: some View {
        Button {
            viewModel.addNote(sentence: sentence)
        } label: {
            Label("收藏", systemImage: "square.filled.on.square")
                .bold()
                .foregroundColor(.white)
                .padding(.vertical)
                .padding(.horizontal, 48)
                .background(.green)
                .cornerRadius(16)
        }

    }
    
}

#Preview {
    ContentView()
        .environmentObject(ViewModel())
}
