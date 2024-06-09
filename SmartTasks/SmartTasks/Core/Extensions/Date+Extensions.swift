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

}
