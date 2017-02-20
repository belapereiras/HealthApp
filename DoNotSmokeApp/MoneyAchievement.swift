//
//  MoneyAchievement.swift
//  DoNotSmokeApp
//
//  Created by Guilherme Marques on 7/20/16.
//  Copyright © 2016 Isabela Pereira. All rights reserved.
//

import Foundation

//TODO: Create descriptions for the money achievements
class MoneyAchievement: Achievement {
    
    static var moneyAchievement = MoneyAchievement()
    var benefits: [Benefit] = []
    
    fileprivate init() {
        initial_setup()
    }
    
    internal func initial_setup() {
        let achievement_info = [8.5: "barra de Chocolate", 25.5: "hamburguer", 42.5:"livro", 59.5:"pizza", 76.5:"cinema", 93.5:"corte de cabelo", 110.5:"vinho", 127.5:"tenis" , 144.5:"tanque de gasolina", 161.5:"spotify", 178.5:"jantar", 195.5:"camisa do time", /*212.5:"camisa social" ,*/ 229.5:"netflix", 255.0:"perfume"]
        
        achievement_info.forEach{add_benefit_from_dic_elem(key: $0.key, value: ($0.value, ""))}
    }
    
    static func getMASingleton() -> MoneyAchievement {
        return moneyAchievement
    }
    
}
