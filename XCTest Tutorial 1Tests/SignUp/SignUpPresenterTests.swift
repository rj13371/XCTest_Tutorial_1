//
//  SignUpPresenterTests.swift
//  XCTest Tutorial 1Tests
//
//  Created by roland on 2025/05/11.
//

import XCTest

@testable import XCTest_Tutorial_1

final class SignUpPresenterTests: XCTestCase {

    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {
       
    }

    func testSignUpPresenter_WhenInformationProvided_WillValidateEachProperty() {
        //arrange
        let signUpFormModel = SignUpFormModel(firstName: "John", lastName: "Smith", email: "test@test.com", password: "123456", repeatPassword: "123456")
        let sut = SignUpPresenter()
        let mockSignUpModelValidator = MockSignUpModelValidator()
        //act
        sut.processUserSignUp(formModel: signUpFormModel)
        //assert
        
        XCTAssertTrue(mockSignUpModelValidator.validateFirstNameCalled)
        
    }

}
