//
//  File.swift
//  PhotoAppUTTests
//
//  Created by DHIKA ADITYA ARE on 17/11/22.
//

import Foundation
import XCTest
@testable import PhotoAppUT

class MockSignupViewDelegate: SignupViewDelegateProtocol {
    var expectation: XCTestExpectation?
    var successfullSignupCounter = 0
    var failedSignupCounter = 0
    var signupError: SignupErrors?
    
    func successfullSignup() {
        successfullSignupCounter += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: PhotoAppUT.SignupErrors) {
        failedSignupCounter += 1
        signupError = error
        expectation?.fulfill()
    }
}
