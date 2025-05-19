//
//  SignUpFormValidator.swift
//  XCTest Tutorial 1
//
//  Created by roland on 2025/05/07.
//

import Foundation

class SignUpFormValidator: SignUpModelValidatorProtocol {
    
    
    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = true
        
        if firstName.count < SignUpConstants.firstNameMinimumLength || firstName.count > SignUpConstants.firstNameMaximumLength  {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isPasswordValid(password: String) -> Bool {
        var returnValue = true
        
        if (password.range(of: SignUpConstants.specialCharacterRegex, options: .regularExpression) == nil)  {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isEmailValid(email: String) throws -> Bool {
        if (email.contains("@") == false)  {
            throw SignUpError.illegalCharactersFound
        }else{
            return true
        }

    }
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        var returnValue = false
        
        if (password == repeatPassword )  {
            returnValue = false
        }
        
        return returnValue
    }
}
