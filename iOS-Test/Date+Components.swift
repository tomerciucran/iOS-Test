//
//  Date+Components.swift
//  iOS-Test
//
//  Created by Tomer Ciucran on 11/21/16.
//  Copyright © 2016 tomercuicran. All rights reserved.
//

import Foundation

extension Date {
    func hoursFrom(date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour!
    }
    
    func minutesFrom(date: Date) -> Int{
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute!
    }
    
    func offsetFrom(date: Date) -> String {
        if minutesFrom(date: date) > 60 {
            return "\(hoursFrom(date: date))h\(minutesFrom(date: date) % 60)m"
        } else {
            return "\(minutesFrom(date: date))m"
        }
    }
}
