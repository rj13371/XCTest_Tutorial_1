//
//  File.swift
//  XCTest Tutorial 1Tests
//
//  Created by roland on 2025/05/11.
//
import Foundation

@testable import XCTest_Tutorial_1

class MockSignUpModelValidator: SignUpModelValidatorProtocol {
    
    var validateFirstNameCalled: Bool = false
    var validatePasswordCalled: Bool = false
    var validateEmailCalled: Bool = false
    var validateDoPasswordsMatchCalled: Bool = false
    
    func isFirstNameValid(firstName: String) -> Bool {
        validateFirstNameCalled = true
        return validateFirstNameCalled
    }
    
    func isPasswordValid(password: String) -> Bool {
        validatePasswordCalled = true
        return validatePasswordCalled
    }
    
    func isEmailValid(email: String) -> Bool {
        validateEmailCalled = true
        return validateEmailCalled
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        validateDoPasswordsMatchCalled = true
        return validateDoPasswordsMatchCalled
    }
    

}
