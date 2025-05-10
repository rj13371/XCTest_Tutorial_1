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
        let result = sut.isFirstNameValid(firstName: "John")
        //assert
        
        XCTAssertTrue(result, "First Name is Not Valid")
    }
    
    func testSignUpFormModelValidator_WhenFirstNameIsOverFifteenCharacters_ShouldReturnFalse() {
        
        //arrange
        //act
        let result = sut.isFirstNameValid(firstName: "TestFirstNameThatIsWayTooLong!!!")
        //assert
        
        XCTAssertFalse(result, "First Name is too long.")
    }
    
    func testSignUpFormModelValidator_WhenFirstNameIsUnderOneCharacter_ShouldReturnFalse() {
        
        //arrange
        //act
        let result = sut.isFirstNameValid(firstName: "h")
        //assert
        
        XCTAssertFalse(result, "First Name is too short \(SignUpConstants.firstNameMinimumLength)")
    }
    
    func testSignUpFormModelValidator_WhenPasswordContainsSpecialCharacters_ShouldReturnTrue() {
        
        //arrange
        //act
        let result = sut.isPasswordValid(password: "helloworld#")
        //assert
        
        XCTAssertTrue(result, "Password contains special characters")
    }
    
    func testSignUpFormModelValidator_WhenEmailContainsATSymbol_ShouldReturnTrue() {
        
        //arrange
        //act
        let result = sut.isEmailValid(email: "john@gmail.com")
        //assert
        
        XCTAssertTrue(result, "Email contains @ symbol")
    }

}
