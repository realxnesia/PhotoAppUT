//
//  MockSignupWebService.swift
//  PhotoAppUTTests
//
//  Created by DHIKA ADITYA ARE on 16/11/22.
//

import Foundation
@testable import PhotoAppUT

class MockSignupWebService: SignupWebServiceProtocol {
    var isSignupMethodCalled: Bool = false
    var shouldReturnError: Bool = false
    
    func signup(withForm formModel: PhotoAppUT.SignupFormRequestModel, completion: @escaping (PhotoAppUT.SignupResponseModel?, PhotoAppUT.SignupErrors?) -> Void) {
        isSignupMethodCalled = true
        
        if shouldReturnError {
            completion(nil, .failedRequest(description: "Failed by d"))
        } else {
            let responseModelHC = SignupResponseModel(status: "Ok")
            completion(responseModelHC, nil)
        }
        
    }
}


class MockSignupWebServiceFailure: SignupWebServiceProtocol {
    var isSignupMethodCalled: Bool = false
    
    func signup(withForm formModel: PhotoAppUT.SignupFormRequestModel, completion: @escaping (PhotoAppUT.SignupResponseModel?, PhotoAppUT.SignupErrors?) -> Void) {
        isSignupMethodCalled = true
        
        completion(nil, .failedRequest(description: "Failed by d"))
    }
}
