//
//  Date+Extensions.swift
//  TodayInHistory
//
//  Created by EZen on 2025/04/18.
//

import Foundation


extension Date {
    
    var day: String {
        let calendar = Calendar.current
        return "\(calendar.component(.day, from: self))"
    }
    
    func isSameDate(as date: Date) -> Bool {
        Calendar.current.isDate(self, inSameDayAs: date)
    }
}
