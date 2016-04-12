//
//  NSDate.swift
//  TabletAssignmentSwift
//
//  Created by David Vallas on 4/9/16.


import Foundation

extension NSDate {
    
    /// returns a double value for the NSDate
    var double: Double {
        
        let double: Double = Double(self.timeIntervalSince1970) * 1000.0
        return double
    }
    
    /// returns days since date, treats a day as a 24 hour period.  Always returns a positive number.
    func days(sinceDate sd: NSDate) -> Int {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day], fromDate: sd, toDate: self, options: [])
        let days = components.day
        return abs(days)
    }
    
}