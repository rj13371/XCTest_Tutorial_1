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
    
    func signUp (withForm formModel: SignUpFormRequestModel, completionHandler: @escaping (SignUpFormResponseModel?, SignUpErrors?) -> Void){
        
        guard let url = URL(string: urlString) else {
            //TODO Make unit test to sent error msg if url is nil
            return
        }
        
        var request = URLRequest(url: <#T##URL#>)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpBody = try? JSONEncoder().encode(formModel)
        
    }
    

    
}
