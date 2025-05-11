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
    
    func isFirstNameValid(firstName: String) -> Bool {
        validateFirstNameCalled = true
        return validateFirstNameCalled
    }
    
    func isPasswordValid(password: String) -> Bool {
        return true
    }
    
    func isEmailValid(email: String) -> Bool {
        return true
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        return true
    }
    

}
