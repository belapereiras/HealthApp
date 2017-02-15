//
//  BenefitTests.swift
//  DoNotSmokeApp
//
//  Created by Guilherme Marques on 14/02/17.
//  Copyright © 2017 Isabela Pereira. All rights reserved.
//

import XCTest
@testable import DoNotSmokeApp

class BenefitTests: XCTestCase {
    
    var benefit: Benefit!
    var benefit2: Benefit!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        benefit = Benefit(title: "Titulo", description: "Descricao", completion_parameter: 1)
        benefit2 = Benefit(title: "Titulo2", description: "Descricao2", completion_parameter: 1)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        benefit = nil
        benefit2 = nil
    }
    
    func test_init() {
        XCTAssert(benefit.title == "Titulo")
        XCTAssert(benefit.description == "Descricao")
        XCTAssert(benefit.completion_parameter == 1)
    }
    
    func test_is_achieved_false() {
        XCTAssert(!(benefit.is_achieved(0.9)))
    }
    
    func test_is_achieved_true_equal() {
        XCTAssert(benefit.is_achieved(1))
    }
    
    func test_is_achieved_true_greater() {
        XCTAssert(benefit.is_achieved(1.1))
    }
    
    func test_benefit_equal_comparable() {
        XCTAssert(benefit2 == benefit)
        benefit2.completion_parameter = 0.9
        XCTAssert(!(benefit2 == benefit))
    }
    
    func test_benefit_less_comparable() {
        benefit2.completion_parameter = 0.9
        XCTAssert(benefit2 < benefit)
        XCTAssert(!(benefit < benefit2))
    }
    
}
