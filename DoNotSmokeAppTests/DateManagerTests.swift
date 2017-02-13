//
//  DateManagerTests.swift
//  DoNotSmokeApp
//
//  Created by Guilherme Marques on 09/02/17.
//  Copyright © 2017 Isabela Pereira. All rights reserved.
//

import XCTest
@testable import DoNotSmokeApp

class DateManagerTests: XCTestCase {
    
    var date_manager: DateManager!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        date_manager = DateManager()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        date_manager = nil
    }
    
    //MARK: Testing the time conversion
    
    func test_seconds_to_minutes_conversion() {
        date_manager.tp_in_seconds = 60
        XCTAssert(date_manager.tp_in_minutes == 1)
    }
    
    func test_seconds_to_hours_conversion() {
        date_manager.tp_in_seconds = 3600
        XCTAssert(date_manager.tp_in_hours == 1)
    }
 
    func test_seconds_to_days_conversion() {
        date_manager.tp_in_seconds = 86400
        XCTAssert(date_manager.tp_in_days == 1)
    }
    
    //MARK: Testing the strinfying of seconds
    
    func test_stringfying_second() {
        let second = 1.0
        let stringfied_second = second.stringfy_seconds
        XCTAssert(stringfied_second.0 == "\(Int(second))" &&
                        stringfied_second.1 == "segundo")
    }
    
    func test_stringfying_seconds() {
        let seconds = 2.0
        let stringfied_seconds = seconds.stringfy_seconds
        XCTAssert(stringfied_seconds.0 == "\(Int(seconds))" &&
                    stringfied_seconds.1 == "segundos")
    }
    
    func test_stringfying_minute() {
        let minute = 1.0
        let stringfied_minute = minute.stringfy_minutes
        XCTAssert(stringfied_minute.0 == "\(Int(minute))" &&
                    stringfied_minute.1 == "minuto")
    }
    
    func test_stringfying_minutes() {
        let minutes = 2.0
        let stringfied_minutes = minutes.stringfy_minutes
        XCTAssert(stringfied_minutes.0 == "\(Int(minutes))" &&
                        stringfied_minutes.1 == "minutos")
    }
    
    func test_stringfying_hour() {
        let hour = 1.0
        let stringfied_hour = hour.stringfy_hours
        XCTAssert(stringfied_hour.0 == "\(Int(hour))" &&
                        stringfied_hour.1 == "hora")
    }
    
    func test_stringfying_hours() {
        let hours = 2.0
        let stringfied_hours = hours.stringfy_hours
        XCTAssert(stringfied_hours.1 == "horas")
    }
    
    //MARK: Testing the case when the time passed is less or equal to 1
    
    func test_strinfyed_timeSince_one_day_passed() {
        let quitDay = Date.timeIntervalSinceReferenceDate - 86400
        let stringfied_time = date_manager.stringfyed_timeSince(quitDay)
        XCTAssert(stringfied_time.0 == "1" && stringfied_time.1 == "dia")
    }
    
    func test_stringfyed_timeSince_one_hour_passed() {
        let quitDay = Date.timeIntervalSinceReferenceDate - 3600
        let stringfied_time = date_manager.stringfyed_timeSince(quitDay)
        XCTAssert(stringfied_time.0 == "1" && stringfied_time.1 == "hora")
    }

    func test_stringfyed_timeSince_one_minute_passed() {
        let quitDay = Date.timeIntervalSinceReferenceDate - 60
        let stringfied_time = date_manager.stringfyed_timeSince(quitDay)
        XCTAssert(stringfied_time.0 == "1" && stringfied_time.1 == "minuto")
    }
    
    func test_stringfyed_timeSince_one_second_passed() {
        let quitDay = Date.timeIntervalSinceReferenceDate - 59
        let stringfied_time = date_manager.stringfyed_timeSince(quitDay)
        XCTAssert(stringfied_time.0 == "1" && stringfied_time.1 == "segundo")
    }

    //MARK: Testing the case when the time passed is greater than 1
    
    func test_strinfyed_timeSince_days_passed() {
        let quitDay = Date.timeIntervalSinceReferenceDate - 86400
        let stringfied_time = date_manager.stringfyed_timeSince(quitDay)
        XCTAssert(stringfied_time.0 == "1" && stringfied_time.1 == "dia")
    }
    
    func test_stringfyed_timeSince_hours_passed() {
        let quitDay = Date.timeIntervalSinceReferenceDate - 3600
        let stringfied_time = date_manager.stringfyed_timeSince(quitDay)
        XCTAssert(stringfied_time.0 == "1" && stringfied_time.1 == "hora")
    }
    
    func test_stringfyed_timeSince_minutes_passed() {
        let quitDay = Date.timeIntervalSinceReferenceDate - 60
        let stringfied_time = date_manager.stringfyed_timeSince(quitDay)
        XCTAssert(stringfied_time.0 == "1" && stringfied_time.1 == "minuto")
    }
    
    func test_stringfyed_timeSince_seconds_passed() {
        let quitDay = Date.timeIntervalSinceReferenceDate - 1
        let stringfied_time = date_manager.stringfyed_timeSince(quitDay)
        XCTAssert(stringfied_time.0 == "1" && stringfied_time.1 == "segundo")
    }
}
