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
    
    var name: String
    var cigarettesPerDay, cigarettesPerPack: Double
    var packPrice: Double
    var connections: [Connection] = []
    var healthAchievements: HealthAchievement
    var moneyAchievements: MoneyAchievement
    var dateManager: DateManager
    var quitDay: TimeInterval
    static var user = User()
    
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

    fileprivate init?() {
        
        guard let data = Plist(name: "UserPropertyList") else { return nil }
        guard let userInfo: NSDictionary = data.getValuesInPlistFile() else { return nil }
        let quitDayTimeInterval = Double(userInfo["QuitDay"] as! NSNumber)
        dateManager = DateManager()
        self.quitDay = quitDayTimeInterval
        self.name = String(describing: userInfo["Name"])
        self.cigarettesPerDay = Double(userInfo["CigarettesSmokedPerDay"] as! NSNumber)
        self.cigarettesPerPack = Double(userInfo["CigarettesPerPack"] as! NSNumber)
        self.packPrice = Double(userInfo["PackPrice"] as! NSNumber)
        healthAchievements = HealthAchievement.getHASingleton()
        moneyAchievements = MoneyAchievement.getMASingleton()
    
    }
    
    static func getUserSingleton() -> User {
        return user!
    }
    
    func addConnection(_ name: String, email: String) {
        let connection = Connection(name: name, email: email)
        connections.append(connection)
    }
    
    func cigarettesNotSmoked() -> Double {
        
        let daysWithoutSmoking = dateManager.tp_in_days
        let cigarettesNotSmoked = Double(cigarettesPerDay) * daysWithoutSmoking
        return cigarettesNotSmoked
        
    }
    
    func moneySavings() -> Double {
        
        let daysWithoutSmoking = dateManager.tp_in_days
        let numberOfPacksSmokedPerDay = cigarettesPerDay / cigarettesPerPack
        let savings = numberOfPacksSmokedPerDay * daysWithoutSmoking * packPrice
        print("|||||| cigarettesPerDay: \(cigarettesPerDay)")
        print("|||||| daysWithoutSmoking: \(daysWithoutSmoking)")
        print("|||||| Savings: \(savings)")
        print("|||||| numberOfPacksSmokedPerDay: \(numberOfPacksSmokedPerDay)")
        return savings
    }
    
}
