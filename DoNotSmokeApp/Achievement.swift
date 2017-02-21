//
//  Achievement.swift
//  DoNotSmokeApp
//
//  Created by Guilherme Marques on 26/01/17.
//  Copyright © 2017 Isabela Pereira. All rights reserved.
//

import Foundation

protocol Achievement: class {
    var benefits: [Benefit] { get set }
    func initial_setup()
}

extension Achievement {
    
    func create_benefit(_ title: String, _ description: String, _ interval: TimeInterval) -> Benefit {
        let benefit = Benefit(title: title, description: description, completion_parameter: interval)
        return benefit
    }
    
    func benefits_achieved(_ accumulated: Double) -> [Benefit]? {
        return benefits.filter{ $0.is_achieved(accumulated) }
    }
    
    func add_benefit_from_dic_elem(key: TimeInterval, value: (String, String)) {
        let title = value.0
        let description = value.1
        let completion_time = key
        
        let benefit = create_benefit(title, description, completion_time)
        benefits.append(benefit)
        benefits.sort()
    }
    
}







