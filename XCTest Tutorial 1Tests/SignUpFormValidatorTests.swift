//
//  SignUpFormValidator.swift
//  XCTest Tutorial 1Tests
//
//  Created by roland on 2025/05/07.
//

import XCTest

@testable import XCTest_Tutorial_1

final class SignUpFormValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

 
    func testSignUpFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        
        //arrange
        let sut = SignUpFormValidator()
        //act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "John")
        //assert
        
        XCTAssertTrue(isFirstNameValid, "First Name is Not Valid")
    }

}
