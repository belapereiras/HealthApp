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
        guard let u = user else { fatalError("Error getting the user") }
        return u
    }
    
    func addConnection(_ name: String, email: String) {
        let connection = Connection(name: name, email: email)
        connections.append(connection)
    }
    
}

extension User {
    var cigarettes_not_smoked: Double { return cigarettesPerDay * dateManager.tp_in_days }
    var nOf_packs_smoked_perDay: Double { return cigarettesPerDay / cigarettesPerPack }
    var savings: Double { return nOf_packs_smoked_perDay*packPrice*dateManager.tp_in_days }
    var nbr_of_benefits: Int {
        let savings = User.getUserSingleton().savings
        if let benefits = User.getUserSingleton().moneyAchievements.benefits_achieved(savings) {
            return benefits.count
        }
        return 0
    }
}
