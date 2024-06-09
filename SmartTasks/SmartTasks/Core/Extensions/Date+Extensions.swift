//
//  Date+Extensions.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 10/06/2024.
//

import Foundation

extension Date {

    func daysLeft() -> String {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: Date(), to: self)
        if let days = components.day, days >= 0 {
            return String(describing: days)
        } else {
            return String(describing: 0)
        }
    }

    func appDateFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd yyyy"
        return dateFormatter.string(from: self)
    }

    func getFormattedDateString() -> String {
        let currentDate = Date() 
        let calendar = Calendar.current
        // Check if the given date is today
        if calendar.isDate(self, inSameDayAs: currentDate) {
            return "Today"
        }
        // Check if the given date is yesterday
        if let yesterday = calendar.date(byAdding: .day, value: -1, to: currentDate), calendar.isDate(self, inSameDayAs: yesterday) {
            return "Yesterday"
        }
        // Check if the given date is tomorrow
        if let tomorrow = calendar.date(byAdding: .day, value: 1, to: currentDate), calendar.isDate(self, inSameDayAs: tomorrow) {
            return"Tomorrow"
        }

        return self.appDateFormat()
    }

}
