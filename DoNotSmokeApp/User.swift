//
//  User.swift
//  DoNotSmokeApp
//
//  Created by Guilherme Marques on 7/19/16.
//  Copyright © 2016 Isabela Pereira. All rights reserved.
//

import Foundation

class User {
    
    var name: String = ""
    var cigarettesPerDay: Double = 0
    var cigarettesPerPack: Double = 0
    var packPrice: Double = 0
    var healthAchievements: HealthAchievement
    var moneyAchievements: MoneyAchievement
    var dateManager: DateManager
    var quitDay: TimeInterval = 0
    static var user = User()
    
    fileprivate init?() {
        dateManager = DateManager()
        healthAchievements = HealthAchievement.getHASingleton()
        moneyAchievements = MoneyAchievement.getMASingleton()
        set_user_properties()
    }
    
    func set_user_properties() {
        guard let data = Plist(name: "UserPropertyList") else { return }
        guard let userInfo: NSDictionary = data.getValuesInPlistFile() else { return }
        let quitDayTimeInterval = Double(userInfo["QuitDay"] as! NSNumber)
        quitDay = quitDayTimeInterval
        name = userInfo["Name"] as! String
        cigarettesPerDay = Double(userInfo["CigarettesSmokedPerDay"] as! NSNumber)
        cigarettesPerPack = Double(userInfo["CigarettesPerPack"] as! NSNumber)
        packPrice = Double(userInfo["PackPrice"] as! NSNumber)
    }
    
    func set_notifications() {
        self.healthAchievements.benefits.forEach{
            Notifications.schedule($0.title, $0.description, $0.completion_parameter)
        }
        
        self.moneyAchievements.benefits.forEach{
            let time_interval = self.moneyAchievements.convert_money_for_time(cost: $0.completion_parameter)
            Notifications.schedule("Novo Sticker!", $0.title, time_interval)
        }
    }
    
    static func getUserSingleton() -> User {
        guard let u = user else { fatalError("Error getting user") }
        return u
    }
    
}

// MARK: - Computed Properties Extension
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

//# TODO: - Connections
/*
struct Connection {
    var name: String
    var email: String
}

extension User {
    
    func addConnection(_ name: String, email: String) {
        let connection = Connection(name: name, email: email)
        connections.append(connection)
    }
    
}
*/
