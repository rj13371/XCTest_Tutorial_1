//
//  MockSignUpWebService.swift
//  XCTest Tutorial 1
//
//  Created by roland on 2025/05/13.
//

import Foundation

@testable import XCTest_Tutorial_1

class MockSignUpWebService: SignUpWebServiceProtocol {
    
    var isSignUpMethodCalled: Bool = false
    
    func signUp(withForm formModel: XCTest_Tutorial_1.SignUpFormRequestModel, completionHandler: @escaping (XCTest_Tutorial_1.SignUpFormResponseModel?, XCTest_Tutorial_1.SignUpError?) -> Void) {
        isSignUpMethodCalled = true
        
        let responseModel = SignUpFormResponseModel(status: "ok")
        completionHandler(responseModel, nil)
    }


}
