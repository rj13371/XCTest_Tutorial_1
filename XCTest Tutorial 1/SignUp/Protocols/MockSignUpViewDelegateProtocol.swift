//
//  File.swift
//  XCTest Tutorial 1
//
//  Created by roland on 2025/05/13.
//

import Foundation

protocol MockSignUpViewDelegateProtocol: AnyObject{
    
    func isSignUpMethodCalled()
    func errorHandler(error: SignUpError)

}
