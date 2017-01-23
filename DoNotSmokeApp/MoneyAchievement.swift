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
    
    fileprivate init() {
        initialSetup()
    }
    
    fileprivate func initialSetup() {
        let names = ["barra de Chocolate", "hamburguer", "livro", "pizza", "cinema", "corte de cabelo", "vinho","tenis" , "tanque de gasolina", "spotify", "jantar", "camisa do time", "camisa social", "netflix", "perfume"]
        let costs: [Double] = [8.5, 25.5,42.5, 59.5, 76.5, 93.5, 110.5, 127.5, 144.5, 161.5, 178.5, 195.5, 212.5, 229.5, 255.0, 297.5]
        //let description: [String]
        
        for name in names {
            guard let index = names.index(of: name) else {return}
            let cost = costs[index]
            let benefit = MoneyBenefit(name: name, description: "", savingCompletion: cost)
            savingsBenefits.append(benefit)
        }
    
    }
    
    static func getMASingleton() -> MoneyAchievement {
        return moneyAchievement
    }
    
}
