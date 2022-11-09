//
//  SignupFormModelValidator.swift
//  PhotoAppUT
//
//  Created by DHIKA ADITYA ARE on 07/11/22.
//

import Foundation

class SignupFormModelValidator {
    func isFirstnameValid(firstName: String) -> Bool {
        var returnValue = true
        
        if firstName.count < SignupConstants.firstNameMinLength || firstName.count > SignupConstants.firstNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func doPasswordMatch(password: String, repeatPassword: String) -> Bool {
        return password == repeatPassword
    }
}
