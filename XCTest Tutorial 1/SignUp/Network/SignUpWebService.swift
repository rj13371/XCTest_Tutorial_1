//
//  SignUpWebService.swift
//  XCTest Tutorial 1
//
//  Created by roland on 2025/05/10.
//

import Foundation

class SignUpWebService {
    
    private var urlSession: URLSession
    
    private var urlString: String
    
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func signUp (withForm formModel: SignUpFormRequestModel, completionHandler: @escaping (SignUpFormResponseModel?, SignUpErrors?) -> Void){
        
        guard let url = URL(string: urlString) else {
            //TODO Make unit test to sent error msg if url is nil
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpBody = try? JSONEncoder().encode(formModel)
        
        let dataTask = URLSession.shared.dataTask(with: request){ (data, response, error) in
            
            if let data=data, let signUpResponseModel=try? JSONDecoder().decode(SignUpFormResponseModel.self, from: data){
                completionHandler(signUpResponseModel, nil)
            }else{
                //TODO MAKE UNIT TEST TO HANDLE ERROR
            }
            
        }
        

        
        dataTask.resume()
        
    }
    

    
}
