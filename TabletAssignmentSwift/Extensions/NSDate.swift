//
//  NSDate.swift
//  TabletAssignmentSwift
//
//  Created by David Vallas on 4/9/16.


import Foundation

extension Date {
    
    /// returns a double value for the NSDate
    var double: Double {
        
        let double: Double = Double(self.timeIntervalSince1970) * 1000.0
        return double
    }
    
    /// returns days since date, treats a day as a 24 hour period.  Always returns a positive number.
    func days(sinceDate sd: Date) -> Int {
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components([.day], from: sd, to: self, options: [])
        let days = components.day
        return abs(days!)
    }
    
}
