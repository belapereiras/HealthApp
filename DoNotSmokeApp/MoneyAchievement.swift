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
    var time_for_benefits: [Double] = []
    
    fileprivate init() {
        initial_setup()
    }
    
    internal func initial_setup() {
        let achievement_info = [8.5: "Barra de Chocolate", 25.5: "Fast-food", 42.5:"Livro", 59.5:"Pizza", 76.5:"Cinema", 93.5:"Corte de cabelo", 110.5:"Vinho", 127.5:"Tênis" , 144.5:"Tanque de gasolina", 161.5:"Spotify", 178.5:"Jantar", 195.5:"Camisa do time", /*212.5:"camisa social" ,*/ 229.5:"Netflix", 255.0:"Perfume"]
        
        achievement_info.forEach{
            add_benefit_from_dic_elem(key: $0.key, value: ($0.value, ""))
        }
    }
    
    static func getMASingleton() -> MoneyAchievement {
        return moneyAchievement
    }
    
    func convert_money_for_time(cost: Double) -> TimeInterval {
        /*
         R$ / s
         cigarettes_per_second = (( cigarettesPerDay / 24 ) / 60 ) / 60)
         unity_cigarette_price = packPrice / cigarettes_per_pack
         gain_per_second = cigarettes_per_second*unity_cigarette_price
         time = cost/gain_per_second
         */
        let pack_price = User.getUserSingleton().packPrice
        let cigarettes_per_pack = User.getUserSingleton().cigarettesPerPack
        let cigarettes_per_second = User.getUserSingleton().cigarettesPerDay.day_to_second
        let unity_cigarette_price = pack_price/cigarettes_per_pack
        let gain_per_second = cigarettes_per_second*unity_cigarette_price
        let time = cost/gain_per_second
        
        return time
    }
    
}
