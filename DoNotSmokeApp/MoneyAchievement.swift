//
//  MoneyAchievement.swift
//  DoNotSmokeApp
//
//  Created by Guilherme Marques on 7/20/16.
//  Copyright © 2016 Isabela Pereira. All rights reserved.
//

import Foundation

class MoneyAchievement {
    
    var savingsBenefits: [MoneyBenefit] = []
    static var moneyAchievement = MoneyAchievement()
    
    private init() {}
    
    private func initialSetup() {
    
    }
    
    
    
    static func getMASingleton() -> MoneyAchievement {
        return moneyAchievement
    }
    
}