//
//  DateManager.swift
//  DoNotSmokeApp
//
//  Created by Guilherme Marques on 7/20/16.
//  Copyright © 2016 Isabela Pereira. All rights reserved.
//

import Foundation


class DateManager {
    
    func timeSinceQuitDay(quitDay: NSDate) -> NSTimeInterval {
        let timePassedSinceQuitDay = quitDay.timeIntervalSinceNow
        return timePassedSinceQuitDay
    }
    
    func timeInHours(timeInSeconds: NSTimeInterval) -> Double {
        let timeInHours = timeInSeconds/60
        return timeInHours
    }
    
    func timeInDays(timeInSeconds: NSTimeInterval) -> Double {
        let timeInHour = timeInHours(timeInSeconds)
        let timeInDays = timeInHour*24
        return timeInDays
    }
    
}