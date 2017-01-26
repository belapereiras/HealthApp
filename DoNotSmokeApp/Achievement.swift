//
//  Achievement.swift
//  DoNotSmokeApp
//
//  Created by Guilherme Marques on 26/01/17.
//  Copyright © 2017 Isabela Pereira. All rights reserved.
//

import Foundation

protocol Achievement {
    
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
}
