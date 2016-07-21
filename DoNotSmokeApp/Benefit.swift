//
//  Benefit.swift
//  DoNotSmokeApp
//
//  Created by Guilherme Marques on 7/20/16.
//  Copyright © 2016 Isabela Pereira. All rights reserved.
//

import Foundation

protocol Benefit {
    
    var name : String{ get set }
    var description: String{ get set }
    
}

class HealthBenefit: Benefit {
    
    var name, description: String
    var completionTime: NSTimeInterval?
    var healthNumber: HealthEnum {
        didSet {
            completionTime = healthNumber.rawValue
        }
    }
    
    init(name: String, description: String, healthNumber: HealthEnum) {
        self.name = name
        self.description = description
        self.healthNumber = healthNumber
        
    }
}

class MoneyBenefit: Benefit {

    var name, description: String
    var savingCompletion: Double?
    
    init(name: String, description: String) {
        self.name = name
        self.description = description        
    }
    
}