//
//  SignUpFormValidator.swift
//  XCTest Tutorial 1Tests
//
//  Created by roland on 2025/05/07.
//

import XCTest

@testable import XCTest_Tutorial_1

final class SignUpFormValidatorTests: XCTestCase {
    
    var sut: SignUpFormValidator!

    override func setUpWithError() throws {
        sut = SignUpFormValidator()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

 
    func testSignUpFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        
        //arrange
        //act
        let result = sut.isFirstNameValid(firstName: "asd")
        //assert
        
        XCTAssertTrue(result, "First Name is Not Valid")
    }

}
