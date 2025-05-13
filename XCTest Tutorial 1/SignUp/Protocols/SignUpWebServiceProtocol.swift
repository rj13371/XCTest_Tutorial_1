//
//  File.swift
//  XCTest Tutorial 1
//
//  Created by roland on 2025/05/13.
//

import Foundation

protocol SignUpWebServiceProtocol {
    func signUp (withForm formModel: SignUpFormRequestModel, completionHandler: @escaping (SignUpFormResponseModel?, SignUpError?) -> Void)
}
