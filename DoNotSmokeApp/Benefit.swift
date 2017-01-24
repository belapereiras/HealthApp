//
//  Benefit.swift
//  DoNotSmokeApp
//
//  Created by Guilherme Marques on 7/20/16.
//  Copyright © 2016 Isabela Pereira. All rights reserved.
//

import Foundation

class Benefit {
    
    var title : String
    var description: String
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
    
}

class HealthBenefit: Benefit {
    
    var completionTime: TimeInterval!
    
    init(title: String, description: String, completion_time: Double) {
        self.completionTime = completion_time
        super.init(title: title, description: description)
    }
}

class MoneyBenefit: Benefit {

    var savingCompletion: Double?
    
    init(name: String, description: String, savingCompletion: Double) {
        self.savingCompletion = savingCompletion
        super.init(title: name, description: description)
    }
    
}
