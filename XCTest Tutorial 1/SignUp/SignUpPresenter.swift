//
//  SignUpPresenter.swift
//  XCTest Tutorial 1
//
//  Created by roland on 2025/05/11.
//

import Foundation

class SignUpPresenter {
    
    private var formModelValidator: SignUpModelValidatorProtocol
    
    init(formModelValidator: SignUpModelValidatorProtocol){
        self.formModelValidator = formModelValidator
    }
    
    func processUserSignUp (formModel: SignUpFormModel){
        
        if !formModelValidator.isFirstNameValid(firstName: formModel.firstName){
            return
        }
        
        if !formModelValidator.isEmailValid(email: formModel.email){
            return
        }
        
        if !formModelValidator.isPasswordValid(password: formModel.password){
            return
        }
        
        if !formModelValidator.doPasswordsMatch(password: formModel.password, repeatPassword: formModel.repeatPassword){
            return
        }
        
    }
    
}
