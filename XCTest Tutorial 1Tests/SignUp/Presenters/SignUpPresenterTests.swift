//
//  SignUpPresenterTests.swift
//  XCTest Tutorial 1Tests
//
//  Created by roland on 2025/05/11.
//

import XCTest

@testable import XCTest_Tutorial_1

final class SignUpPresenterTests: XCTestCase {
    
    var signUpFormModel: SignUpFormModel!
    var mockSignUpModelValidator: MockSignUpModelValidator!
    var mockSignUpWebservice: MockSignUpWebService!
    var mockSignUpViewDelegate:MockSignUpViewDelegate!
    var sut: SignUpPresenter!

    override func setUpWithError() throws {
        signUpFormModel = SignUpFormModel(firstName: "John", lastName: "Smith", email: "test@test.com", password: "123456", repeatPassword: "123456")
        mockSignUpModelValidator = MockSignUpModelValidator()
        mockSignUpWebservice = MockSignUpWebService()
        mockSignUpViewDelegate = MockSignUpViewDelegate()
        
        sut = SignUpPresenter(formModelValidator: mockSignUpModelValidator, webservice: mockSignUpWebservice, mockSignUpViewDelegate: mockSignUpViewDelegate)

    }

    override func tearDownWithError() throws {
        
        signUpFormModel = nil
        mockSignUpModelValidator = nil
        mockSignUpWebservice = nil
        sut = nil
       
    }

    func testSignUpPresenter_WhenInformationProvided_WillValidateEachProperty() {
        //act
        sut.processUserSignUp(formModel: signUpFormModel)
        //assert
        
        XCTAssertTrue(mockSignUpModelValidator.validateFirstNameCalled, "First Name was not valid")
        XCTAssertTrue(mockSignUpModelValidator.validateEmailCalled, "Email was not valid")
        XCTAssertTrue(mockSignUpModelValidator.validatePasswordCalled, "Password was not valid")
        XCTAssertTrue(mockSignUpModelValidator.validateDoPasswordsMatchCalled, "Passwords did not match")
        
    }
    
    func testSignUpPresenter_WhenGivenValidSignUpModel_ShouldCallSignupMethod(){
        //act
        
        sut.processUserSignUp(formModel: signUpFormModel)
        
        //assert
        
        XCTAssertTrue(mockSignUpWebservice.isSignUpMethodCalled, "The Sign Up method was called")
    }
    
    func testSignUpPresenter_WhenSignUpIsSuccessful_ShouldCallViewDelegate(){
        let myExpectation = expectation(description: "Sign Up Presenter Expectation")
 
        mockSignUpViewDelegate.expectation = myExpectation
        // act
        
        sut.processUserSignUp(formModel: signUpFormModel)
        //assert
        self.wait(for: [myExpectation], timeout: 5)
    }
    
    func testSignUpPresenter_WhenSignUpHasFailed_ShouldCallErrorHandler(){
        let errorHandlerExpectation = expectation(description: "expected the errorHandler() to be called")
 
        mockSignUpViewDelegate.expectation = errorHandlerExpectation
        mockSignUpWebservice.shouldReturnError = true
        sut.processUserSignUp(formModel: signUpFormModel)
        //assert
        self.wait(for: [errorHandlerExpectation], timeout: 5)
        
        XCTAssertNotNil(mockSignUpWebservice.shouldReturnError)
    }

}
