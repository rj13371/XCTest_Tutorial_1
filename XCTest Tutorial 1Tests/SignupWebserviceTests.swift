//
//  SignupWebserviceTests.swift
//  XCTest Tutorial 1Tests
//
//  Created by roland on 2025/05/10.
//

import XCTest

@testable import XCTest_Tutorial_1

final class SignupWebserviceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignUpWebService_WhenCalled_ReturnSuccess() {
        //arrange
        let sut = SignUpWebService()
        
        let signupFormRequestModel = SignUpFormRequestModel(firstName: "John", lastName: "Smith", email: "test@test.com", password: "123456")
        
        // act
        sut.signup(withForm: signupFormRequestModel) {signupFormRequestModel, error} in
        //assert
    }

}
