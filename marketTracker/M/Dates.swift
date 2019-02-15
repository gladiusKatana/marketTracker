//  Dates.swift
//  CandleTap
//  Created by Garth Snyder on 2018-11-18.  //  Copyright © 2018 Garth Snyder. All rights reserved.
import Foundation

extension NSObject {
    func displayDate(dateCreated: Date) -> (tm: String, weekday: String, dy: String)
    {
        let dateFormatter = DateFormatter();  dateFormatter.dateFormat = "MMM. dd"
        let timeFormatter = DateFormatter();  timeFormatter.dateFormat = "h:mm:ssa"
        timeFormatter.amSymbol = "am";        timeFormatter.pmSymbol = "pm"
        
        let weekday = dateCreated.dayOfWeek()!
        let dy = dateFormatter.string(from: dateCreated as Date)
        let tm = timeFormatter.string(from: dateCreated as Date)
        
        return (tm, weekday, dy)
    }
    
    func createDate(halfHoursForward: Double) -> Date {
        let dateCreated = Date() + TimeInterval(1800 * halfHoursForward)
        return dateCreated
    }
}

extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        return dateFormatter.string(from: self).capitalized
    }
    
    func toSeconds() -> Int64! {
        return Int64(self.timeIntervalSince1970)
    }
}
