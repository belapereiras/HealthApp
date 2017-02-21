//
//  DateManager.swift
//  DoNotSmokeApp
//
//  Created by Guilherme Marques on 7/20/16.
//  Copyright © 2016 Isabela Pereira. All rights reserved.
//

import Foundation

/*
 class to manage the time passed since the quit day.
 tp = time passed
 */
class DateManager {
    
    var tp_in_seconds: TimeInterval?
    var tp_in_minutes: TimeInterval {
        return tp_in_seconds?.minutes ?? 0
    }
    var tp_in_hours: TimeInterval {
        return tp_in_seconds?.hours ?? 0
    }
    var tp_in_days: TimeInterval {
        return tp_in_seconds?.days ?? 0
    }
    
    init() { }
    
    func stringfyed_timeSince(_ quit_day: TimeInterval) -> (String, String) {
        
        let tp_ReferenceDate = Date.timeIntervalSinceReferenceDate
        tp_in_seconds = tp_ReferenceDate - quit_day
        return (tp_in_seconds! < 60) ? tp_in_seconds!.stringfy_seconds :
               (tp_in_minutes < 60) ? tp_in_minutes.stringfy_minutes :
               (tp_in_hours < 24) ? tp_in_hours.stringfy_hours : tp_in_days.stringfy_days
    }
    
    func stringToDate(timeString: String) -> TimeInterval {
        let myDateString = timeString
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let myDate = dateFormatter.date(from: myDateString)!
        
        return myDate.timeIntervalSinceReferenceDate
    }
    
}

extension Double {
    
    private func formatType(form: String) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt_BR")
        dateFormatter.dateFormat = form
        return dateFormatter
    }
    
    var dateFull: Date {
        return Date(timeIntervalSinceReferenceDate: self)
    }
    var toHour: String {
        return formatType(form: "HH:mm").string(from: dateFull)
    }
    var toDay: String {
        return formatType(form: "dd MMM yyyy").string(from: dateFull)
    }
    
    var minutes: Double { return self / 60 }
    var hours: Double { return self.minutes / 60 }
    var days: Double { return self.hours / 24 }
    
    var stringfy_seconds: (String,String) { return ("\(Int(self))" , (self>1) ? "segundos" : "segundo") }
    var stringfy_minutes: (String, String) { return ("\(Int(self))" , (Int(self)>1) ? "minutos" : "minuto") }
    var stringfy_hours: (String, String) { return ("\(Int(self))" , (Int(self)>1) ? "horas" : "hora") }
    var stringfy_days: (String, String) { return ("\(Int(self))" , (Int(self)>1) ? "dias" : "dia") }
}
