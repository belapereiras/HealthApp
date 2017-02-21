//
//  PlistTests.swift
//  DoNotSmokeApp
//
//  Created by Guilherme Marques on 20/02/17.
//  Copyright © 2017 Isabela Pereira. All rights reserved.
//

import XCTest
@testable import DoNotSmokeApp


//TODO: Teste de plist
class PlistTests: XCTestCase {
    
    var plist: Plist!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        plist = Plist(name: "TestPlist")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
}
