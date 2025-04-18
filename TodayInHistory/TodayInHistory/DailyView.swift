//
//  DailyView.swift
//  TodayInHistory
//
//  Created by EZen on 2025/04/17.
//

import SwiftUI

struct DailyView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                ForEach(viewModel.historyDaily, id: \.id) { item in
                    DailyItemView(id: item.id, year: item.year, content: item.body)
                }
            }
            .contentMargins(.all, 0)
            .background(.green)
            .navigationTitle("历史上的今天")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            viewModel.fetchDatas()
        }
        
    }
}

#Preview {
    DailyView()
}
