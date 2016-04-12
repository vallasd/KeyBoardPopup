//
//  Double.swift
//  TabletAssignmentSwift
//
//  Created by David Vallas on 4/9/16.


import Foundation


extension Double {
    
    /// returns the time of a double value as "Today", "xx days" (for values in the past or future)
    var commentTime: String {
    
        let now = NSDate()
        let interval: NSTimeInterval = self / 1000
        let date = NSDate(timeIntervalSince1970: interval)
    
        let count = now.days(sinceDate: date)
        
        switch count {
        case  0: return "today"
        case  1: return "1 day"
        default: return "\(count) days"
        }
    }
    
}