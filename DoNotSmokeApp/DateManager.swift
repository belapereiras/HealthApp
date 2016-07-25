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
    
    func timeSinceQuitDayInHours(quitDay: NSDate) -> NSTimeInterval {
        let timePassedSinceQuitDay = quitDay.timeIntervalSinceNow.hours
        return timePassedSinceQuitDay
    }
    
    func timeSinceQuitDayInDays(quitDay: NSDate) -> NSTimeInterval {
        let timePassedSinceQuitDay = quitDay.timeIntervalSinceNow.days
        return timePassedSinceQuitDay
    }
    
    func timeSinceQuitDayInMonths(quitDay: NSDate) -> NSTimeInterval {
        let timePassedSinceQuitDay = quitDay.timeIntervalSinceNow.months
        return timePassedSinceQuitDay
    }
    
}

extension Double {
    
    var minutes: Double { return self / 60 }
    var hours: Double { return self.minutes / 60 }
    var days: Double { return self.hours / 24 }
    var months: Double { return self.days / 30 }
    
}