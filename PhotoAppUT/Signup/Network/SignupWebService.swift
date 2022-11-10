//
//  SignupWebService.swift
//  PhotoAppUT
//
//  Created by DHIKA ADITYA ARE on 09/11/22.
//

import Foundation

class SignupWebService {
    private var urlString: String
    private var urlSession: URLSession //Inject URL Session
    
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func signup(withForm formModel: SignupFormRequestModel, completion: @escaping (SignupResponseModel?, SignupErrors?) -> Void) {
        guard let url = URL(string: urlString) else {
            //TODO: Create a unit test to test that a spesific error message is returned is URL is nil
            return
        }
        //TODO: Prepare URL Request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        //headers
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpBody = try? JSONEncoder().encode(formModel) //pastikan formModel conform ke Encodale Protocol.
        
        //TODO: Send HTTP Request - Create Data task
        let dataTask = urlSession.dataTask(with: request) { data, response, error in
            //TODO: Write unit test to handle and error here
            if let data = data,
               let signupResponseModel = try? JSONDecoder().decode(SignupResponseModel.self, from: data) {
                completion(signupResponseModel, nil)
            } else {
                //TODO: Create unit test to handle an error here
                completion(nil, SignupErrors.responseModelParsingError)
            }
            
        }
        dataTask.resume()
    }
}
