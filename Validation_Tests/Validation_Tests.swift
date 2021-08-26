//
//  Validation_Tests.swift
//  Validation_Tests
//
//  Created by Belal medhat on 9/6/20.
//  Copyright © 2020 Belal medhat. All rights reserved.
//

import XCTest
@testable import Validation

class Validation_Tests: XCTestCase {

    var validationHandler:ValidateFunctions!
    override func setUp() {
        super.setUp()
        validationHandler = Validation()
    }

    override func tearDown() {
        validationHandler = nil
        super.tearDown()
    }

    func test_ValidateName(){
         XCTAssertNoThrow(try validationHandler.validateName(name: "belal medhat"))
         XCTAssertThrowsError(try validationHandler.validateName(name: "be33lal medhat"))

//
    }
    func test_validateEmail(){
        XCTAssertNoThrow(try validationHandler.validateEmail(email: "belal.medhat34@gmail.com"))
    }
    func test_Password(){
        XCTAssertNoThrow(try validationHandler.validatePassword(password: "Dwadwadawd2133"))
    }
    func test_ConfirmPassword(){
        XCTAssertNoThrow(try validationHandler.validationConfirmPassword(Password: "123456789", ConfirmPassword: "123456789"))
    }
}
