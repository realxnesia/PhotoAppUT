//
//  SignupPresenter.swift
//  PhotoAppUT
//
//  Created by DHIKA ADITYA ARE on 16/11/22.
//

import Foundation

class SignupPresenter: SignupPresenterProtocol {
    
    private var formModelValidator: SignupModelValidatorProtocol
    private var webService: SignupWebServiceProtocol
    private weak var delegate: SignupViewDelegateProtocol?
    
    required init(formModelValidator: SignupModelValidatorProtocol,
         webservice: SignupWebServiceProtocol,
         delegate: SignupViewDelegateProtocol) {
        self.formModelValidator = formModelValidator
        self.webService = webservice
        self.delegate = delegate
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
        
        let requestModel = SignupFormRequestModel(firstName: data.firstName,
                                                  lastName: data.lastName,
                                                  email: data.email,
                                                  password: data.password)
        
        webService.signup(withForm: requestModel) { [weak self] responseModel, error in
            //TODO: info -> untuk memastikan test kita passed, kita hanya perlu memanggil webservice methodnya
            if let _ = responseModel {
                self?.delegate?.successfullSignup()
                return
            } else {
                self?.delegate?.errorHandler(error: SignupErrors.failedRequest(description: "Failed by Dhika"))
                return
            }
        }
    }
    
}
