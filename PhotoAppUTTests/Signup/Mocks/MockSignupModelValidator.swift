//
//  MockSignupModelValidator.swift
//  PhotoAppUTTests
//
//  Created by DHIKA ADITYA ARE on 16/11/22.
//

import Foundation
@testable import PhotoAppUT

class MockSignupModelValidator: SignupModelValidatorProtocol {
    var isFirstNameValidated: Bool = false
    var isLastNameValid: Bool = false
    var isValidEmailFormat: Bool = false
    var isPasswordValid: Bool = false
    var doPasswordMach: Bool = false
    
    func isFirstNameValid(firstName: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        isLastNameValid = true
        return isLastNameValid
    }
    
    func isValidEmailFormat(email: String) -> Bool {
        isValidEmailFormat = true
        return isValidEmailFormat
    }
    
    func isPasswordValid(password: String) -> Bool {
        isPasswordValid = true
        return isPasswordValid
    }
    
    func doPasswordMatch(password: String, repeatPassword: String) -> Bool {
        doPasswordMach = true
        return doPasswordMach
    }
}
