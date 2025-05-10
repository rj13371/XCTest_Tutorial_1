//
//  SignUpFormRequestModel.swift
//  XCTest Tutorial 1
//
//  Created by roland on 2025/05/10.
//

import Foundation

struct SignUpFormRequestModel Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
