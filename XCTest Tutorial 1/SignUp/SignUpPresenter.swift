//
//  SignUpPresenter.swift
//  XCTest Tutorial 1
//
//  Created by roland on 2025/05/11.
//

import Foundation

class SignUpPresenter {
    
    private var formModelValidator: SignUpModelValidatorProtocol
    private var webservice : SignUpWebServiceProtocol
    private weak var mockSignUpViewDelegate : MockSignUpViewDelegateProtocol?
    
    init(formModelValidator: SignUpModelValidatorProtocol, webservice:SignUpWebServiceProtocol, mockSignUpViewDelegate: MockSignUpViewDelegateProtocol){
        self.formModelValidator = formModelValidator
        self.webservice = webservice
        self.mockSignUpViewDelegate = mockSignUpViewDelegate
    }
    
    func processUserSignUp (formModel: SignUpFormModel){
        
        if !formModelValidator.isFirstNameValid(firstName: formModel.firstName){
            return
        }
        
        do {
            if try !formModelValidator.isEmailValid(email: formModel.email) {
                return
            }
        } catch {
            return
        }
        
        if !formModelValidator.isPasswordValid(password: formModel.password){
            return
        }
        
        if !formModelValidator.doPasswordsMatch(password: formModel.password, repeatPassword: formModel.repeatPassword){
            return
        }
        let requestModel = SignUpFormRequestModel(firstName: formModel.firstName, lastName: formModel.lastName, email: formModel.email, password: formModel.password)
    
        webservice.signUp(withForm: requestModel) {[weak self] responseModel, error in
            
            if let error = error{
                self?.mockSignUpViewDelegate?.errorHandler(error: error)
                return
            }
            
            if let responseModel{
                self?.mockSignUpViewDelegate?.isSignUpMethodCalled()
                return
            }
        }
        
    }
    

}
