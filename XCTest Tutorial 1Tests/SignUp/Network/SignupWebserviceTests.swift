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

        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        let jsonString = "{\n    \"status\": \"ok\"\n}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let sut = SignUpWebService(urlString: "https://tlyqhtlbn8.execute-api.us-east-1.amazonaws.com/prod/signup-mock-service/users", urlSession: urlSession)
        
        
        let signupFormRequestModel = SignUpFormRequestModel(firstName: "John", lastName: "Smith", email: "test@test.com", password: "123456")
        
        let expectation = self.expectation(description: "Sign Up Web Service Expectation")
        
        // act
        sut.signUp(withForm: signupFormRequestModel) {(signUpFormResponseModel, error) in
        
            XCTAssertEqual(signUpFormResponseModel?.status, "ok")
            expectation.fulfill()
        }
        //assert
        self.wait(for: [expectation], timeout: 5)
        
    }

}
