//
//  SignupWebserviceTests.swift
//  XCTest Tutorial 1Tests
//
//  Created by roland on 2025/05/10.
//

import XCTest

@testable import XCTest_Tutorial_1

final class SignupWebserviceTests: XCTestCase {
    
    var sut: SignUpWebService!
    var signupFormRequestModel: SignUpFormRequestModel!

    override func setUpWithError() throws {
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        sut = SignUpWebService(urlString: "https://tlyqhtlbn8.execute-api.us-east-1.amazonaws.com/prod/signup-mock-service/users", urlSession: urlSession)
        
        signupFormRequestModel = SignUpFormRequestModel(firstName: "John", lastName: "Smith", email: "test@test.com", password: "123456")
        
        
    }

    override func tearDownWithError() throws {
        sut = nil
        signupFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
    }

    func testSignUpWebService_WhenCalled_ReturnSuccess() {
        //arrange


        let jsonString = "{\n    \"status\": \"ok\"\n}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        

        
        let expectation = self.expectation(description: "Sign Up Web Service Expectation")
        
        // act
        sut.signUp(withForm: signupFormRequestModel) {(signUpFormResponseModel, error) in
        
            XCTAssertEqual(signUpFormResponseModel?.status, "ok")
            expectation.fulfill()
        }
        //assert
        self.wait(for: [expectation], timeout: 5)
        
    }
    
    func testSignUpWebService_WhenRecieveDifferentJSONResponse_ErrorTookPlace(){
        //arrange
        let jsonString = "{\"path\":\"/users\", \"error\":\"Internal Service Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
    
        
        let expectation = self.expectation(description: "SignUp() method expectation that for a response that contains a different JSON structure")
        
        // act
        sut.signUp(withForm: signupFormRequestModel) {(signUpFormResponseModel, error) in
            XCTAssertNil(signUpFormResponseModel, "The response for the model should return nil")
            XCTAssertEqual(error, SignUpError.responseModelParsing, "Sign Up Method did not return expected response")
            expectation.fulfill()
        }
        //assert
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignUpWebService_WhenRecieveInvalidURL_ErrorTookPlace(){
        //arrange
        sut = SignUpWebService(urlString: "")
    
        let expectation = self.expectation(description: "SignUp() method expectation returns an error if URL is invalid")
        
        // act
        sut.signUp(withForm: signupFormRequestModel) {(signUpFormResponseModel, error) in
            XCTAssertEqual(error, SignUpError.invalidRequestURLString, "Sign Up Method used an invalid url")
            expectation.fulfill()
        }
        //assert
        self.wait(for: [expectation], timeout: 2)
    }

}
