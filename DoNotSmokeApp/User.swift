//
//  User.swift
//  DoNotSmokeApp
//
//  Created by Guilherme Marques on 7/19/16.
//  Copyright © 2016 Isabela Pereira. All rights reserved.
//

import Foundation

struct Connection {
    var name: String
    var email: String
}

class User {
    
    static var user = User()
    private var quitDay: NSDate
    private var name: String
    var cigarettesPerDay, cigarettesPerPack: Int
    var packPrice: Double
    var connections: [Connection] = []
    var healthAchievements: HealthAchievement
    var dateManager: DateManager
    
//    init(quitDay: NSDate, name: String, cigarettesPerDay: Int, cigarettesPerPack: Int, packPrice: Double, connection1Name: String, connection2Name: String,connection1Email: String, connection2Email: String) {
//        
//        self.quitDay = quitDay
//        self.name = name
//        self.cigarettesPerDay = cigarettesPerDay
//        self.cigarettesPerPack = cigarettesPerPack
//        self.packPrice = packPrice
//        healthAchievements = HealthAchievement.getHASingleton()
//        self.dateManager = DateManager()
//        addConnection(connection1Name, email: connection1Email)
//        addConnection(connection2Name, email: connection2Email)
//        
//    }

    private init?() {
        
        guard let data = Plist(name: "UserPropertyList") else { return nil }
        guard let userInfo: NSDictionary = data.getValuesInPlistFile() else { return nil }
        let quitDayTimeInterval = Double(userInfo["QuitDay"] as! NSNumber)
        self.quitDay = NSDate(timeIntervalSinceReferenceDate: quitDayTimeInterval)
        self.name = String(userInfo["Name"])
        self.cigarettesPerDay = Int(userInfo["CigarettesSmokedPerDay"] as! NSNumber)
        self.cigarettesPerPack = Int(userInfo["CigarettesPerPack"] as! NSNumber)
        self.packPrice = Double(userInfo["PackPrice"] as! NSNumber)
        healthAchievements = HealthAchievement.getHASingleton()
        dateManager = DateManager()
    
    }
    
    func addConnection(name: String, email: String) {
        let connection = Connection(name: name, email: email)
        connections.append(connection)
    }
    
    func cigarettesNotSmoked() -> Double {
        
        let daysWithoutSmoking = dateManager.timeSinceQuitDayInDays(quitDay)
        let cigarettesNotSmoked = Double(cigarettesPerDay) * daysWithoutSmoking
        return cigarettesNotSmoked
        
    }
    
    func moneySavings() -> Double {
        
        let daysWithoutSmoking = dateManager.timeSinceQuitDayInDays(quitDay)
        let numberOfPacksSmokedPerDay = cigarettesPerDay / cigarettesPerPack
        let savings = Double(numberOfPacksSmokedPerDay) * daysWithoutSmoking
        
        return savings
    }
    
    static func getUserSingleton() -> User? {
        guard let user = self.user else { return nil }
        return user
    }
    
}
