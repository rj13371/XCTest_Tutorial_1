//
//  SignUpFormValidator.swift
//  XCTest Tutorial 1
//
//  Created by roland on 2025/05/07.
//

import Foundation

class SignUpFormValidator {
    
    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = true
        
        if firstName.count < SignUpConstants.firstNameMinimumLength || firstName.count > SignUpConstants.firstNameMaximumLength  {
            returnValue = false
        }
        
        return returnValue
    }
    
}
