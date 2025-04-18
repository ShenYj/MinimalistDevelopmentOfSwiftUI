//
//  ViewModel.swift
//  TodayInHistory
//
//  Created by EZen on 2025/04/17.
//

import SwiftUI

class ViewModel: ObservableObject {
    
    @Published var historyDaily: [HistoryDaily] = []
    
    @Published var currentDate: Date = Date()
    @Published var selectedDate: Date = Date()
}


extension ViewModel {
    
    func fetchDatas() {
        guard let path = Bundle.main.path(forResource: "data.json", ofType: nil),
              let data = try? Data(contentsOf: URL(fileURLWithPath: path))
        else { return }
        let decoder = JSONDecoder()
        guard let todays = try? decoder.decode([HistoryDaily].self, from: data) else { return }
        
        historyDaily = todays
        
    }
}



extension ViewModel {
    
    func daysInCurrentMonth() -> [Date] {
        let calendar = Calendar.current
        let range = calendar.range(of: .day, in: .month, for: currentDate)
        let dayCount = range?.count ?? 30
        let month = calendar.date(from: calendar.dateComponents([.year, .month], from: currentDate))!
        
        return (0..<dayCount).map{(
            calendar.date(byAdding: .day, value: $0, to: month)!
        )}
    }
    
    func firstDayOfWeekSpacerCountForMonth() -> Int {
        let calendar = Calendar.current
        let firstDay = daysInCurrentMonth().first ?? Date()
        let spacerCount = calendar.component(.weekday, from: firstDay) - 1
        print("spacerCount:\(spacerCount)")
        return spacerCount
    }
}

extension ViewModel {
    
    func backgroundColor(ForDay day: Date) -> Color {
        if day.isSameDate(as: selectedDate) {
            return .green
        }
        
        if day.isSameDate(as: currentDate) {
            return .blue
        }
        return Color(.systemGray4)
    }
    
    func textColor(ForDay day: Date) -> Color {
        if day.isSameDate(as: selectedDate) {
            return .white
        }
        
        if day.isSameDate(as: currentDate) {
            return .white
        }
        return .black
    }
}
