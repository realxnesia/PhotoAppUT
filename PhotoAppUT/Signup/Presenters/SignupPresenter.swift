//
//  SignupPresenter.swift
//  PhotoAppUT
//
//  Created by DHIKA ADITYA ARE on 16/11/22.
//

import Foundation

class SignupPresenter {
    
    private var formModelValidator: SignupModelValidatorProtocol
    
    init(formModelValidator: SignupModelValidatorProtocol) {
        self.formModelValidator = formModelValidator
    }
    
    func processUserSignup(with data: SignupFormModel) {
        if !formModelValidator.isFirstNameValid(firstName: data.firstName) { //kalau firstname tidak valid(sesuai sama test case fail)
            return 
        }
        
        if !formModelValidator.isLastNameValid(lastName: data.lastName) { //kalau firstname tidak valid(sesuai sama test case fail)
            return 
        }
        
        if !formModelValidator.isValidEmailFormat(email: data.email) {
            return
        }
        
        if !formModelValidator.isPasswordValid(password: data.password) {
            return
        }
        
        if !formModelValidator.doPasswordMatch(password: data.password, repeatPassword: data.repeatPassword) {
            return
        }
    }
}
