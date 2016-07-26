//
//  Benefit.swift
//  DoNotSmokeApp
//
//  Created by Guilherme Marques on 7/20/16.
//  Copyright © 2016 Isabela Pereira. All rights reserved.
//

import Foundation

class Benefit {
    
    var name : String
    var description: String
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
    }
    
}

class HealthBenefit: Benefit {
    
    var completionTime: NSTimeInterval!
    var healthNumber: HealthEnum
    
    init(name: String, description: String, healthNumber: HealthEnum) {
        self.healthNumber = healthNumber
        self.completionTime = healthNumber.rawValue
        super.init(name: name, description: description)
    }
}

class MoneyBenefit: Benefit {

    var savingCompletion: Double?
    
    init(name: String, description: String, savingCompletion: Double) {
        self.savingCompletion = savingCompletion
        super.init(name: name, description: description)
    }
    
}