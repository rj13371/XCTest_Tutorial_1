//
//  SignUpWebService.swift
//  XCTest Tutorial 1
//
//  Created by roland on 2025/05/10.
//

import Foundation

class SignUpWebService {
    
    private var urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    func signUp (withForm: SignUpFormRequestModel, completionHandler: @escaping (SignUpFormResponseModel?, SignUpErrors?) -> Void){
        
        guard let url = URL(string: urlString) else {
            //TODO Make unit test to sent error msg if url is nil
            return
        }
        
    }
    
}
