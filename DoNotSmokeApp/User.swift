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
    var cigarettesPerDay, cigarettesPerPack: Int
    var packPrice: Float
    var connections: [Connection] = []
    var healthAchievements: HealthAchievement
    
    init(name: String, cigarettesPerDay: Int, cigarettesPerPack: Int, packPrice: Float, connection1Name: String, connection2Name: String,connection1Email: String, connection2Email: String) {
        
        self.name = name
        self.cigarettesPerDay = cigarettesPerDay
        self.cigarettesPerPack = cigarettesPerPack
        self.packPrice = packPrice
        healthAchievements = HealthAchievement.getHASingleton()
        createConnection(connection1Name, email: connection1Email)
        createConnection(connection2Name, email: connection2Email)
        
    }
    
    func createConnection(name: String, email: String) {
        let connection = Connection(name: name, email: email)
        connections.append(connection)
    }
}
