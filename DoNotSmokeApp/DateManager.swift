//
//  DateManager.swift
//  DoNotSmokeApp
//
//  Created by Guilherme Marques on 7/20/16.
//  Copyright © 2016 Isabela Pereira. All rights reserved.
//

import Foundation


class DateManager {
    
    init() { }
    
    // INPUT: the date the user started smoking (quitDay)
    // OUTPUT: Today - quitDay

    func timeSinceQuitDayInMinutes(quitDay: NSTimeInterval) -> NSTimeInterval {
        let today = NSDate().timeIntervalSinceReferenceDate.minutes
        print(today)
        let quitday = quitDay.minutes
        print(quitday)
        let timePassedSinceQuitDay = today - quitday
        return timePassedSinceQuitDay
    }
    
    func timeSinceQuitDayInHours(quitDay: NSTimeInterval) -> NSTimeInterval {
        let today = NSDate().timeIntervalSinceReferenceDate.hours
        let quitday = quitDay.hours
        let timePassedSinceQuitDay = today - quitday
        return timePassedSinceQuitDay
    }
    
    func timeSinceQuitDayInDays(quitDay: NSTimeInterval) -> NSTimeInterval {
        let today = NSDate().timeIntervalSinceReferenceDate.days
        let quitday = quitDay.days
        let timePassedSinceQuitDay = today - quitday
        return timePassedSinceQuitDay
    }
    
    func timeSinceQuitDayInMonths(quitDay: NSTimeInterval) -> NSTimeInterval {
        let today = NSDate().timeIntervalSinceReferenceDate.months
        let quitday = quitDay.months
        let timePassedSinceQuitDay = today - quitday
        return timePassedSinceQuitDay
    }
    
}

extension Double {
    
    var minutes: Double { return self / 60 }
    var hours: Double { return self.minutes / 60 }
    var days: Double { return self.hours / 24 }
    var months: Double { return self.days / 30 }
    
}