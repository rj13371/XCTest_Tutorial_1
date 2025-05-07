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
        
        if firstName.isEmpty{
            returnValue = false
        }
        
        return returnValue
    }
    
}
