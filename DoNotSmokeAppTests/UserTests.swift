//
//  UserTests.swift
//  DoNotSmokeApp
//
//  Created by Guilherme Marques on 16/02/17.
//  Copyright © 2017 Isabela Pereira. All rights reserved.
//

import XCTest
@testable import DoNotSmokeApp

class UserTests: XCTestCase {
    
    var user: User!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        user = User.getUserSingleton()
        user.cigarettesPerDay = 10
        user.cigarettesPerPack = 10
        user.packPrice = 10
        user.dateManager.tp_in_seconds = 86400
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        user = nil
    }
    
    
    func test_cigarettes_not_smoked() {
        XCTAssert(user.cigarettes_not_smoked == 10)
    }
    
    func test_number_of_cigarettes_smoked_perDay() {
        XCTAssert(1 == user.nOf_packs_smoked_perDay)
    }
    
    func test_savings() {
        XCTAssert(10 == user.savings)
    }
    
    func test_nbr_of_benefits() {
        XCTAssert(1 == user.nbr_of_benefits)
    }
}
