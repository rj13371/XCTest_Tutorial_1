//
//  SignUpModelValidatorProtocol.swift
//  XCTest Tutorial 1
//
//  Created by roland on 2025/05/11.
//

protocol SignUpModelValidatorProtocol {
    func isFirstNameValid(firstName: String) -> Bool
    
    func isPasswordValid(password: String) -> Bool
    
    func isEmailValid(email: String) throws -> Bool
    
    func doPasswordsMatch(password: String, repeatPassword:String) -> Bool
    
    
}
