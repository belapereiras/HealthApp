//
//  HealthAchievementTests.swift
//  DoNotSmokeApp
//
//  Created by Guilherme Marques on 14/02/17.
//  Copyright © 2017 Isabela Pereira. All rights reserved.
//

import XCTest
@testable import DoNotSmokeApp

class HealthAchievementTests: XCTestCase {
    
    var achievements: HealthAchievement!
    var dic_elem: (Double, (String, String))!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        achievements = HealthAchievement.getHASingleton()
        dic_elem = (43201, ("Titulo", "Descricao"))
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        achievements = nil
        dic_elem = nil
    }
    
    func test_add_benefit_from_dic_elem() {
        let count_before_adding = achievements.benefits.count
        achievements.add_benefit_from_dic_elem(key: dic_elem.0, value: dic_elem.1)
        XCTAssert(achievements.benefits.count == count_before_adding+1)
    }
    
    func test_if_benefits_are_sorted_per_completion_parameter() {
        let benefits = achievements.benefits
        for (index, value) in benefits.enumerated() {
            if index > 0 {
                XCTAssert(benefits[index-1] < value)
            }
        }
    }

}
