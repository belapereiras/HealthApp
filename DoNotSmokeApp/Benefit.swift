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
    var completion_parameter: Double
    
    init(title: String, description: String, completion_parameter: Double) {
        self.title = title
        self.description = description
        self.completion_parameter = completion_parameter
    }
    
    func is_achieved(_ accumulated: Double) -> Bool {
        return completion_parameter <= accumulated
    }
}
