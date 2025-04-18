//
//  CalendarView.swift
//  TodayInHistory
//
//  Created by EZen on 2025/04/18.
//

import SwiftUI

struct CalendarView: View {
    
    @StateObject var viewModel = ViewModel()
    
    private let daysInWeek = ["日", "一", "二", "三", "四", "五", "六"]
    private let gridItemLayout = Array(repeating: GridItem(), count: 7)
    
    private let dateFormatter = {
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy年 MM月dd日"
        return fmt
    }()
    
    var body: some View {
        NavigationStack {
            VStack {
                currentYearMonthView
                LazyVGrid(columns: gridItemLayout) {
                    weekView
                    firstDaySpacerOfWeekForMonthView
                    daysOfMonthonView
                }
            }
            .navigationTitle("日历")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
    
    /// 当前年月
    private var currentYearMonthView: some View {
        Text("\(self.dateFormatter.string(from: viewModel.currentDate))")
            .font(.largeTitle)
            .foregroundColor(.black)
            .padding(.top, 16)
    }
    /// 工作周
    private var weekView: some View {
        ForEach(daysInWeek, id: \.self) { day in
            Text(day)
                .font(.headline)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
        }
    }
    
    /// 当前日历月份中第一天真实位置的填充视图
    private var firstDaySpacerOfWeekForMonthView: some View {
        ForEach(0 ..< viewModel.firstDayOfWeekSpacerCountForMonth(), id: \.self) { date in
            Text("")
                .frame(maxWidth: .infinity, minHeight: 48)
        }
    }
    /// 日历时间
    private var daysOfMonthonView: some View {
        ForEach(viewModel.daysInCurrentMonth(), id: \.self) { date in
            Text("\(date.day)")
                .font(.system(size: 20))
                .foregroundColor(viewModel.textColor(ForDay: date))
                .frame(maxWidth: .infinity, minHeight: 48)
                .background(viewModel.backgroundColor(ForDay: date))
                .cornerRadius(8)
                .onTapGesture {
                    viewModel.selectedDate = date
                }
        }
    }
}

#Preview {
    CalendarView()
}
