//
//  HealthAchievement.swift
//  DoNotSmokeApp
//
//  Created by Guilherme Marques on 7/19/16.
//  Copyright © 2016 Isabela Pereira. All rights reserved.
//

import Foundation

// Health Enum:
// BenefitNumber
// Raw Value = Time in seconds to the benefit be completed

enum HealthEnum: Double {
    
    case firstBenefit = 1200
    case secondBenefit = 28800
    case thirdBenefit = 43200
    case fourthBenefit = 26400
    case fifthBenefit = 172800
    case sixthBenefit = 259200
    case seventhBenefit = 0
    case eighthBenefit = 1
    case ninethBenefit = 2
    case tenthBenefit = 3
    case eleventhBenefit = 4
    case twelvethBenefit = 5
    case thirteenthBenefit = 6
    
}

// Health Benefit
// Struct with the benefits info

struct HealthBenefit {
    
    var name, description: String
    var benefitNumber: HealthEnum {
        didSet {
            completionTime = benefitNumber.rawValue
        }
    }
    var completionTime: Double?
    
    init(name: String, description: String, benefitNumber: HealthEnum) {
        self.name = name
        self.description = description
        self.benefitNumber = benefitNumber
    }
}

// HealthAchievement
// class to manage the benefits
class HealthAchievement {
    
    var healthBenefit: [HealthBenefit] = []
    static var healthAchievement = HealthAchievement()
    var startingDay: NSDate {
        get {
            return self.startingDay
        }
        set(date) {
            self.startingDay = date
        }
        
    }
    
    private init(){
        initialSetupHB()
    }
    
    func createHealhBenefit(name: String, description: String, benefitNumber: HealthEnum) -> HealthBenefit {
        let healthBenefit = HealthBenefit(name: name, description: description, benefitNumber: benefitNumber)
        return healthBenefit
    }
    
    private func initialSetupHB() {
        createHealhBenefit("Benefício 1", description: " ", benefitNumber: .firstBenefit)
        createHealhBenefit("Benefício 2", description: " ", benefitNumber: .secondBenefit)
        createHealhBenefit("Benefício 3", description: " ", benefitNumber: .thirdBenefit)
        createHealhBenefit("Benefício 4", description: " ", benefitNumber: .fourthBenefit)
    }
    
    static func getHASingleton() -> HealthAchievement {
        return healthAchievement
    }
    
    
}