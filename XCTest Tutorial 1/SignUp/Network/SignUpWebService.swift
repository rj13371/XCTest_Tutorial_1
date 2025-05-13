//
//  SignUpWebService.swift
//  XCTest Tutorial 1
//
//  Created by roland on 2025/05/10.
//

import Foundation

class SignUpWebService: SignUpWebServiceProtocol {
    
    private var urlSession: URLSession
    
    private var urlString: String
    
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func signUp (withForm formModel: SignUpFormRequestModel, completionHandler: @escaping (SignUpFormResponseModel?, SignUpError?) -> Void){
        
        guard let url = URL(string: urlString) else {
            completionHandler(nil,SignUpError.invalidRequestURLString)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpBody = try? JSONEncoder().encode(formModel)
        
        let dataTask = urlSession.dataTask(with: request){ (data, response, error) in
            
            if let data=data, let signUpResponseModel=try? JSONDecoder().decode(SignUpFormResponseModel.self, from: data){
                print("🔹 Raw response data:", String(data: data, encoding: .utf8) ?? "nil")
                completionHandler(signUpResponseModel, nil)
            }else{
                print("⚠️ Failed to decode SignUpFormResponseModel")
                completionHandler(nil,SignUpError.responseModelParsing)
            }
            
        }
        

        
        dataTask.resume()
        
    }
    

    
}
