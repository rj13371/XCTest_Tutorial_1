//
//  MockSignUpViewDelegate.swift
//  XCTest Tutorial 1
//
//  Created by roland on 2025/05/13.
//

import Foundation
import XCTest

@testable import XCTest_Tutorial_1

class MockSignUpViewDelegate: MockSignUpViewDelegateProtocol {
    
    var expectation: XCTestExpectation?
    
    func isSignUpMethodCalled () {
        expectation?.fulfill()
    }
    
    func errorHandler (error: SignUpError){
        
    }
}
