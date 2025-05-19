//
//  SignUpErrors.swift
//  XCTest Tutorial 1
//
//  Created by roland on 2025/05/10.
//

enum SignUpError:Error, Equatable{
    case responseModelParsing
    case invalidRequestURLString
    case failedRequest (description: String)
    case illegalCharactersFound
}
