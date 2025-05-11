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
        
    }
    
}
